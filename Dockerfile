FROM python:3.12-slim-bookworm
COPY requirements.txt /app/.
WORKDIR /app
RUN pip install -r requirements.txt