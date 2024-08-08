ARG packet_version=python:3.8-slim
FROM ${packet_version}

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ARG staticjinja_plus_version=0.1.0

ARG hash_sum=0

ADD --checksum=sha256:${hash_sum} https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/${staticjinja_plus_version}.tar.gz staticjinja.tar.gz
RUN tar -xzf staticjinja.tar.gz && \
    rm staticjinja.tar.gz

WORKDIR /StaticJinjaPlus-${staticjinja_plus_version}

RUN python -m pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]
