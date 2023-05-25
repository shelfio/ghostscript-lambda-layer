# Ghostscript for AWS Lambda as a Layer

## Getting Started

Click on Layers and choose "Add a layer", and "Provide a layer version ARN" and enter the following ARN.

```
arn:aws:lambda:<YOUR REGION>:764866452798:layer:ghostscript:<VERSION>
```

Works with the following [AWS Lambda runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) which
run on Amazon Linux 2:

- nodejs16.x, nodejs14.x, nodejs12.x, nodejs10.x
- python3.8
- java11

## Version Numbers

| Ghostscript | VERSION  | eu-west-3 |
| ----------- |----------|-----------|
| v10.0.0     | 13       | 14        |
| v9.56.1     | 12       | 13        |
| v9.55.0     | 9        | 10        |
| v9.52.0     | 8        | 9         |
| v9.50.0     | 6        | 7         |
| v9.20.0     | 1        | 1         |

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
