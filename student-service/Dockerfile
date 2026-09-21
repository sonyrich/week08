FROM python:3.14.7-alpine

# Patch OS packages to fix CVE-2026-8376, CVE-2026-5450 and other Debian CVEs
RUN apk update && apk upgrade \
    && rm -rf /var/lib/apk/lists/*


WORKDIR /app

COPY requirements.txt .

RUN pip install \
    --no-cache-dir \
    --upgrade pip \
    --root-user-action=ignore \
    -r requirements.txt

COPY . .

RUN useradd -m appuser \
    && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]