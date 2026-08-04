FROM python:3.12-slim

# ----------------------------
# Image metadata
# ----------------------------
LABEL maintainer="Kavitha Pillala"
LABEL project="checkMyC Containerization"
LABEL version="1.0"
LABEL description="Secure and reproducible containerized framework for automated C program evaluation"

# ----------------------------
# Python configuration
# ----------------------------
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# ----------------------------
# Working directory
# ----------------------------
WORKDIR /app

# ----------------------------
# Install Linux dependencies
# ----------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        curl \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*
# ----------------------------
# Install uv
# ----------------------------
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# ----------------------------
# Copy dependency files
# ----------------------------
COPY pyproject.toml uv.lock ./
