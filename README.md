# java-runner

This is a docker that extends mkunze/openjdk-alpine:11 with some tools i use for gitlab-ci

## Usage

You can use ``setup_ssh.sh s3-bucket-name/path/to/priv/key`` to setup the ssh-agent. After that you can easily connect via ssh to your favorite server.

Best used with [https://github.com/GoogleContainerTools/jib/tree/master/jib-gradle-plugin](jib)

```
jib {
    from {
         image = "mkunze/openjdk-alpine:11"
   }
    to {
        image = "<account>.dkr.ecr.<region>.amazonaws.com/<repository>"
    }
    container {
        mainClass = "com.example.Startup"
    }
}
```
