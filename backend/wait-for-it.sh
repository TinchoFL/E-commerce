#!/usr/bin/env bash
# wait-for-it.sh - Wait for a host and port to become available

set -e

host="$1"
shift
port="$1"
shift

timeout="${WAITFORIT_TIMEOUT:-30}"
interval=1

echo "Waiting for $host:$port..."

for ((i=0;i<timeout;i+=interval)); do
  if nc -z "$host" "$port"; then
    echo "$host:$port is available!"
    exec "$@"
    exit 0
  fi
  sleep $interval
done

echo "Timeout reached while waiting for $host:$port"
exit 1


