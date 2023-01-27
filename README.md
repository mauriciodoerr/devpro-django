# devpro-django
[![Build Status](https://app.travis-ci.com/mauriciodoerr/devpro-django.svg?branch=develop)](https://app.travis-ci.com/mauriciodoerr/devpro-django)
[![Updates](https://pyup.io/repos/github/mauriciodoerr/devpro-django/shield.svg)](https://pyup.io/repos/github/mauriciodoerr/devpro-django/)
[![Python 3](https://pyup.io/repos/github/mauriciodoerr/devpro-django/python-3-shield.svg)](https://pyup.io/repos/github/mauriciodoerr/devpro-django/)

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
> .env.example

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