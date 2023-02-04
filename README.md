# devpro-django
[![Build Status](https://app.travis-ci.com/mauriciodoerr/devpro-django.svg?branch=develop)](https://app.travis-ci.com/mauriciodoerr/devpro-django)
[![Updates](https://pyup.io/repos/github/mauriciodoerr/devpro-django/shield.svg)](https://pyup.io/repos/github/mauriciodoerr/devpro-django/)
[![Python 3](https://pyup.io/repos/github/mauriciodoerr/devpro-django/python-3-shield.svg)](https://pyup.io/repos/github/mauriciodoerr/devpro-django/)
[![codecov](https://codecov.io/gh/mauriciodoerr/devpro-django/branch/develop/graph/badge.svg?token=YXYR6PU75A)](https://codecov.io/gh/mauriciodoerr/devpro-django)

## DJANGO Setup
Creating alias to make it easier when using manage.py
```console
pipenv shell
alias mng='python $VIRTUAL_ENV/../manage.py'
```

In order to build and deploy to Fly.io setup following files:
> settings.py
> .dockerignore
> fly.toml
> Dockerfile
> .env
> .env-sample

Deploy to Fly.io
```console
fly deploy
```

Once Django app deployed
```console
fly ssh console
cd code
python manage.py createsuperuser
```

Whitenoise setup for static files
Collect static files before deploy
```console
python manage.py collectstatic --noinput
```

## Docker Local
```console
docker build -t appname .
```

Run container and destroy after with --rm closing interactively with -it
```console
docker run --rm -it -p 8000:8000 --env-file=.env appname
```
OR
```console
docker run --rm -it -p 8000:8000 -e SECRET_KEY=secret -e ALLOWED_HOSTS=localhost, appname python manage.py migrate
```

To run as daemon process
```console
docker run --rm -it -p 8000:8000 --env-file=.env -d appname
docker ps
docker exec -it container_id bash
```
