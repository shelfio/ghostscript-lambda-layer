# Ghostscript for AWS Lambda as a Layer

## Getting Started

Click on Layers and choose "Add a layer", and "Provide a layer version ARN" and enter the following ARN.

### For x86_64 (Intel/AMD) architectures:
```
arn:aws:lambda:<YOUR REGION>:764866452798:layer:ghostscript:<VERSION>
```

### For ARM64 (Graviton2) architectures:
```
arn:aws:lambda:<YOUR REGION>:764866452798:layer:ghostscript-arm64:<VERSION>
```

**Note:** ARM64 provides better price-performance ratio for Lambda functions. Consider using ARM64 for new projects.

Works with the following [AWS Lambda runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) which
run on Amazon Linux 2:

- nodejs20.x, nodejs18.x, nodejs16.x
- python3.12, python3.11, python3.10, python3.9, python3.8
- java21, java17, java11
- provided.al2, provided.al2023

## Version Numbers

| Ghostscript | x86_64 VERSION | ARM64 VERSION | eu-west-3 x86_64 | eu-west-3 ARM64 |
|-------------|----------------|---------------|------------------|-----------------|
| v10.06.0    | TBD            | TBD           | TBD              | TBD             |
| v10.04.0    | 17             | -             | 18               | -               |
| v10.02.0    | 15             | -             | 16               | -               |
| v10.0.0     | 13             | -             | 14               | -               |
| v9.56.1     | 12             | -             | 13               | -               |
| v9.55.0     | 9              | -             | 10               | -               |
| v9.52.0     | 8              | -             | 9                | -               |
| v9.50.0     | 6              | -             | 7                | -               |
| v9.20.0     | 1              | -             | 1                | -               |

## Where can I find the Ghostscript binary inside of Lambda after I attach the layer?

You can find it at `/opt/bin/gs` (`/opt` is where Lambda unpacks layers).

You can run `/opt/bin/gs --version` to make sure Ghostscript is up and running.

## Building Locally

### Requirements
- Docker with multi-platform support (Docker Desktop includes buildx by default)
- For ARM64 builds: Docker buildx must be enabled

### Build Process
Run the build script to create both architecture variants:
```bash
./build.sh
```

This will produce:
- `ghostscript-x86_64.zip` - x86_64 architecture
- `ghostscript-arm64.zip` - ARM64 architecture

### Publishing Locally
To publish layers manually (requires AWS credentials and proper permissions):
```bash
export TARGET_REGION="us-east-1"
export BASE_DIR="$(pwd)"  # Optional: defaults to current directory
./publish.sh
```

## Updating to a New Ghostscript Version

1. Change version numbers in the `version.sh` file (GHOSTSCRIPT_VERSION and GS_TAG)
2. Test locally by running `./build.sh` to produce both zip files
3. Verify the builds: `unzip -l ghostscript-x86_64.zip` and `unzip -l ghostscript-arm64.zip`
4. Publish the new layers using `./publish.sh` (set TARGET_REGION and BASE_DIR as needed)
5. Update the version table in this README with the new layer version numbers

## License

MIT © [Shelf](https://shelf.io)
