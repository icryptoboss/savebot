FROM python:3.10.4-slim-buster

# Update and install packages (no upgrade)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    python3-pip \
    ffmpeg \
    wget \
    bash \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip3 install --upgrade pip wheel \
 && pip3 install --no-cache-dir -U -r requirements.txt

WORKDIR /app
COPY . .

EXPOSE 5000

CMD python3 -m devgagan
