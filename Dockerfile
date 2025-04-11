FROM python:3.10-slim

WORKDIR /app
COPY . .

# poetryのインストール
RUN pip install --upgrade pip && \
    pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi

CMD ["bash", "./start.sh"]
