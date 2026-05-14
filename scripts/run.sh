#!/bin/bash

NAME="$1"

[[ -z "$NAME" ]] && {
	echo "uso: ./script.sh <nome do container>"
	exit 1
}

if ! command -v podman >/dev/null 2>&1; then
	echo "podman não encontrado."
	exit 1
fi

podman run -it "$NAME"
