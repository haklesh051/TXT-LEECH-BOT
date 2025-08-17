FROM python:3.10-slim-bullseye

# Install system dependencies including ffmpeg
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    gcc \
    libffi-dev \
    musl-dev \
    ffmpeg \
    aria2 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

CMD ["python3", "main.py"]
