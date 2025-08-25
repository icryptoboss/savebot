FROM python:3.10.4-slim-buster

# Update and install only valid packages
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    wget \
    bash \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

# Upgrade pip + install Python dependencies
RUN pip install --upgrade pip wheel \
 && pip install --no-cache-dir -U -r requirements.txt

WORKDIR /app
COPY . .

EXPOSE 5000

CMD python3 -m devgagan
