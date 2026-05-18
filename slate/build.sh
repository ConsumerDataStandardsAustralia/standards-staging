#!/usr/bin/env bash

TARGET_DOCS="$1"

echo "*** Building Slate Docs ***"

if [ -n "$TARGET_DOCS" ]; then
	TARGET_DOCS="$TARGET_DOCS" bundle exec middleman build --clean
	echo "*** Built docs in: $TARGET_DOCS ***"
else
	bundle exec middleman build --clean
	echo "*** Built docs in default folder (config.rb build_dir)  ***"
fi

echo "*** Slate Docs Build Complete ***"
