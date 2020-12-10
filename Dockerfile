FROM ubuntu:19.10

RUN apt-get update

# ---------------------------------------------------------------------------------------------------
# Installation of `tzdata` requires an interactive console. We disable it and provide the tz info
# like so:
# ---------------------------------------------------------------------------------------------------
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
# ---------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------
# These dependencies are for installing pyenv.
# - ca-certificates allows git clone via https and also important for python version installs
#   via pyenv
# ---------------------------------------------------------------------------------------------------
RUN apt-get install -y --no-install-recommends gcc g++ wget curl git make build-essential \ 
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev  \
    xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev ca-certificates
# ---------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------
# Setup PATH and ENV vars for pyenv.
# ---------------------------------------------------------------------------------------------------
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
# ---------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------------------------------
# Install pyenv.
# ---------------------------------------------------------------------------------------------------
RUN git clone https://github.com/pyenv/pyenv.git /root/.pyenv && \
    cd /root/.pyenv && \
    git checkout `git describe --abbrev=0 --tags`
# ---------------------------------------------------------------------------------------------------

CMD ["/bin/bash"]
