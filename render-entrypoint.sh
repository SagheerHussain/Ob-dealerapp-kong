#!/usr/bin/env sh
set -eu

: "${PORT:=8000}"                       # default for local runs
export KONG_PROXY_LISTEN="0.0.0.0:${PORT}"
export KONG_ADMIN_LISTEN="off"

exec /docker-entrypoint.sh kong docker-start
