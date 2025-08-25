FROM python:3.10-slim-bullseye

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    wget \
    bash \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements first for caching
COPY requirements.txt .

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip wheel \
 && pip install --no-cache-dir -U -r requirements.txt

# Copy project files
COPY . .

# Expose port for Render web service
EXPOSE 5000

# Start Flask and bot together
CMD bash -c "flask run -h 0.0.0.0 -p 5000 & python3 -m devgagan"
