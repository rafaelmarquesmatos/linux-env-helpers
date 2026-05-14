#!/bin/bash

DISTRO="$1"
NAME="$2"

[[ -z "$DISTRO" || -z "$NAME" ]] && {
	echo "argumentos esperados: <distro-name> <container-name>"
	exit 1
}

if ! command -v podman >/dev/null 2>&1; then
	echo "podman não encontrado."
	exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")/../containers/$DISTRO" && pwd)"

echo "$SCRIPT_DIR"

podman build -t "$NAME" "$SCRIPT_DIR"
