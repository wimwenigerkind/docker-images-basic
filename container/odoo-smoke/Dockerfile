FROM python:3.13-slim

ENV LANG C.UTF-8

ARG TARGETARCH

RUN apt update && \
    apt install -y \
    postgresql \
    libxml2 \
    libxslt1-dev \
    build-essential \
    python3-dev \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libpq-dev \
    libldap2-dev \
    libsasl2-dev \
    python3-lxml \
    libcairo2 \
    libcairo2-dev \
    pkg-config \
    python3-cairo \
    fontconfig \
    libxrender1 \
    xfonts-75dpi \
    xfonts-base \
    curl \
    && \
    WKHTMLTOPDF_ARCH=${TARGETARCH} && \
    case ${TARGETARCH} in \
        "amd64" | "") WKHTMLTOPDF_ARCH=amd64 && WKHTMLTOPDF_SHA=689ea8c29dc8501ab37daec6bb27c9d706151dda ;; \
        "arm64")    WKHTMLTOPDF_SHA=5824d4468dee2d3aa2662f63936e8d9e674fd7a8 ;; \
        "ppc64le")  WKHTMLTOPDF_ARCH=ppc64el && WKHTMLTOPDF_SHA=1eae61ef2e5e3684c6082310c958acffa2567421 ;; \
    esac \
    && curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.bookworm_${WKHTMLTOPDF_ARCH}.deb \
    && apt-get install -y --no-install-recommends ./wkhtmltox.deb \
    && rm -rf /var/lib/apt/lists/* wkhtmltox.deb