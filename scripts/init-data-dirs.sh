#!/usr/bin/env bash
set -euo pipefail

DATA_DIR="${1:-${HOST_DATA_DIR:-./data}}"

mkdir -p "${DATA_DIR}/config" "${DATA_DIR}/storage"

echo "Initialized Syncthing data directories under: ${DATA_DIR}"

