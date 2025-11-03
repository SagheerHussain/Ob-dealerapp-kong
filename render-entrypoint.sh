#!/usr/bin/env sh
set -eu

# Render provides PORT at runtime; default to 8000 for local runs
: "${PORT:=8000}"

export KONG_PROXY_LISTEN="0.0.0.0:${PORT}"
export KONG_ADMIN_LISTEN="${KONG_ADMIN_LISTEN:-off}"

exec /docker-entrypoint.sh kong docker-start
