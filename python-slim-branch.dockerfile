ARG packet_version=python:3.8-slim
FROM ${packet_version}

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ARG staticjinja_plus_branch=main

RUN apt-get update && \
    apt-get install -y --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


ADD https://github.com/MrDave/StaticJinjaPlus/archive/refs/heads/${staticjinja_plus_branch}.tar.gz staticjinja.tar.gz
RUN tar -xzf staticjinja.tar.gz && \
    rm staticjinja.tar.gz

WORKDIR /StaticJinjaPlus-${staticjinja_plus_branch}

RUN python -m pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]
