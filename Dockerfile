ARG PYTHON_VERSION=3.11.1-slim-buster

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /app

WORKDIR /app

# COPY requirements.txt /tmp/requirements.txt
COPY Pipfile .
COPY Pipfile.lock .

RUN set -ex && \
    pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install -d --system && \
    rm -rf /root/.cache/

COPY . /app/

# RUN python manage.py collectstatic --noinput

EXPOSE 8000

# replace demo.wsgi with <project_name>.wsgi
CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "pypro.wsgi"]
