#!/bin/bash -e

if [ -z "$INIT_SERVICE_TYPE" ]; then
  INIT_SERVICE_TYPE="api"
fi

if [ "$RAILS_ENV" = "production" ]; then
  newrelic deployments
  # bundle exec rake data:migrate
  # SCHEMA_MIGRATION=true bundle exec rake db:migrate
fi

APP="init/service-$INIT_SERVICE_TYPE.sh"

sh "$APP"
