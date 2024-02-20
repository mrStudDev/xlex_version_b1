# Base Image
FROM python:3.9-alpine

# Working Directory
WORKDIR /app

# System Dependencies
RUN apk update && apk add --no-cache \
    gcc \
    musl-dev \
    postgresql-dev \
    libffi-dev \
    jpeg-dev \
    zlib-dev \
    curl && \
    rm -rf /var/cache/apk/*

# Python Dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy Project Files
COPY . .

# Start Command
CMD ["gunicorn", "-b", "0.0.0.0:8000", "xlexapp.wsgi:application"]
