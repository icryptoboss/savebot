FROM python:3.10.4-slim-buster

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    bash \
    neofetch \
    ffmpeg \
    software-properties-common \
    build-essential \
    libssl-dev \
 && rm -rf /var/lib/apt/lists/*

# Copy requirements first for layer caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip wheel \
 && pip install --no-cache-dir -r requirements.txt

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Expose app port
EXPOSE 5000

# Start services
CMD flask run -h 0.0.0.0 -p 5000 & python3 -m devgagan
