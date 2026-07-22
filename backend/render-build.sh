#!/usr/bin/env bash
# render-build.sh — runs during Render build phase
set -o errexit

# Use production settings during build
export DJANGO_SETTINGS_MODULE=config.settings.production

pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate
python -X utf8 manage.py create_initial_data
