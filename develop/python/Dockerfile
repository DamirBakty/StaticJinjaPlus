ARG packet_version=python:3.8-slim
FROM ${packet_version}

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ARG staticjinja_plus_branch=main


ADD https://github.com/MrDave/StaticJinjaPlus.git /StaticJinjaPlus

WORKDIR /StaticJinjaPlus

RUN python -m pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]
