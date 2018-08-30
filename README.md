
## Usage

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
