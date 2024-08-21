#FROM arm64v8/python:3.12-bookworm
FROM arm64v8/python:3.11-slim-bookworm
#FROM ubuntu:22.04
#COPY tflite_runtime-2.11.0-cp311-cp311-linux_aarch64.whl /app/.

WORKDIR /app
RUN python3 -m pip install --root-user-action=ignore --upgrade pip
RUN python3 -m pip install --root-user-action=ignore tflite-runtime
COPY docker_requirements.txt /app/requirements.txt
RUN python3 -m pip install --root-user-action=ignore -r requirements.txt
RUN apt-get update && apt-get install -y \
    sqlite3 \
    caddy \
    supervisor


#Install files
COPY model/     model/
COPY homepage/  homepage/
COPY scripts/   scripts/

CMD ["/usr/bin/supervisord"]