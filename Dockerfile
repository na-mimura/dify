FROM python:3.10-slim

WORKDIR /app
COPY . .

# poetryで依存関係をインストール
RUN pip install --upgrade pip && \
    pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi

# ポートの指定（RenderはPORT環境変数を使う）
ENV PORT=3000

# 本番サーバーの起動（uvicornでAPIサーバーを立てる）
CMD ["uvicorn", "api.main:app", "--host", "0.0.0.0", "--port", "3000"]
