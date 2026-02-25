FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install --upgrade wheel "jaraco.context>=6.1.0"

EXPOSE 8000

COPY . .

CMD ["python", "main.py"]