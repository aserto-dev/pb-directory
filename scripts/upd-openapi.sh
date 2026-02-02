#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

printf 'convert *.swagger.json => *.openapi.json\n'

for FILENAME in $(find . -name '*.swagger.json'); do \
   echo "${FILENAME} => ${FILENAME//swagger/openapi}"; \
  .ext/bin/openapi-spec-converter -t 3.1 -f json -o "${FILENAME//swagger/openapi}" ${FILENAME};\
  rm -f ${FILENAME}
done

printf '\n'

mkdir -p ./openapi

.ext/bin/merge-json -output ./openapi/directory.openapi.json \
./tmp/aserto/directory/openapi/v3/openapi.openapi.json \
./tmp/aserto/directory/openapi/v4/openapi.openapi.json \
./tmp/aserto/directory/common/v3/common.openapi.json \
./tmp/aserto/directory/common/v4/common.openapi.json \
./tmp/aserto/directory/reader/v3/reader.openapi.json \
./tmp/aserto/directory/reader/v4/reader.openapi.json \
./tmp/aserto/directory/writer/v3/writer.openapi.json \
./tmp/aserto/directory/writer/v4/writer.openapi.json \
./tmp/aserto/directory/model/v3/model.openapi.json \
./tmp/aserto/directory/importer/v3/importer.openapi.json \
./tmp/aserto/directory/exporter/v3/exporter.openapi.json

.ext/bin/merge-json -output ./openapi/directory.v4.openapi.json \
./tmp/aserto/directory/openapi/v4/openapi.openapi.json \
./tmp/aserto/directory/common/v4/common.openapi.json \
./tmp/aserto/directory/reader/v4/reader.openapi.json \
./tmp/aserto/directory/writer/v4/writer.openapi.json

.ext/bin/merge-json -output ./openapi/directory.v3.openapi.json \
./tmp/aserto/directory/openapi/v3/openapi.openapi.json \
./tmp/aserto/directory/common/v3/common.openapi.json \
./tmp/aserto/directory/reader/v3/reader.openapi.json \
./tmp/aserto/directory/writer/v3/writer.openapi.json \
./tmp/aserto/directory/model/v3/model.openapi.json \
./tmp/aserto/directory/importer/v3/importer.openapi.json \
./tmp/aserto/directory/exporter/v3/exporter.openapi.json

rm -rf ./tmp
