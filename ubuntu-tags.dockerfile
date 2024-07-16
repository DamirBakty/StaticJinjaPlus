ARG packet_version=ubuntu:latest
FROM ${packet_version}

ENV DEBIAN_FRONTEND=noninteractive

ARG staticjinja_plus_version=0.1.0

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.8 python3.8-venv python3.8-dev python3.8-distutils curl unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/${staticjinja_plus_version}.zip -o staticjinja.zip && \
    unzip staticjinja.zip && \
    rm staticjinja.zip

WORKDIR /StaticJinjaPlus-${staticjinja_plus_version}

RUN python3.8 -m venv .venv && \
    . .venv/bin/activate && \
    .venv/bin/pip install --no-cache-dir -r requirements.txt

CMD [".venv/bin/python", "main.py"]
