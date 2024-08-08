ARG version=22.04
FROM ubuntu:${version}

ENV DEBIAN_FRONTEND=noninteractive

ARG staticjinja_plus_branch=main

RUN apt-get update -y \
    && apt-get install -y python3 python3-venv \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/MrDave/StaticJinjaPlus.git /StaticJinjaPlus

WORKDIR /StaticJinjaPlus

RUN python3 -m venv .venv && \
    . .venv/bin/activate && \
    .venv/bin/pip install --no-cache-dir -r requirements.txt

CMD [".venv/bin/python", "main.py"]
