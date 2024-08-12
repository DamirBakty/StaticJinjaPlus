ARG packet_version=python:3.8-slim
FROM ${packet_version}

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ARG staticjinja_plus_branch=main


ADD https://github.com/MrDave/StaticJinjaPlus/archive/refs/heads/${staticjinja_plus_branch}.tar.gz /StaticJinjaPlus.tar.gz

RUN mkdir /StaticJinjaPlus && tar -xzf /StaticJinjaPlus.tar.gz -C /StaticJinjaPlus --strip-components=1

WORKDIR /StaticJinjaPlus

RUN python -m pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]
