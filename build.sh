#!/usr/bin/env bash
set -o errexit #abort if any command fails

MODE="$1"
TARGET_DOCS=""

if [ "$MODE" = "dev" ]; then
	TARGET_DOCS=../docs-dev
elif [ "$MODE" = "prod" ]; then
	TARGET_DOCS=../docs
fi

echo "*** Starting markdown build ***"

BUILD_DIR=$PWD

echo $PWD
cd $BUILD_DIR/swagger-gen
./generate_json.sh
./generate_yaml.sh

./create_markdown.sh
./publish_markdown.sh

if [ -n "$TARGET_DOCS" ]; then
	echo "*** Building ($MODE): $TARGET_DOCS ***"

	cd "$BUILD_DIR/slate"
	./build.sh "$TARGET_DOCS"
else
	echo "*** Not generating static docs (pass 'dev' or 'prod' as first arg if docs needed) ***"
fi

echo "*** Markdown build complete ***"
echo "*** To test the build execute run.sh in the slate dir ***"
