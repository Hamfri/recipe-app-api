FROM python:3.7.3-alpine
LABEL MAINTAINER Humphrey Kiboi

ENV PYTHONUNBUFFERED=1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .temp-build-deps \
    gcc libc-dev linux-headers postgresql-dev

RUN pip install -r /requirements.txt
RUN apk del .temp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user

# Do not run applications in docker containers with root account as this can easily compromise the host system