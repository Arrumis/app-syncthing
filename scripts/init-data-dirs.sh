#!/usr/bin/env bash
set -euo pipefail

if [[ -f ".env.local" ]]; then
  set -a
  # shellcheck disable=SC1091
  source ".env.local"
  set +a
fi

DATA_DIR="${1:-${HOST_DATA_DIR:-./data}}"
CONFIG_DIR="${SYNCTHING_CONFIG_DIR:-${DATA_DIR}/config}"
STORAGE_DIR="${SYNCTHING_STORAGE_DIR:-${DATA_DIR}/data}"

mkdir -p "${CONFIG_DIR}" "${STORAGE_DIR}"

echo "Initialized Syncthing data directories under: ${DATA_DIR}"
