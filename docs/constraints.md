# Constraints

## Field validation constraints

This section describes the field constraints

### Type Identifiers

A ***type identifier*** like the values of the `object_type`, `relation`, `subject_relation` fields, are referencing the type names as defined in the `manifest` and must conform to the following constraints:

* Minimum length of 3 characters
* Maximum length of 64 characters
* Regular Expression `^[a-zA-Z][a-zA-Z0-9._-]{1,62}[a-zA-Z0-9]$`
	* Described in words:
		* Must start with a letter
		* Can contain mixed case letters, digits, dots, underscores, and dashes
		* Must end with a letter or digit

### Instance Identifiers

An ***instance identifier*** like the values of the `object_id` and `subject_id` fields must conform to the following constraints:

* Minimum length of 1 character
* Maximum length of 256 characters
* Regular Expression `^[S]{1,256}$`
	* Described in words:
		* Cannot contain any spaces or any other whitespace characters

### Etag fields (v4)

The v4 `etag` fields must conform to the following constraints:

* Minimum length of <TBD> characters
* Maximum length of <TBD> characters
* Regular Expression: `<TBD>`
	* Described in words:
		* <TBD>

### Etag fields (v3)

The v3 `etag` fields must conform to the following constraints:

* Minimum length of 1 character (default: "0")
* Maximum length of 20 characters
* All characters must be digits
* Regular Expression `(?m)^\d{1,20}$` 

### Object DisplayName field (v3 only, OBSOLETE in v4)

The v3 `Object` field `display_name` must to conform to the following constraints:

* Minimum length: 0 characters (default value: "")
* Maximum length: 100 characters
* Conform to the `(?m)^[[:print:]]{0,100}$` Regular Expression
	* Described in words:
		* Can only contain printable characters, can not contain angled brackets, ampersands, double quotes or other control characters

NOTE: the `display_name` field has been removed `object` message from the `v4` schema. Existing instances will be migrated to a key-value pair in the `properties` field, using the `.display_name` key name.
