#!/usr/bin/env bash
set -euo pipefail

# location of codegen install
OAS_CODEGEN=$HOME/openapi-codegen

# single source of truth (IMPORTANT)
OAS_JAR="$OAS_CODEGEN/openapi-generator-cli.jar"

# output location
SWAGGER_CODEGEN_OUTPUT="$(cd "$(dirname "$0")/.." && pwd)/temp_cds_swagger_gen"

INPUT_SWAGGER="$1"
OUTPUT_FORMAT="$2"
OUTPUT_EXT="$3"
OUTPUT_DIR="$4"

echo "*** Input Swagger: $INPUT_SWAGGER"
echo "*** Output Format: $OUTPUT_FORMAT"
echo "*** Output Extension: $OUTPUT_EXT"
echo "*** Output Dir: $OUTPUT_DIR"

mkdir -p "$SWAGGER_CODEGEN_OUTPUT"

# -----------------------------
# Validate spec
# -----------------------------
echo "*** Checking OAS Validator ***"
java -jar "$OAS_JAR" validate -i "$INPUT_SWAGGER"
echo "*** OAS Validator OK ***"

# -----------------------------
# Generate
# -----------------------------
echo "*** Generating $OUTPUT_FORMAT"

java -jar "$OAS_JAR" generate \
  -i "$INPUT_SWAGGER" \
  -g "$OUTPUT_FORMAT" \
  -o "$SWAGGER_CODEGEN_OUTPUT" \
  > "$SWAGGER_CODEGEN_OUTPUT/log.txt" 2>&1 || {
    echo "*** GENERATION FAILED ***"
    cat "$SWAGGER_CODEGEN_OUTPUT/log.txt"
    exit 1
}

# -----------------------------
# Output handling
# -----------------------------
FILENAME=$(basename "$INPUT_SWAGGER" .json)
OUTFILE="${FILENAME}.${OUTPUT_EXT}"

echo "*** Moving to output dir $OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

if [ "$OUTPUT_EXT" == "yaml" ]; then
    cp "$SWAGGER_CODEGEN_OUTPUT/openapi/openapi.$OUTPUT_EXT" "$OUTPUT_DIR/$OUTFILE"
else
    cp "$SWAGGER_CODEGEN_OUTPUT/openapi.$OUTPUT_EXT" "$OUTPUT_DIR/$OUTFILE"
fi

echo "*** Outfile: $OUTPUT_DIR/$OUTFILE"

# -----------------------------
# cleanup
# -----------------------------
rm -rf "$SWAGGER_CODEGEN_OUTPUT"

echo "*** Complete ***"
echo
