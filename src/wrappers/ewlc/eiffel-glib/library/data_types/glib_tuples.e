note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_TUPLES
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Relations and Tuples

-- Relations and Tuples %GÅ‚Äî%@ tables of data which can be indexed on any number of fields.
	
-- Synopsis

-- #include <glib.h>


--             GRelation;
-- GRelation*  g_relation_new                  (gint fields);
-- void        g_relation_index                (GRelation *relation,
--                                              gint field,
--                                              GHashFunc hash_func,
--                                              GEqualFunc key_equal_func);
-- void        g_relation_insert               (GRelation *relation,
--                                              ...);
-- gboolean    g_relation_exists               (GRelation *relation,
--                                              ...);
-- gint        g_relation_count                (GRelation *relation,
--                                              gconstpointer key,
--                                              gint field);
-- GTuples*    g_relation_select               (GRelation *relation,
--                                              gconstpointer key,
--                                              gint field);
-- gint        g_relation_delete               (GRelation *relation,
--                                              gconstpointer key,
--                                              gint field);
-- void        g_relation_destroy              (GRelation *relation);

-- void        g_relation_print                (GRelation *relation);

--             GTuples;
-- void        g_tuples_destroy                (GTuples *tuples);
-- gpointer    g_tuples_index                  (GTuples *tuples,
--                                              gint index_,
--                                              gint field);

-- Description

-- A GRelation is a table of data which can be indexed on any number of fields, rather like simple database tables. A GRelation contains a number of records, called tuples. Each record contains a number of fields. Records are not ordered, so it is not possible to find the record at a particular index.

-- Note that GRelation tables are currently limited to 2 fields.

-- To create a GRelation, use g_relation_new().

-- To specify which fields should be indexed, use g_relation_index(). Note that this must be called before any tuples are added to the GRelation.

-- To add records to a GRelation use g_relation_insert().

-- To determine if a given record appears in a GRelation, use g_relation_exists(). Note that fields are compared directly, so pointers must point to the exact same position (i.e. different copies of the same string will not match.)

-- To count the number of records which have a particular value in a given field, use g_relation_count().

-- To get all the records which have a particular value in a given field, use g_relation_select(). To access fields of the resulting records, use g_tuples_index(). To free the resulting records use g_tuples_destroy().

-- To delete all records which have a particular value in a given field, use g_relation_delete().

-- To destroy the GRelation, use g_relation_destroy().

-- To help debug GRelation objects, use g_relation_print().
-- Details
-- GRelation

-- typedef struct _GRelation GRelation;

-- The GRelation struct is an opaque data structure to represent a Relation. It should only be accessed via the following functions.
-- g_relation_new ()

-- GRelation*  g_relation_new                  (gint fields);

-- Creates a new GRelation with the given number of fields. Note that currently the number of fields must be 2.
-- fields : 	the number of fields.
-- Returns : 	a new GRelation.
-- g_relation_index ()

-- void        g_relation_index                (GRelation *relation,
--                                              gint field,
--                                              GHashFunc hash_func,
--                                              GEqualFunc key_equal_func);

-- Creates an index on the given field. Note that this must be called before any records are added to the GRelation.
-- relation : 	a GRelation.
-- field : 	the field to index, counting from 0.
-- hash_func : 	a function to produce a hash value from the field data.
-- key_equal_func : 	a function to compare two values of the given field.
-- g_relation_insert ()

-- void        g_relation_insert               (GRelation *relation,
--                                              ...);

-- Inserts a record into a GRelation.
-- relation : 	a GRelation.
-- ... : 	the fields of the record to add. This must match the number of fields in the GRelation.
-- g_relation_exists ()

-- gboolean    g_relation_exists               (GRelation *relation,
--                                              ...);

-- Returns TRUE if a record with the given values exists in a GRelation. Note that the values are compared directly, so that, for example, two copies of the same string will not match.
-- relation : 	a GRelation.
-- ... : 	the fields of the record to compare. The number must match the number of fields in the GRelation.
-- Returns : 	TRUE if a record matches.
-- g_relation_count ()

-- gint        g_relation_count                (GRelation *relation,
--                                              gconstpointer key,
--                                              gint field);

-- Returns the number of tuples in a GRelation that have the given value in the given field.
-- relation : 	a GRelation.
-- key : 	the value to compare with.
-- field : 	the field of each record to match.
-- Returns : 	the number of matches.
-- g_relation_select ()

-- GTuples*    g_relation_select               (GRelation *relation,
--                                              gconstpointer key,
--                                              gint field);

-- Returns all of the tuples which have the given key in the given field. Use g_tuples_index() to access the returned records. The returned records should be freed with g_tuples_destroy().
-- relation : 	a GRelation.
-- key : 	the value to compare with.
-- field : 	the field of each record to match.
-- Returns : 	the records (tuples) that matched.
-- g_relation_delete ()

-- gint        g_relation_delete               (GRelation *relation,
--                                              gconstpointer key,
--                                              gint field);

-- Deletes any records from a GRelation that have the given key value in the given field.
-- relation : 	a GRelation.
-- key : 	the value to compare with.
-- field : 	the field of each record to match.
-- Returns : 	the number of records deleted.
-- g_relation_destroy ()

-- void        g_relation_destroy              (GRelation *relation);

-- Destroys the GRelation, freeing all memory allocated. However, it does not free memory allocated for the tuple data, so you should free that first if appropriate.
-- relation : 	a GRelation.
-- g_relation_print ()

-- void        g_relation_print                (GRelation *relation);

-- Outputs information about all records in a GRelation, as well as the indexes. It is for debugging.
-- relation : 	a GRelation.
-- GTuples

-- typedef struct {
--   guint len;
-- } GTuples;

-- The GTuples struct is used to return records (or tuples) from the GRelation by g_relation_select(). It only contains one public member - the number of records that matched. To access the matched records, you must use g_tuples_index().
-- guint len; 	the number of records that matched.
-- g_tuples_destroy ()

-- void        g_tuples_destroy                (GTuples *tuples);

-- Frees the records which were returned by g_relation_select(). This should always be called after g_relation_select() when you are finished with the records. The records are not removed from the GRelation.
-- tuples : 	the tuple data to free.
-- g_tuples_index ()

-- gpointer    g_tuples_index                  (GTuples *tuples,
--                                              gint index_,
--                                              gint field);

-- Gets a field from the records returned by g_relation_select(). It returns the given field of the record at the given index. The returned value should not be changed.
-- tuples : 	the tuple data, returned by g_relation_select().
-- index_ : 	the index of the record.
-- field : 	the field to return.
-- Returns : 	the field of the record.
end
