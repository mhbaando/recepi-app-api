# image we're using
from python:3.9-alpine3.13
# python -> package name 
# alpine -> light weight of python for linux

# maintiner 
LABEL maintainer="mhbaando"
# env -> recommened when runinig the container
# tells containre not to buffer logs and directly prints to the terminal 
ENV PYTHONUNBUFFERED 1

# project dependecies
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

# 1. create venv
# 2. upgrade pip
# 3. install requirements
# 4. remove temp folder
# 5. add user 
# 6. disable password
# 7. dont create home dir for that user 
# 8. name of the user django-user

# overwrite the docer composer
# fi => end of if
ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .temp-build-deps \
    build-base postgresql-dev gcc python3-dev musl-dev &&\
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
    then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    apk del .temp-build-deps && \
    adduser \
    --disabled-password \
    django-user

ENV PATH="/py/bin:$PATH"
USER django-user
