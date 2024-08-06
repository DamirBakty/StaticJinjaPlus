ARG version=22.04
FROM ubuntu:${version}

ENV DEBIAN_FRONTEND=noninteractive

ARG staticjinja_plus_branch=main

RUN apt-get update -y \
    && apt-get install -y python3 python3-venv


ADD https://github.com/MrDave/StaticJinjaPlus.git /StaticJinjaPlus

ARG git_username="john"
ARG git_email="email@example.com"

RUN git config --global user.name ${git_username} \
    && git config --global user.email ${git_email} \

WORKDIR /StaticJinjaPlus

RUN python3 -m venv .venv && \
    . .venv/bin/activate && \
    .venv/bin/pip install --no-cache-dir -r requirements.txt

CMD [".venv/bin/python", "main.py"]
