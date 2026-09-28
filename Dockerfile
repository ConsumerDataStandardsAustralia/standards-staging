FROM ubuntu:20.04

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
RUN git clone https://github.com/rbenv/rbenv.git $RBENV_ROOT \
 && git clone https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build

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
 https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/${OPENAPI_VERSION}/openapi-generator-cli-${OPENAPI_VERSION}.jar

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
RUN bash -euxo pipefail ./build.sh dev

# ----------------------------------------------------
# Copy generated site to nginx
# ----------------------------------------------------
RUN rm -rf /var/www/html/* \
 && cp -R /opt/standards/docs-dev/. /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]