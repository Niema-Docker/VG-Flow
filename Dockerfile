# Minimal Docker image for VG-Flow using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install VG-Flow
RUN apk update && \
    apk add bash g++ linux-headers musl-dev py3-pip python3 python3-dev && \
    wget -qO- "https://bitbucket.org/jbaaijens/vg-flow/get/v0.0.4.tar.gz" | tar -zx && \
    mv jbaaijens-vg-flow-* /usr/local/bin/vg-flow && \
    chmod a+x /usr/local/bin/vg-flow/scripts/*.py && \
    for f in /usr/local/bin/vg-flow/scripts/*.py ; do ln -s $f /usr/local/bin/$(echo $f | rev | cut -d'/' -f1 | rev) ; done && \
    pip install numpy
    # TODO CONTINUE HERE
