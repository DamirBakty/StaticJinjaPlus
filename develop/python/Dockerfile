ARG packet_version=python:3.8-slim
FROM ${packet_version}

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


ADD https://github.com/MrDave/StaticJinjaPlus.git /StaticJinjaPlus

ARG git_username="john"
ARG git_email="email@example.com"

RUN git config --global user.name ${git_username} \
    && git config --global user.email ${git_email} \

WORKDIR /StaticJinjaPlus

RUN python -m pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]
