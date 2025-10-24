FROM ubuntu:latest

RUN apt-get update && \ 
    python3.10 python3-pip python3.10-dev build-essential git

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]