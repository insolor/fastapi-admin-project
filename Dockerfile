FROM python:3.9.4-slim

# set work directory
WORKDIR /app

# set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get install -y python3-dev gcc libc-dev libffi-dev
RUN apt-get -y install libpq-dev gcc 

# install dependencies
COPY poetry.toml .
COPY pyproject.toml .
COPY poetry.lock .
RUN pip install --upgrade pip
RUN pip install --upgrade poetry
RUN poetry install --only main
# copy project
COPY fastapi_admin_project fastapi_admin_project
