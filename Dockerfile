FROM python:3.7.3-alpine
LABEL MAINTAINER Humphrey Kiboi

ENV PYTHONUNBUFFERED=1

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user

# Do not applications in docker containers with root account as this can easily compromise the host system