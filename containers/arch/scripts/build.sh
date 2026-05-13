#!/bin/bash

NAME="$1"

if [ -z "$NAME" ]; then
	echo "uso: ./script.sh <nome do container>"
	exit 1
fi

if ! command -v podman >/dev/null 2>&1; then
	echo "podman não encontrado."
	exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

podman build -t "$NAME" "$SCRIPT_DIR"
