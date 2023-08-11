#!/usr/bin/env bash

# Script must be run from the project root

set -a
source ./.env
set +a

DATABASE_URL=postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}
export DATABASE_URL
sqlx database create
sqlx migrate run