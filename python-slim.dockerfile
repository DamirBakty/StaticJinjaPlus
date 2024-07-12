ARG packet_version=python:3.10-slim

FROM ${packet_version}

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code
COPY . /code

RUN apt-get update && \
    python -m pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]