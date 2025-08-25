FROM python:3.10-slim-bullseye

# Install packages in one layer and clean cache
RUN apt-get update && apt-get install -y git curl ffmpeg wget bash \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .

RUN pip install --upgrade pip wheel \
 && pip install --no-cache-dir -U -r requirements.txt

COPY . .

CMD ["python3", "-m", "devgagan"]
