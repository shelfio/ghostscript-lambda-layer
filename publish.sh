#!/usr/bin/env bash
set -e

# Source version configuration
source "$(dirname "$0")/version.sh"

# Determine the base directory (for CI or local execution)
BASE_DIR="${BASE_DIR:-$(pwd)}"

echo "Publishing Ghostscript ${GHOSTSCRIPT_VERSION} layers..."

# Publish x86_64 layer
echo "Publishing x86_64 layer..."
LAYER_NAME='ghostscript'
LAYER_VERSION_X86=$(
  aws lambda publish-layer-version --region "$TARGET_REGION" \
    --layer-name $LAYER_NAME \
    --zip-file fileb://${BASE_DIR}/ghostscript-x86_64.zip \
    --description "Ghostscript v${GHOSTSCRIPT_VERSION} (x86_64)" \
    --compatible-architectures "x86_64" \
    --query Version \
    --output text
)

aws lambda add-layer-version-permission \
  --region "$TARGET_REGION" \
  --layer-name $LAYER_NAME \
  --statement-id public-access-x86 \
  --action lambda:GetLayerVersion \
  --principal '*' \
  --query Statement \
  --output text \
  --version-number "$LAYER_VERSION_X86"

echo "Published ${LAYER_NAME} version ${LAYER_VERSION_X86} (x86_64)"

# Publish ARM64 layer
echo "Publishing ARM64 layer..."
LAYER_NAME_ARM='ghostscript-arm64'
LAYER_VERSION_ARM=$(
  aws lambda publish-layer-version --region "$TARGET_REGION" \
    --layer-name $LAYER_NAME_ARM \
    --zip-file fileb://${BASE_DIR}/ghostscript-arm64.zip \
    --description "Ghostscript v${GHOSTSCRIPT_VERSION} (ARM64)" \
    --compatible-architectures "arm64" \
    --query Version \
    --output text
)

aws lambda add-layer-version-permission \
  --region "$TARGET_REGION" \
  --layer-name $LAYER_NAME_ARM \
  --statement-id public-access-arm64 \
  --action lambda:GetLayerVersion \
  --principal '*' \
  --query Statement \
  --output text \
  --version-number "$LAYER_VERSION_ARM"

echo "Published ${LAYER_NAME_ARM} version ${LAYER_VERSION_ARM} (ARM64)"
echo "All layers published successfully!"
