#!/bin/bash

set -eu
set -o pipefail

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ..

scripts/cleanup.sh

cat ddl/schema.sql | scratch/duckdb scratch/ldbc.duckdb
sed "s|PATHVAR|${DUCKDB_CSV_DIR}|" ddl/load.sql | scratch/duckdb scratch/ldbc.duckdb
