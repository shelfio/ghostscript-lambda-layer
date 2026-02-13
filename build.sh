#!/usr/bin/env bash
set -e

# Source version configuration
source "$(dirname "$0")/version.sh"

echo "Building Ghostscript ${GHOSTSCRIPT_VERSION} for x86_64 and ARM64..."
echo "Note: ARM64 builds require Docker with multi-platform  support (buildx)"

# Build for x86_64
echo ""
echo "Building x86_64 layer..."
docker build \
  --build-arg BASE_IMAGE=public.ecr.aws/lambda/provided:al2 \
  --build-arg GS_VERSION=${GHOSTSCRIPT_VERSION} \
  --build-arg GS_TAG=${GS_TAG} \
  -t gs-lambda-layer-x86_64 .
docker run --rm gs-lambda-layer-x86_64 cat /tmp/gs.zip > ./ghostscript-x86_64.zip
echo "✓ Created ghostscript-x86_64.zip"

# Build for ARM64
echo ""
echo "Building ARM64 layer..."
docker build \
  --build-arg BASE_IMAGE=public.ecr.aws/lambda/provided:al2-arm64 \
  --build-arg GS_VERSION=${GHOSTSCRIPT_VERSION} \
  --build-arg GS_TAG=${GS_TAG} \
  --platform linux/arm64 \
  -t gs-lambda-layer-arm64 .
docker run --rm --platform linux/arm64 gs-lambda-layer-arm64 cat /tmp/gs.zip > ./ghostscript-arm64.zip
echo "✓ Created ghostscript-arm64.zip"

echo ""
echo "Build complete! Generated files:"
ls -lh ghostscript-*.zip
