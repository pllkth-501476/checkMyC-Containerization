# --------------------------------------------------
# Base Image
# --------------------------------------------------
FROM python:3.12-slim

# --------------------------------------------------
# Image Metadata
# --------------------------------------------------
LABEL maintainer="Kavitha Pillala"
LABEL project="checkMyC Containerization"
LABEL description="Containerized C Program Evaluation Framework"
LABEL version="1.0"

# --------------------------------------------------
# Python Configuration
# --------------------------------------------------
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# --------------------------------------------------
# Working Directory
# --------------------------------------------------
WORKDIR /app

# --------------------------------------------------
# Install Linux Runtime Dependencies
# --------------------------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        git \
        curl \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*
# --------------------------------------------------
# Install uv
# --------------------------------------------------
COPY --from=ghcr.io/astral-sh/uv:0.12.1 /uv /uvx /bin/