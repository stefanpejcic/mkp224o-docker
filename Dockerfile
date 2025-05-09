FROM debian:bookworm
LABEL maintainer="Stefan Pejcic <stefan@pejcic.rs>"

# Install build dependencies
RUN apt-get update && apt-get install -y \
    git gcc libc6-dev libsodium-dev make autoconf \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt

# Clone and build mkp224o
RUN git clone https://github.com/cathugger/mkp224o.git && \
    cd mkp224o && \
    ./autogen.sh && \
    ./configure && \
    make

VOLUME ["/output"]

ENTRYPOINT ["/opt/mkp224o/mkp224o"]
