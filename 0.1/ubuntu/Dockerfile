ARG version=22.04
FROM ubuntu:${version}

ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update -y \
    && apt-get install -y python3 python3-venv curl

ARG staticjinja_plus_version=0.1.0

RUN sum=$(curl -sL https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/${staticjinja_plus_version}.tar.gz | sha256sum | awk '{print $1}')

ADD --checksum=sha256:${sum} https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/${staticjinja_plus_version}.tar.gz staticjinja.tar.gz
RUN tar -xzf staticjinja.tar.gz && \
    rm staticjinja.tar.gz


ARG git_username="john"
ARG git_email="email@example.com"

RUN git config --global user.name ${git_username} \
    && git config --global user.email ${git_email}

WORKDIR /StaticJinjaPlus-${staticjinja_plus_version}

RUN python3 -m venv .venv && \
    . .venv/bin/activate && \
    .venv/bin/pip install --no-cache-dir -r requirements.txt

CMD [".venv/bin/python", "main.py"]
