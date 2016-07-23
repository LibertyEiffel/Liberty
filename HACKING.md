Liberty Eiffel Hacking Guide
============================

## Source code formatting

In general match the pre-existing style.

### Whitespace

* Indent lines with spaces *not* tabs.
* Trim trailing whitespace.

#### EditorConfig

The specifics are defined in the project's [EditorConfig file](.editorconfig)
and can be automatically configured for your editor with the appropriate
[plugin](http://editorconfig.org/#download).

## Obsolete class and feature messages

The feature format is

	"Use `other_feature' instead (Month YYYY). [Optional further explanation.]"`

and for classes use

	"Use OTHER_CLASS instead (Month YYYY). [Optional further explanation.]"

## Command-line tools output

Output is consistently wrapped at 78 characters.

