----------------------------------------------------------------------
HOW TO ADD A NEW DATA TYPE?
----------------------------------------------------------------------

It is not a trivial operation although I tried to simplify it as much
as possible, to the extent of modifying the Visitor pattern to make it
be generic types aware (and yes I know, there is a non-OO pebble in
the middle of it).

Currently EDC supports the following types:
 - EDC_BLOB
 - CHARACTER
 - INTEGER
 - STRING
 - TIME

To modify or add a type, say FOO, you have to add:
 - (model/column) EDC_FOO_COLUMN
 - (query/value)  EDC_FOO_COLUMN_VALUE
 - (query/value)  EDC_FOO_PARAMETER
 - (visitor)      EDC_FOO_COLUMN_VALUE_VISITOR
 - (visitor)      EDC_FOO_COLUMN_VISITOR
 - (visitor)      EDC_FOO_PARAMETER_VISITOR

Moreover, you will have to modify:
 - (visitor)      EDC_TYPEABLE_VISITOR: the typed visitors factory:
                   - modify the as_typed query: add an inspect branch
                   - add a new deferred query:
                     new_foo_visitor: ESE_TYPED_VISITOR[FOO]
 - all its heir classes
 - and the backends - e.g. for SQLite you will have to add a new
   EDC_SQLITE_QUERY_BUILDER_FOO_TOOLS.
