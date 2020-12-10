# ubuntu-pyenv

This builds a container over `ubuntu:20.10`. This helps with GLIBC_2.29 errors encountered when using rust bindings for python.

```text
apt-get: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.29' not found ...
```

The image built from this dockerfile will also ship [`pyenv`](https://github.com/pyenv/pyenv), referencing this base 
image would therefore make using different python versions easier by using:

```dockerfile
FROM ltbringer/eoan-pyenv:TAG

ENV PYTHON_VERSION=3.6.5
RUN pyenv install $PYTHON_VERSION && pyenv global $PYTHON_VERSION
```

## Notes
The dependencies install `tzdata` which requires an interactive interface to set timezone info. I have used:
```dockerfile
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
``` 
To serve my purpose, be aware of time related pitfalls.

## Dockerhub
The image can be accessed via Dockerhub like so:
```
docker pull ltbringer/eoan-pyenv:latest
```
