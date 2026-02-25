FROM python:3.13-slim

WORKDIR /app

RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip "wheel>=0.46.2" "jaraco.context>=6.1.0" && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

COPY . .

CMD ["python", "main.py"]