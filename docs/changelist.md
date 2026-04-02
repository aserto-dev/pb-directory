# API Changes 

## v0.34.1

* forward v4 deprecation notice, mark v4 to be removed fields as `deprecated=true`
  * common.object.display_name, ordinal 3
  * common.object.created_at, ordinal 20
  * common.relation.created_at, ordinal 20

## v0.34.0

* remove pagination from reader.GetObject
  * GetObjectRequest remove field page, ordinal 9
  * GetObjectResponse remove field page, ordinal 9
