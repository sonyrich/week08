# ---- Build stage ----
FROM python:3.14.7-alpine AS builder

RUN apk add --no-cache \
    gcc \
    musl-dev \
    postgresql-dev \
    libffi-dev

WORKDIR /app
COPY requirements.txt .
RUN pip install \
    --no-cache-dir \
    --upgrade pip setuptools \
    --root-user-action=ignore \
    -r requirements.txt


# ---- Runtime stage ----
FROM python:3.14.7-alpine

RUN apk update && apk upgrade --no-cache \
    && apk add --no-cache libpq

WORKDIR /app

# Copy installed packages + console scripts (uvicorn, etc.) from builder — no /root traps
COPY --from=builder /usr/local/lib/python3.14/site-packages /usr/local/lib/python3.14/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

COPY . .

RUN adduser -D appuser \
    && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]