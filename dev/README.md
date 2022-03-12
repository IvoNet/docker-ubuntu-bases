# Ubuntu Development base

This image inherits from ivonet/ubuntu:18.04 and contains most tools needed for
building, compiling and making stuff.

Mainly meant as a builder image

e.g.

```Dockerfile
FROM ivonet/ubuntu:dev AS builder

# do your building stuff

FROM ivonet/ubuntu:18.04

# Do your image building stuff

COPY --from=builder SOME_BUILDER_STUFF IMAGE_LOCATION

# ETC.
```

Useful for keeping the images as small as possible