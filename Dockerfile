ARG PYTHON_VERSION=3.11.1-slim-buster

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /code

WORKDIR /code

# COPY requirements.txt /tmp/requirements.txt
COPY Pipfile .
COPY Pipfile.lock .

RUN set -ex && \
    pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install -d --system && \
    rm -rf /root/.cache/

COPY . /code/

# RUN python manage.py collectstatic --noinput

EXPOSE 8000

# replace demo.wsgi with <project_name>.wsgi
CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "pypro.wsgi"]
