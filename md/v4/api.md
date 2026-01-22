# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [aserto/directory/common/v4/common.proto](#aserto_directory_common_v4_common-proto)
    - [Manifest](#aserto-directory-common-v4-Manifest)
    - [Model](#aserto-directory-common-v4-Model)
    - [Object](#aserto-directory-common-v4-Object)
    - [ObjectIdentifier](#aserto-directory-common-v4-ObjectIdentifier)
    - [PaginationRequest](#aserto-directory-common-v4-PaginationRequest)
    - [PaginationResponse](#aserto-directory-common-v4-PaginationResponse)
    - [Relation](#aserto-directory-common-v4-Relation)
    - [RelationIdentifier](#aserto-directory-common-v4-RelationIdentifier)
  
- [aserto/directory/reader/v4/reader.proto](#aserto_directory_reader_v4_reader-proto)
    - [CheckRequest](#aserto-directory-reader-v4-CheckRequest)
    - [CheckResponse](#aserto-directory-reader-v4-CheckResponse)
    - [ChecksRequest](#aserto-directory-reader-v4-ChecksRequest)
    - [ChecksResponse](#aserto-directory-reader-v4-ChecksResponse)
    - [ExportRequest](#aserto-directory-reader-v4-ExportRequest)
    - [ExportResponse](#aserto-directory-reader-v4-ExportResponse)
    - [GetGraphRequest](#aserto-directory-reader-v4-GetGraphRequest)
    - [GetGraphResponse](#aserto-directory-reader-v4-GetGraphResponse)
    - [GetManifestRequest](#aserto-directory-reader-v4-GetManifestRequest)
    - [GetManifestResponse](#aserto-directory-reader-v4-GetManifestResponse)
    - [GetModelRequest](#aserto-directory-reader-v4-GetModelRequest)
    - [GetModelResponse](#aserto-directory-reader-v4-GetModelResponse)
    - [GetObjectRequest](#aserto-directory-reader-v4-GetObjectRequest)
    - [GetObjectResponse](#aserto-directory-reader-v4-GetObjectResponse)
    - [GetObjectsRequest](#aserto-directory-reader-v4-GetObjectsRequest)
    - [GetObjectsResponse](#aserto-directory-reader-v4-GetObjectsResponse)
    - [GetRelationRequest](#aserto-directory-reader-v4-GetRelationRequest)
    - [GetRelationResponse](#aserto-directory-reader-v4-GetRelationResponse)
    - [GetRelationsRequest](#aserto-directory-reader-v4-GetRelationsRequest)
    - [GetRelationsResponse](#aserto-directory-reader-v4-GetRelationsResponse)
    - [ListObjectsRequest](#aserto-directory-reader-v4-ListObjectsRequest)
    - [ListObjectsResponse](#aserto-directory-reader-v4-ListObjectsResponse)
    - [ListRelationsRequest](#aserto-directory-reader-v4-ListRelationsRequest)
    - [ListRelationsResponse](#aserto-directory-reader-v4-ListRelationsResponse)
    - [ListRelationsResponse.ObjectsEntry](#aserto-directory-reader-v4-ListRelationsResponse-ObjectsEntry)
  
    - [Option](#aserto-directory-reader-v4-Option)
  
    - [Reader](#aserto-directory-reader-v4-Reader)
  
- [aserto/directory/writer/v4/writer.proto](#aserto_directory_writer_v4_writer-proto)
    - [DeleteManifestRequest](#aserto-directory-writer-v4-DeleteManifestRequest)
    - [DeleteManifestResponse](#aserto-directory-writer-v4-DeleteManifestResponse)
    - [DeleteObjectRequest](#aserto-directory-writer-v4-DeleteObjectRequest)
    - [DeleteObjectResponse](#aserto-directory-writer-v4-DeleteObjectResponse)
    - [DeleteRelationRequest](#aserto-directory-writer-v4-DeleteRelationRequest)
    - [DeleteRelationResponse](#aserto-directory-writer-v4-DeleteRelationResponse)
    - [ImportCounter](#aserto-directory-writer-v4-ImportCounter)
    - [ImportRequest](#aserto-directory-writer-v4-ImportRequest)
    - [ImportResponse](#aserto-directory-writer-v4-ImportResponse)
    - [ImportStatus](#aserto-directory-writer-v4-ImportStatus)
    - [SetManifestRequest](#aserto-directory-writer-v4-SetManifestRequest)
    - [SetManifestResponse](#aserto-directory-writer-v4-SetManifestResponse)
    - [SetObjectRequest](#aserto-directory-writer-v4-SetObjectRequest)
    - [SetObjectResponse](#aserto-directory-writer-v4-SetObjectResponse)
    - [SetRelationRequest](#aserto-directory-writer-v4-SetRelationRequest)
    - [SetRelationResponse](#aserto-directory-writer-v4-SetRelationResponse)
  
    - [Opcode](#aserto-directory-writer-v4-Opcode)
  
    - [Writer](#aserto-directory-writer-v4-Writer)
  
- [Scalar Value Types](#scalar-value-types)



<a name="aserto_directory_common_v4_common-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## aserto/directory/common/v4/common.proto



<a name="aserto-directory-common-v4-Manifest"></a>

### Manifest
Manifest


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| body | [bytes](#bytes) |  | manifest payload |
| updated_at | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  | last updated timestamp (UTC) |
| etag | [string](#string) |  | manifest instance etag (optional) |






<a name="aserto-directory-common-v4-Model"></a>

### Model
Model


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model | [google.protobuf.Struct](#google-protobuf-Struct) |  | model representation of manifest |
| updated_at | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  | last updated timestamp (UTC) |
| etag | [string](#string) |  | manifest instance etag |






<a name="aserto-directory-common-v4-Object"></a>

### Object
Object


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier |
| object_id | [string](#string) |  | object instance identifier |
| properties | [google.protobuf.Struct](#google-protobuf-Struct) |  | property bag (optional) |
| updated_at | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  | last updated timestamp (UTC) |
| etag | [string](#string) |  | object instance etag (optional) |






<a name="aserto-directory-common-v4-ObjectIdentifier"></a>

### ObjectIdentifier
Object identifier


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier |
| object_id | [string](#string) |  | object instance identifier |






<a name="aserto-directory-common-v4-PaginationRequest"></a>

### PaginationRequest
Pagination request


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| size | [int32](#int32) |  | requested page size, valid value between 1-1000 rows (optional, default 100) |
| token | [string](#string) |  | pagination start token (optional default &#34;&#34;) |






<a name="aserto-directory-common-v4-PaginationResponse"></a>

### PaginationResponse
Pagination response


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| next_token | [string](#string) |  | next page token, when empty there are no more pages to fetch |






<a name="aserto-directory-common-v4-Relation"></a>

### Relation
Relation


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier |
| object_id | [string](#string) |  | object instance identifier |
| relation | [string](#string) |  | object relation name |
| subject_type | [string](#string) |  | subject type identifier |
| subject_id | [string](#string) |  | subject instance identifier |
| subject_relation | [string](#string) |  | subject relation name (optional) |
| updated_at | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  | last updated timestamp (UTC) |
| etag | [string](#string) |  | object instance etag (optional) |






<a name="aserto-directory-common-v4-RelationIdentifier"></a>

### RelationIdentifier
Relation identifier


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier |
| object_id | [string](#string) |  | object instance identifier |
| relation | [string](#string) |  | object relation name |
| subject_type | [string](#string) |  | subject type identifier |
| subject_id | [string](#string) |  | subject instance identifier |
| subject_relation | [string](#string) |  | subject relation name (optional) |





 

 

 

 



<a name="aserto_directory_reader_v4_reader-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## aserto/directory/reader/v4/reader.proto



<a name="aserto-directory-reader-v4-CheckRequest"></a>

### CheckRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier |
| object_id | [string](#string) |  | object instance identifier |
| relation | [string](#string) |  | relation name |
| subject_type | [string](#string) |  | subject type identifier |
| subject_id | [string](#string) |  | subject instance identifier |
| trace | [bool](#bool) |  | collect trace information (optional) |






<a name="aserto-directory-reader-v4-CheckResponse"></a>

### CheckResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| check | [bool](#bool) |  | check result |
| trace | [string](#string) | repeated | trace information |
| context | [google.protobuf.Struct](#google-protobuf-Struct) |  | context |






<a name="aserto-directory-reader-v4-ChecksRequest"></a>

### ChecksRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| default | [CheckRequest](#aserto-directory-reader-v4-CheckRequest) |  | default values |
| checks | [CheckRequest](#aserto-directory-reader-v4-CheckRequest) | repeated | array of check requests |






<a name="aserto-directory-reader-v4-ChecksResponse"></a>

### ChecksResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| checks | [CheckResponse](#aserto-directory-reader-v4-CheckResponse) | repeated | array of check responses |






<a name="aserto-directory-reader-v4-ExportRequest"></a>

### ExportRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| options | [uint32](#uint32) |  | data export options mask |
| start_from | [google.protobuf.Timestamp](#google-protobuf-Timestamp) |  | start export from timestamp (UTC) |






<a name="aserto-directory-reader-v4-ExportResponse"></a>

### ExportResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| manifest | [aserto.directory.common.v4.Manifest](#aserto-directory-common-v4-Manifest) |  | manifest |
| model | [aserto.directory.common.v4.Model](#aserto-directory-common-v4-Model) |  | model |
| object | [aserto.directory.common.v4.Object](#aserto-directory-common-v4-Object) |  | object |
| relation | [aserto.directory.common.v4.Relation](#aserto-directory-common-v4-Relation) |  | relation |
| stats | [google.protobuf.Struct](#google-protobuf-Struct) |  | stats |






<a name="aserto-directory-reader-v4-GetGraphRequest"></a>

### GetGraphRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier |
| object_id | [string](#string) |  | object instance identifier (optional) |
| relation | [string](#string) |  | relation name |
| subject_type | [string](#string) |  | subject type identifier |
| subject_id | [string](#string) |  | subject instance identifier (optional) |
| subject_relation | [string](#string) |  | subject relation name (optional) |
| explain | [bool](#bool) |  | return graph paths for each result (optional) |
| trace | [bool](#bool) |  | collect trace information (optional) |






<a name="aserto-directory-reader-v4-GetGraphResponse"></a>

### GetGraphResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| results | [aserto.directory.common.v4.ObjectIdentifier](#aserto-directory-common-v4-ObjectIdentifier) | repeated | matching object identifiers |
| explanation | [google.protobuf.Struct](#google-protobuf-Struct) |  | explanation of results |
| trace | [string](#string) | repeated | trace information |






<a name="aserto-directory-reader-v4-GetManifestRequest"></a>

### GetManifestRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| empty | [google.protobuf.Empty](#google-protobuf-Empty) |  | empty request |






<a name="aserto-directory-reader-v4-GetManifestResponse"></a>

### GetManifestResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [aserto.directory.common.v4.Manifest](#aserto-directory-common-v4-Manifest) |  | manifest instance |






<a name="aserto-directory-reader-v4-GetModelRequest"></a>

### GetModelRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| empty | [google.protobuf.Empty](#google-protobuf-Empty) |  | empty request |






<a name="aserto-directory-reader-v4-GetModelResponse"></a>

### GetModelResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [aserto.directory.common.v4.Model](#aserto-directory-common-v4-Model) |  | model instance |






<a name="aserto-directory-reader-v4-GetObjectRequest"></a>

### GetObjectRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier |
| object_id | [string](#string) |  | object instance identifier |
| with_relations | [bool](#bool) |  | materialize the object relations objects (optional) |






<a name="aserto-directory-reader-v4-GetObjectResponse"></a>

### GetObjectResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [aserto.directory.common.v4.Object](#aserto-directory-common-v4-Object) |  | object instance |
| relations | [aserto.directory.common.v4.Relation](#aserto-directory-common-v4-Relation) | repeated | array of associated relations of given object instance |






<a name="aserto-directory-reader-v4-GetObjectsRequest"></a>

### GetObjectsRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| param | [aserto.directory.common.v4.ObjectIdentifier](#aserto-directory-common-v4-ObjectIdentifier) | repeated | array of object identifiers |






<a name="aserto-directory-reader-v4-GetObjectsResponse"></a>

### GetObjectsResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| results | [aserto.directory.common.v4.Object](#aserto-directory-common-v4-Object) | repeated | array of object instances |






<a name="aserto-directory-reader-v4-GetRelationRequest"></a>

### GetRelationRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier |
| object_id | [string](#string) |  | object instance identifier |
| relation | [string](#string) |  | relation name |
| subject_type | [string](#string) |  | subject type identifier |
| subject_id | [string](#string) |  | subject instance identifier |
| subject_relation | [string](#string) |  | subject relation name (optional) |
| with_objects | [bool](#bool) |  | materialize relation objects (optional) |






<a name="aserto-directory-reader-v4-GetRelationResponse"></a>

### GetRelationResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [aserto.directory.common.v4.Relation](#aserto-directory-common-v4-Relation) |  | relation instance |
| object | [aserto.directory.common.v4.Object](#aserto-directory-common-v4-Object) |  | object instance, set when with_objects=true |
| subject | [aserto.directory.common.v4.Object](#aserto-directory-common-v4-Object) |  | subject instance, set when with_objects=true |






<a name="aserto-directory-reader-v4-GetRelationsRequest"></a>

### GetRelationsRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| param | [aserto.directory.common.v4.RelationIdentifier](#aserto-directory-common-v4-RelationIdentifier) | repeated | array of relation identifiers |






<a name="aserto-directory-reader-v4-GetRelationsResponse"></a>

### GetRelationsResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| results | [aserto.directory.common.v4.Relation](#aserto-directory-common-v4-Relation) | repeated | array of relation instances |






<a name="aserto-directory-reader-v4-ListObjectsRequest"></a>

### ListObjectsRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier (optional) |
| page | [aserto.directory.common.v4.PaginationRequest](#aserto-directory-common-v4-PaginationRequest) |  | pagination request (optional) |






<a name="aserto-directory-reader-v4-ListObjectsResponse"></a>

### ListObjectsResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| results | [aserto.directory.common.v4.Object](#aserto-directory-common-v4-Object) | repeated | array of object instances |
| page | [aserto.directory.common.v4.PaginationResponse](#aserto-directory-common-v4-PaginationResponse) |  | pagination response |






<a name="aserto-directory-reader-v4-ListRelationsRequest"></a>

### ListRelationsRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier (optional) |
| object_id | [string](#string) |  | object instance identifier (optional) |
| relation | [string](#string) |  | relation name (optional) |
| subject_type | [string](#string) |  | subject type identifier (optional) |
| subject_id | [string](#string) |  | subject instance identifier (optional) |
| subject_relation | [string](#string) |  | subject relation name (optional) |
| with_objects | [bool](#bool) |  | materialize relation objects (optional) |
| with_empty_subject_relation | [bool](#bool) |  | only return relations that do not have a subject relation. (optional) |
| page | [aserto.directory.common.v4.PaginationRequest](#aserto-directory-common-v4-PaginationRequest) |  | pagination request (optional) |






<a name="aserto-directory-reader-v4-ListRelationsResponse"></a>

### ListRelationsResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| results | [aserto.directory.common.v4.Relation](#aserto-directory-common-v4-Relation) | repeated | array of relation instances |
| objects | [ListRelationsResponse.ObjectsEntry](#aserto-directory-reader-v4-ListRelationsResponse-ObjectsEntry) | repeated | map of materialized relation objects |
| page | [aserto.directory.common.v4.PaginationResponse](#aserto-directory-common-v4-PaginationResponse) |  | pagination response |






<a name="aserto-directory-reader-v4-ListRelationsResponse-ObjectsEntry"></a>

### ListRelationsResponse.ObjectsEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [aserto.directory.common.v4.Object](#aserto-directory-common-v4-Object) |  |  |





 


<a name="aserto-directory-reader-v4-Option"></a>

### Option


| Name | Number | Description |
| ---- | ------ | ----------- |
| OPTION_UNKNOWN | 0 | nothing selected (default initialization value) |
| OPTION_DATA_MANIFEST | 1 | manifest instances |
| OPTION_DATA_MODEL | 2 | model instances |
| OPTION_DATA_OBJECTS | 8 | object instances |
| OPTION_DATA_RELATIONS | 16 | relation instances |
| OPTION_DATA | 24 | all data = OPTION_DATA_OBJECTS | OPTION_DATA_RELATIONS |
| OPTION_STATS | 64 | stats |


 

 


<a name="aserto-directory-reader-v4-Reader"></a>

### Reader
Directory Reader service

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| GetManifest | [GetManifestRequest](#aserto-directory-reader-v4-GetManifestRequest) | [GetManifestResponse](#aserto-directory-reader-v4-GetManifestResponse) | get manifest |
| GetModel | [GetModelRequest](#aserto-directory-reader-v4-GetModelRequest) | [GetModelResponse](#aserto-directory-reader-v4-GetModelResponse) | get model |
| GetObject | [GetObjectRequest](#aserto-directory-reader-v4-GetObjectRequest) | [GetObjectResponse](#aserto-directory-reader-v4-GetObjectResponse) | get object |
| GetObjects | [GetObjectsRequest](#aserto-directory-reader-v4-GetObjectsRequest) | [GetObjectsResponse](#aserto-directory-reader-v4-GetObjectsResponse) | get multiple objects |
| ListObjects | [ListObjectsRequest](#aserto-directory-reader-v4-ListObjectsRequest) | [ListObjectsResponse](#aserto-directory-reader-v4-ListObjectsResponse) | list objects |
| GetRelation | [GetRelationRequest](#aserto-directory-reader-v4-GetRelationRequest) | [GetRelationResponse](#aserto-directory-reader-v4-GetRelationResponse) | get relation |
| GetRelations | [GetRelationsRequest](#aserto-directory-reader-v4-GetRelationsRequest) | [GetRelationsResponse](#aserto-directory-reader-v4-GetRelationsResponse) | get multiple relations in a single round trip |
| ListRelations | [ListRelationsRequest](#aserto-directory-reader-v4-ListRelationsRequest) | [ListRelationsResponse](#aserto-directory-reader-v4-ListRelationsResponse) | list relations |
| Check | [CheckRequest](#aserto-directory-reader-v4-CheckRequest) | [CheckResponse](#aserto-directory-reader-v4-CheckResponse) | check if subject has relation or permission with object |
| Checks | [ChecksRequest](#aserto-directory-reader-v4-ChecksRequest) | [ChecksResponse](#aserto-directory-reader-v4-ChecksResponse) | checks validates a set of check requests in a single roundtrip |
| GetGraph | [GetGraphRequest](#aserto-directory-reader-v4-GetGraphRequest) | [GetGraphResponse](#aserto-directory-reader-v4-GetGraphResponse) | get object relationship graph |
| Export | [ExportRequest](#aserto-directory-reader-v4-ExportRequest) | [ExportResponse](#aserto-directory-reader-v4-ExportResponse) stream | stream exporter, exports manifests, models, objects and relations |

 



<a name="aserto_directory_writer_v4_writer-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## aserto/directory/writer/v4/writer.proto



<a name="aserto-directory-writer-v4-DeleteManifestRequest"></a>

### DeleteManifestRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| empty | [google.protobuf.Empty](#google-protobuf-Empty) |  | empty request |






<a name="aserto-directory-writer-v4-DeleteManifestResponse"></a>

### DeleteManifestResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [google.protobuf.Empty](#google-protobuf-Empty) |  | empty result |






<a name="aserto-directory-writer-v4-DeleteObjectRequest"></a>

### DeleteObjectRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier |
| object_id | [string](#string) |  | object instance identifier |
| with_relations | [bool](#bool) |  | delete object relations, both object and subject relations (optional) |






<a name="aserto-directory-writer-v4-DeleteObjectResponse"></a>

### DeleteObjectResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [google.protobuf.Empty](#google-protobuf-Empty) |  | empty result |






<a name="aserto-directory-writer-v4-DeleteRelationRequest"></a>

### DeleteRelationRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object_type | [string](#string) |  | object type identifier |
| object_id | [string](#string) |  | object instance identifier |
| relation | [string](#string) |  | object relation name |
| subject_type | [string](#string) |  | subject type identifier |
| subject_id | [string](#string) |  | subject instance identifier |
| subject_relation | [string](#string) |  | subject relation name (optional) |






<a name="aserto-directory-writer-v4-DeleteRelationResponse"></a>

### DeleteRelationResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [google.protobuf.Empty](#google-protobuf-Empty) |  | empty result |






<a name="aserto-directory-writer-v4-ImportCounter"></a>

### ImportCounter



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [string](#string) |  | counter of type (manifest|model|object|relation) |
| recv | [uint64](#uint64) |  | number of messages received |
| get | [uint64](#uint64) |  | number of messages with OPCODE_GET |
| set | [uint64](#uint64) |  | number of messages with OPCODE_SET |
| delete | [uint64](#uint64) |  | number of messages with OPCODE_DELETE |
| error | [uint64](#uint64) |  | number of messages resulting in error |






<a name="aserto-directory-writer-v4-ImportRequest"></a>

### ImportRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| op_code | [Opcode](#aserto-directory-writer-v4-Opcode) |  | operation Opcode enum value |
| manifest | [aserto.directory.common.v4.Manifest](#aserto-directory-common-v4-Manifest) |  | manifest |
| model | [aserto.directory.common.v4.Manifest](#aserto-directory-common-v4-Manifest) |  | model |
| object | [aserto.directory.common.v4.Object](#aserto-directory-common-v4-Object) |  | object |
| relation | [aserto.directory.common.v4.Relation](#aserto-directory-common-v4-Relation) |  | relation |






<a name="aserto-directory-writer-v4-ImportResponse"></a>

### ImportResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| manifest | [aserto.directory.common.v4.Manifest](#aserto-directory-common-v4-Manifest) |  | manifest |
| model | [aserto.directory.common.v4.Manifest](#aserto-directory-common-v4-Manifest) |  | model (GET only) |
| object | [aserto.directory.common.v4.Object](#aserto-directory-common-v4-Object) |  | object |
| relation | [aserto.directory.common.v4.Relation](#aserto-directory-common-v4-Relation) |  | relation |
| status | [ImportStatus](#aserto-directory-writer-v4-ImportStatus) |  | import status message |
| counter | [ImportCounter](#aserto-directory-writer-v4-ImportCounter) |  | import counter per type |






<a name="aserto-directory-writer-v4-ImportStatus"></a>

### ImportStatus



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| code | [uint32](#uint32) |  | gRPC status code (google.golang.org/grpc/codes) |
| msg | [string](#string) |  | gRPC status message (google.golang.org/grpc/status) |
| req | [ImportRequest](#aserto-directory-writer-v4-ImportRequest) |  | req contains the original import request message |






<a name="aserto-directory-writer-v4-SetManifestRequest"></a>

### SetManifestRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| body | [bytes](#bytes) |  | manifest body |






<a name="aserto-directory-writer-v4-SetManifestResponse"></a>

### SetManifestResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [aserto.directory.common.v4.Manifest](#aserto-directory-common-v4-Manifest) |  | manifest instance |






<a name="aserto-directory-writer-v4-SetObjectRequest"></a>

### SetObjectRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| object | [aserto.directory.common.v4.Object](#aserto-directory-common-v4-Object) |  | object instance |






<a name="aserto-directory-writer-v4-SetObjectResponse"></a>

### SetObjectResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [aserto.directory.common.v4.Object](#aserto-directory-common-v4-Object) |  | object instance |






<a name="aserto-directory-writer-v4-SetRelationRequest"></a>

### SetRelationRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| relation | [aserto.directory.common.v4.Relation](#aserto-directory-common-v4-Relation) |  | relation instance |






<a name="aserto-directory-writer-v4-SetRelationResponse"></a>

### SetRelationResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [aserto.directory.common.v4.Relation](#aserto-directory-common-v4-Relation) |  | relation instance |





 


<a name="aserto-directory-writer-v4-Opcode"></a>

### Opcode


| Name | Number | Description |
| ---- | ------ | ----------- |
| OPCODE_UNKNOWN | 0 |  |
| OPCODE_GET | 1 |  |
| OPCODE_SET | 2 |  |
| OPCODE_DELETE | 3 |  |
| OPCODE_DELETE_WITH_RELATIONS | 4 |  |


 

 


<a name="aserto-directory-writer-v4-Writer"></a>

### Writer
Directory Writer service

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| SetManifest | [SetManifestRequest](#aserto-directory-writer-v4-SetManifestRequest) | [SetManifestResponse](#aserto-directory-writer-v4-SetManifestResponse) | set manifest instance |
| DeleteManifest | [DeleteManifestRequest](#aserto-directory-writer-v4-DeleteManifestRequest) | [DeleteManifestResponse](#aserto-directory-writer-v4-DeleteManifestResponse) | delete manifest instance |
| SetObject | [SetObjectRequest](#aserto-directory-writer-v4-SetObjectRequest) | [SetObjectResponse](#aserto-directory-writer-v4-SetObjectResponse) | set object instance |
| DeleteObject | [DeleteObjectRequest](#aserto-directory-writer-v4-DeleteObjectRequest) | [DeleteObjectResponse](#aserto-directory-writer-v4-DeleteObjectResponse) | delete object instance |
| SetRelation | [SetRelationRequest](#aserto-directory-writer-v4-SetRelationRequest) | [SetRelationResponse](#aserto-directory-writer-v4-SetRelationResponse) | set relation instance |
| DeleteRelation | [DeleteRelationRequest](#aserto-directory-writer-v4-DeleteRelationRequest) | [DeleteRelationResponse](#aserto-directory-writer-v4-DeleteRelationResponse) | delete relation instance |
| Import | [ImportRequest](#aserto-directory-writer-v4-ImportRequest) stream | [ImportResponse](#aserto-directory-writer-v4-ImportResponse) stream | import stream of objects and relations |

 



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |

