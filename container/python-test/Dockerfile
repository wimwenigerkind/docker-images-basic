ARG PYTHON_VERSION=3.13
FROM python:${PYTHON_VERSION}-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends make build-essential ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir coverage