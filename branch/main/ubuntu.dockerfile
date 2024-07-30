ARG packet_version=ubuntu:22.04
FROM ${packet_version}

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && \
    apt-get install -y python3.8 python3.8-venv python3.8-dev python3.8-distutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


ADD https://github.com/MrDave/StaticJinjaPlus/archive/refs/heads/main.tar.gz staticjinja.tar.gz
RUN tar -xzf staticjinja.tar.gz && \
    rm staticjinja.tar.gz

WORKDIR /StaticJinjaPlus-main

RUN python3.8 -m venv .venv && \
    . .venv/bin/activate && \
    .venv/bin/pip install --no-cache-dir -r requirements.txt

CMD [".venv/bin/python", "main.py"]
