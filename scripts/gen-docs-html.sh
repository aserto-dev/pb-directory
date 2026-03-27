#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

mkdir -p ${PWD}/html

buf generate \
--template ./buf.gen-html.yaml \
--path "proto/aserto/directory/common/v3" \
--path "proto/aserto/directory/reader/v3" \
--path "proto/aserto/directory/writer/v3" \
--path "proto/aserto/directory/exporter/v3" \
--path "proto/aserto/directory/importer/v3" \
--path "proto/aserto/directory/model/v3" \
--output ${PWD}/html
