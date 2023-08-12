#!/usr/bin/env bash

# Script must be run from the project root
# Launch postgres using Podman
podman run \
    --rm \
    -e POSTGRES_USER=${DB_USER} \
    -e POSTGRES_PASSWORD=${DB_PASSWORD} \
    -e POSTGRES_DB=${DB_NAME} \
    -p "${DB_PORT}":"${DB_PORT}" \
    -d docker.io/library/postgres:latest \
    postgres -N 1000
    # ^ Increased maximum number of connections for testing purposes
