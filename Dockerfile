FROM ubuntu:20.04 AS build

# dev -> docs-dev, prod -> docs (mapping lives in build.sh)
ARG BUILD_MODE=dev

ENV DEBIAN_FRONTEND=noninteractive
ENV RBENV_ROOT=/root/.rbenv
ENV PATH="$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH"

ENV OPENAPI_VERSION=6.6.0
ENV OPENAPI_DIR=/root/openapi-codegen
ENV OPENAPI_JAR=/root/openapi-codegen/openapi-generator-cli.jar

WORKDIR /opt/standards

# ----------------------------------------------------
# System dependencies
# ----------------------------------------------------
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    wget \
    unzip \
    autoconf \
    bison \
    libtool \
    pkg-config \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libyaml-dev \
    libffi-dev \
    libgdbm-dev \
    libncurses5-dev \
    libsqlite3-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libxslt1-dev \
    nodejs \
    npm \
    default-jre \
    nginx \
    xz-utils \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ----------------------------------------------------
# Install rbenv
# ----------------------------------------------------
RUN git clone --branch v1.3.2 --depth 1 https://github.com/rbenv/rbenv.git $RBENV_ROOT \
    && git clone --branch v20260716 --depth 1 https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build

# ----------------------------------------------------
# Install Ruby 2.6.3
# ----------------------------------------------------
RUN bash -lc "rbenv install 2.6.3 && rbenv global 2.6.3"

# ----------------------------------------------------
# Initial Bundler install
# ----------------------------------------------------
RUN bash -lc "gem install bundler -v 2.3.26"

# Sanity check
RUN bash -lc "ruby -v && bundler -v"

# ----------------------------------------------------
# OpenAPI Generator
# ----------------------------------------------------
RUN mkdir -p ${OPENAPI_DIR} \
    && wget -O ${OPENAPI_JAR} \
    https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/${OPENAPI_VERSION}/openapi-generator-cli-${OPENAPI_VERSION}.jar \
    && echo "9718ff7844e89462c75dcd9b20a35136f6db257bfe1b874db1e3002e99de4609  ${OPENAPI_JAR}" | sha256sum -c -

# ----------------------------------------------------
# Ruby compatibility gems
# ----------------------------------------------------
RUN gem install ffi -v 1.15.5 --no-document

RUN gem uninstall bundler -a -x || true \
    && gem install bundler -v 1.17.3 --no-document

# ----------------------------------------------------
# Copy Gemfiles first for Docker layer caching
# ----------------------------------------------------
COPY slate/Gemfile slate/Gemfile.lock ./

# ----------------------------------------------------
# Install Ruby dependencies
# ----------------------------------------------------
RUN bundle _1.17.3_ install --jobs 4 --retry 3

# ----------------------------------------------------
# Copy application
# ----------------------------------------------------
COPY . .

# ----------------------------------------------------
# Install Node dependencies
# ----------------------------------------------------
RUN npm install --prefix ./swagger-gen/widdershins-cdr

# ----------------------------------------------------
# Build documentation
# ----------------------------------------------------
RUN case "${BUILD_MODE}" in \
    dev)  OUT=docs-dev ;; \
    prod) OUT=docs ;; \
    *) echo "BUILD_MODE must be 'dev' or 'prod' (got '${BUILD_MODE}')" >&2; exit 1 ;; \
    esac \
    && bash -euxo pipefail ./build.sh "${BUILD_MODE}" \
    && mkdir -p /opt/output \
    && cp -R "/opt/standards/${OUT}" "/opt/output/${OUT}"

# ----------------------------------------------------
# Export stage: docker build --target export --output type=local,dest=. .
# ----------------------------------------------------
FROM scratch AS export
COPY --from=build /opt/output/ /

# ----------------------------------------------------
# Serve stage (default): copy generated site to nginx
# ----------------------------------------------------
FROM build AS serve
RUN rm -rf /var/www/html/* \
    && cp -R /opt/output/*/. /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]