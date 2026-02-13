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
| v10.06.0    | 18             | 1             | 19               | 1               |
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

## Update

1. Change version numbers in the `version.sh` file (GHOSTSCRIPT_VERSION and GS_TAG)
2. Run `./build.sh` script which will produce `ghostscript-x86_64.zip` and `ghostscript-arm64.zip` files in the root of the project
3. Update the version table in this README with the new layer version numbers
4. Commit & Create a Pull Request
5. After merging, a new layer version will be published by the CI automatically

## License

MIT © [Shelf](https://shelf.io)
