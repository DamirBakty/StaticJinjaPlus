ARG packet_version=ubuntu:latest

FROM ${packet_version}

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /code
COPY . /code

RUN apt-get update && \
    apt-get install -y python3 python3-venv python3-pip && \
    python3 -m venv .venv

RUN .venv/bin/pip install --no-cache-dir -r requirements.txt

CMD [".venv/bin/python", "main.py"]