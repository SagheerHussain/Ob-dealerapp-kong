#!/usr/bin/env sh
set -eu

# Default to 4000 if PORT isn’t set (local runs)
: "${PORT:=4000}"

export KONG_PROXY_LISTEN="0.0.0.0:${PORT}"
export KONG_ADMIN_LISTEN="off"

exec /docker-entrypoint.sh kong docker-start
