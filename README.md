# ghostscript-lambda-layer
> Ghostscript AWS Lambda layer

[sina-masnadi/lambda-ghostscript](https://github.com/sina-masnadi/lambda-ghostscript) published as a Lambda layer

## Getting Started

Click on Layers and choose "Add a layer", and "Provide a layer version
ARN" and enter the following ARN.

```
arn:aws:lambda:us-east-1:764866452798:layer:ghostscript:1
```

Current version of Ghostscript is `9.20`

## Available regions

* ap-northeast-1
* ap-northeast-2
* ap-south-1
* ap-southeast-1
* ap-southeast-2
* ca-central-1
* eu-north-1
* eu-central-1
* eu-west-1
* eu-west-2
* eu-west-3
* sa-east-1
* us-east-1
* us-east-2
* us-west-1
* us-west-2

## Update

1. Clone https://github.com/sina-masnadi/lambda-ghostscript repository
2. Create zip archive of Ghostscript binaries with the filename `ghostscript.zip`
3. Put zip archive into this repo
3. Put proper version inside of `publish.sh`
4. Commit & Create Pull Request

## License

MIT © [Shelf](https://shelf.io)
