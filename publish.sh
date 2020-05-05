#!/usr/bin/env bash

GHOSTSCRIPT_VERSION=9.52
LAYER_NAME='ghostscript'
LAYER_VERSION=$(
  aws lambda publish-layer-version --region "$TARGET_REGION" \
    --layer-name $LAYER_NAME \
    --zip-file fileb:///home/circleci/project/ghostscript.zip \
    --description "Ghostscript v${GHOSTSCRIPT_VERSION}" \
    --query Version \
    --output text
)

aws lambda add-layer-version-permission \
  --region "$TARGET_REGION" \
  --layer-name $LAYER_NAME \
  --statement-id sid1 \
  --action lambda:GetLayerVersion \
  --principal '*' \
  --query Statement \
  --output text \
  --version-number "$LAYER_VERSION"
