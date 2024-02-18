# Assume que você está usando uma imagem base do Python que é Alpine
FROM python:3.9-alpine

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Instala dependências necessárias, incluindo as bibliotecas de desenvolvimento necessárias para psycopg2
RUN apk update && apk add --no-cache \
    gcc \
    musl-dev \
    postgresql-dev \
    libffi-dev \
    jpeg-dev \
    zlib-dev \
    curl

# Copia os requisitos do projeto e instala as dependências do Python
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copia o resto do código do projeto para o diretório de trabalho
COPY . /app

# Comando para iniciar o aplicativo
CMD ["gunicorn", "-b", "0.0.0.0:8000", "xlexapp.wsgi:application"]
