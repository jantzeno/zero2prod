#!/usr/bin/env bash

# Script must be run from the project root

sh scripts/check_sqlx.sh
sh scripts/start_postgres.sh
sh scripts/ping_db.sh
sh scripts/migrate.sh
