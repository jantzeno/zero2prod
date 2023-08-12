#!/usr/bin/env bash

# Script must be run from the project root

set -a
# Defaults used for testing and local development
# Check if a custom user has been set, otherwise default to 'postgres'
DB_USER="${POSTGRES_USER:=postgres}"
# Check if a custom password has been set, otherwise default to 'password'
DB_PASSWORD="${POSTGRES_PASSWORD:=password}"
# Check if a custom database name has been set, otherwise default to 'newsletter'
DB_NAME="${POSTGRES_DB:=newsletter}"
# Check if a custom port has been set, otherwise default to '5432'
DB_PORT="${POSTGRES_PORT:=5432}"
# Check if a custom host has been set, otherwise default to 'localhost'
DB_HOST="${POSTGRES_HOST:=localhost}"

# Overide environment variables if available
ENV_FILE=./.env
if [ -f "${ENV_FILE}" ]; then
    source "${ENV_FILE}"
fi

set +a

sh scripts/check_sqlx.sh

# Allow to skip Podman if a Postgres database container is already running
if [[ -z "${SKIP_PODMAN}" ]]
then
    sh scripts/start_postgres.sh
fi

sh scripts/ping_db.sh
sh scripts/migrate.sh
