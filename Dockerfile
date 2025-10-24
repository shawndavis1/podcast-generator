FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Python 3.10, pip, compiler, and headers
RUN apt-get update && \
    apt-get install -y \
        python3.10 python3-pip python3.10-dev \
        build-essential git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Now PyYAML will build cleanly
RUN pip3 install --no-cache-dir PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]