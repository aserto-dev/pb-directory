#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

mkdir -p ${PWD}/md/v3

buf generate \
--template ./buf.gen-md.yaml \
--path "proto/aserto/directory/common/v3" \
--path "proto/aserto/directory/reader/v3" \
--path "proto/aserto/directory/writer/v3" \
--path "proto/aserto/directory/exporter/v3" \
--path "proto/aserto/directory/importer/v3" \
--path "proto/aserto/directory/model/v3" \
--output ${PWD}/md/v3

mkdir -p ${PWD}/md/v4

buf generate \
--template ./buf.gen-md.yaml \
--path "proto/aserto/directory/common/v4" \
--path "proto/aserto/directory/reader/v4" \
--path "proto/aserto/directory/writer/v4" \
--output ${PWD}/md/v4
