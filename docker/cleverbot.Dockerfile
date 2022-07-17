FROM python:3.10-bullseye
WORKDIR /app
COPY ./cleverbotfree/* .
COPY cleverbot.py .
RUN apt-get update -yq \
    && pip install pika cleverbotfree \
    && playwright install firefox \
    && apt-get -y install libgtk-3-dev packagekit-gtk3-module libasound2 libdbus-glib-1-2 \
    && rm -rf /var/lib/apt/lists/*
CMD ["python3", "cleverbot.py" ]
