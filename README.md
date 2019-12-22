# Ghostscript for AWS Lambda as a Layer

## Getting Started

Click on Layers and choose "Add a layer", and "Provide a layer version
ARN" and enter the following ARN.

```
arn:aws:lambda:us-east-1:764866452798:layer:ghostscript:1
```

| Layer ARN                                                 | Ghostscript Version                                                      |
| --------------------------------------------------------- | ------------------------------------------------------------------------ |
| arn:aws:lambda:us-east-1:764866452798:layer:ghostscript:1 | [9.20](https://www.ghostscript.com/doc/current/History9.htm#Version9.20) |

## Available regions

- ap-northeast-1
- ap-northeast-2
- ap-south-1
- ap-southeast-1
- ap-southeast-2
- ca-central-1
- eu-north-1
- eu-central-1
- eu-west-1
- eu-west-2
- eu-west-3
- sa-east-1
- us-east-1
- us-east-2
- us-west-1
- us-west-2

## Where can I find the Ghostscript binary inside of Lambda after I attach the layer?

You can find it at `/opt/bin/gs` (`/opt` is where Lambda unpacks layers).

You can run `/opt/bin/gs --version` to make sure Ghostscript is up and running.

## Update

1. Change version number & git tag in the `Dockerfile`
2. Run `./build.sh` script which will produce `ghostscript.zip` file
3. Change version number in the `publish.sh`
4. Commit & Create a Pull Request
5. After merging, a new layer version will be published by the CI automatically

## License

MIT © [Shelf](https://shelf.io)
