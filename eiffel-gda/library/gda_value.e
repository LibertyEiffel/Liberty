indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 $EWLC_developer, $original_copyright_holder
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

	wrapped_version: "3.0.1"

class GDA_VALUE
	-- A single value stored in a GdaDataModel

	-- libgda manages each individual value within an opaque GValue
	-- structure.  Any GValue type can be used, and libgda adds a few
	-- more data types usually found in DBMS such as NUMERIC, TIME,
	-- TIMESTAMP, GEOMETRIC POINT, BINARY and BLOB.
	
	--   Libgda makes a distinction between binary and blob types
	
	-- o binary data can be inserted into an SQL statement using a
	--   (DBMS dependant) syntax, such as "X'ABCD'" syntax for SQLite
	--   or the binary strings syntax for PostgreSQL. Binary data is
	--   manipulated using a GdaBinary structure (which is basically a
	--   bytes buffer and a length attribute).
	
	-- o blob data are a special feature that some DBMS have which
	--   requires some non SQL code to manipulate them. Usually only a
	--   reference is stored in each table containing a blob, and the
	--   actual blob data resides somewhere on the disk (while still
	--   being managed transparently by the database). For example
	--   PotsgreSQL stores blobs as files on the disk and references
	--   them using object identifiers (Oid). Blob data is manipulated
	--   using a GdaBlob structure which encapsulates a GdaBinary
	--   structure and adds a reference to a GdaBlobOp object used to
	--   read and write data from and to the blob.

	-- Please note that is distinction between binary data and blobs is
	-- Libgda only and does not reflect the DBMS's documentations; for
	-- instance MySQL has several BLOB types but Libgda interprets them
	-- as binary types.

	-- Each provider or connection can be queried about its blob
	-- support using the gda_server_provider_supports_feature() or
	-- gda_connection_supports_feature() methods.

	-- The NULL value is a special case value: it is represented by to
	-- a zero-filled (uninitialized) GValue and has a type equal to
	-- GDA_TYPE_NULL.

inherit 
	G_VALUE redefine dispose end
	COMPARABLE undefine copy, is_equal redefine compare end

insert GLIB_BASIC_TYPES

creation
	make, from_external_pointer, with_gtype,
	make_boolean, make_integer, make_natural, make_real, make_real_32,
	make_enum, make_string, make_object, make_pointer,
	from_boolean, from_integer, from_natural, from_real, from_enum,
	from_string, from_object, from_pointer,
	make_null 


feature {}	--  gda_value_new ()
	--
	-- GValue*             gda_value_new                       (GType type);
	--
	--   Makes a new GValue of type type.
	--
	--   type :    the new value type.
	--   Returns : the newly created GValue with the specified type. You need to
	--             set the value in the returned GValue.
	--

	make_null is
			-- Create a new SQL-NULL value
		do
			from_external_pointer(gda_value_new_null)
		end

	-- TODO: wrap gda_value_new_binary ()
	--
	-- GValue*             gda_value_new_binary                (const guchar *val,
	--                                                          glong size);
	--
	--   Makes a new GValue of type GDA_TYPE_BINARY with value val.
	--
	--   val :     value to set for the new GValue.
	--   size :    the size of the memory pool pointer to by val.
	--   Returns : the newly created GValue.
	--

	-- TODO: wrap gda_value_new_blob ()
	--
	-- GValue*             gda_value_new_blob                  (const guchar *val,
	--                                                          glong size);
	--
	--   Makes a new GValue of type GDA_TYPE_BLOB with value val.
	--
	--   val :     value to set for the new GValue.
	--   size :    the size of the memory pool pointer to by val.
	--   Returns : the newly created GValue.

	-- TODO: from_time (a_time: TIME) is
	--  Makes a new GValue of type GDA_TYPE_TIMESTAMP with value `a_time'.
	-- do
	--	from_external_pointer(gda_value_new_timestamp_from_timet(a_time))
	-- end

	from_string_and_type (a_string: STRING; a_type: like g_type) is
	--   Makes a new GValue of type type from its string representation.
	--
	--   as_string : stringified representation of the value.
	--   type :      the new value type.
	--   Returns :   the newly created GValue or NULL if the string representation
	--               cannot be converted to the specified type.
		local p: POINTER
		do		
			p := gda_value_new_from_string (a_string.to_external, a_type)
		end

	--  gda_value_new_from_xml ()
	--
	-- GValue*             gda_value_new_from_xml              (const xmlNodePtr node);
	--
	--   Creates a GValue from a XML representation of it. That XML node
	--   corresponds to the following string representation: <value
	--   type="gdatype">value</value>
	--
	--   node :    a XML node representing the value.
	--   Returns : the newly created GValue.
	--

feature
	dispose is
			--   Deallocates all memory associated to a GValue.
		do
			gda_value_free(handle)
			handle := default_pointer
		end

feature 
	reset_with_type (a_type: like g_type) is
		do
			gda_value_reset_with_type(handle, a_type)
		end

	is_null_type: BOOLEAN is
			--  Is Current value of type GDA_TYPE_NULL?
		do
			Result:=gda_value_is_null(handle).to_boolean
		end

	is_number: BOOLEAN is
			-- Is Current value of numeric type?
		do
			Result:=gda_value_is_number(handle).to_boolean
		end

	--  gda_value_isa()
	--
	-- #define gda_value_isa(value, type) (G_VALUE_HOLDS(value, type))
	--
	--   value :
	--   type :

feature

	--
	-- GValue*             gda_value_copy                      (const GValue *value);
	--
	--   Creates a new GValue from an existing one.
	--
	--   value :   value to get a copy from.
	--   Returns : a newly allocated GValue with a copy of the data in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_binary_copy ()
	--
	-- gpointer            gda_binary_copy                     (gpointer boxed);
	--
	--   Creates a new GdaBinary structure from an existing one.
	--
	--   boxed :   source to get a copy from.
	--   Returns : a newly allocated GdaBinary which contains a copy of information
	--             in boxed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_binary_free ()
	--
	-- void                gda_binary_free                     (gpointer boxed);
	--
	--   Deallocates all memory associated to the given GdaBinary.
	--
	--   boxed : GdaBinary to free.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_blob_copy ()
	--
	-- gpointer            gda_blob_copy                       (gpointer boxed);
	--
	--   Creates a new GdaBlob structure from an existing one.
	--
	--   boxed :   source to get a copy from.
	--   Returns : a newly allocated GdaBlob which contains a copy of information
	--             in boxed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_blob_free ()
	--
	-- void                gda_blob_free                       (gpointer boxed);
	--
	--   Deallocates all memory associated to the given GdaBlob.
	--
	--   boxed : GdaBlob to free.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_geometricpoint_copy ()
	--
	-- gpointer            gda_geometricpoint_copy             (gpointer boxed);
	--
	--   boxed :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_geometricpoint_free ()
	--
	-- void                gda_geometricpoint_free             (gpointer boxed);
	--
	--   boxed :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_numeric_copy ()
	--
	-- gpointer            gda_numeric_copy                    (gpointer boxed);
	--
	--   Creates a new GdaNumeric structure from an existing one.
	--
	--   boxed :   source to get a copy from.
	--   Returns : a newly allocated GdaNumeric which contains a copy of
	--             information in boxed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_numeric_free ()
	--
	-- void                gda_numeric_free                    (gpointer boxed);
	--
	--   Deallocates all memory associated to the given boxed
	--
	--   boxed :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_time_copy ()
	--
	-- gpointer            gda_time_copy                       (gpointer boxed);
	--
	--   boxed :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_time_free ()
	--
	-- void                gda_time_free                       (gpointer boxed);
	--
	--   boxed :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_timestamp_copy ()
	--
	-- gpointer            gda_timestamp_copy                  (gpointer boxed);
	--
	--   boxed :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_timestamp_free ()
	--
	-- void                gda_timestamp_free                  (gpointer boxed);
	--
	--   boxed :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_get_binary ()
	--
	-- const GdaBinary*    gda_value_get_binary                (const GValue *value);
	--
	--   value :   a GValue whose value we want to get.
	--   Returns : the value stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_set_binary ()
	--
	-- void                gda_value_set_binary                (GValue *value,
	--                                                          const GdaBinary *binary);
	--
	--   Stores val into value.
	--
	--   value :  a GValue that will store val.
	--   binary : a GdaBinary structure with the data and its size to be stored in
	--            value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_take_binary ()
	--
	-- void                gda_value_take_binary               (GValue *value,
	--                                                          const GdaBinary *binary);
	--
	--   Stores val into value, but on the contrary to gda_value_set_binary(), the
	--   binary argument is not copied, but used as-is and it should be considered
	--   owned by value.
	--
	--   value :  a GValue that will store val.
	--   binary : a GdaBinary structure with the data and its size to be stored in
	--            value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_get_blob ()
	--
	-- const GdaBlob*      gda_value_get_blob                  (const GValue *value);
	--
	--   value :   a GValue whose value we want to get.
	--   Returns : the value stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_set_blob ()
	--
	-- void                gda_value_set_blob                  (GValue *value,
	--                                                          const GdaBlob *blob);
	--
	--   Stores val into value.
	--
	--   value : a GValue that will store val.
	--   blob :  a GdaBlob structure with the data and its size to be stored in
	--           value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_take_blob ()
	--
	-- void                gda_value_take_blob                 (GValue *value,
	--                                                          const GdaBlob *blob);
	--
	--   Stores val into value, but on the contrary to gda_value_set_blob(), the
	--   blob argument is not copied, but used as-is and it should be considered
	--   owned by value.
	--
	--   value : a GValue that will store val.
	--   blob :  a GdaBlob structure with the data and its size to be stored in
	--           value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_get_geometric_point ()
	--
	-- const GdaGeometricPoint* gda_value_get_geometric_point  (const GValue *value);
	--
	--   value :   a GValue whose value we want to get.
	--   Returns : the value stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_set_geometric_point ()
	--
	-- void                gda_value_set_geometric_point       (GValue *value,
	--                                                          const GdaGeometricPoint *val);
	--
	--   Stores val into value.
	--
	--   value : a GValue that will store val.
	--   val :   value to be stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_get_list ()
	--
	-- const GdaValueList* gda_value_get_list                  (const GValue *value);
	--
	--   value :   a GValue whose value we want to get.
	--   Returns : the value stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_set_list ()
	--
	-- void                gda_value_set_list                  (GValue *value,
	--                                                          const GdaValueList *val);
	--
	--   Stores val into value.
	--
	--   value : a GValue that will store val.
	--   val :   value to be stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_set_null ()
	--
	-- void                gda_value_set_null                  (GValue *value);
	--
	--   Sets the type of value to GDA_TYPE_NULL.
	--
	--   value : a GValue that will store a value of type GDA_TYPE_NULL.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_get_numeric ()
	--
	-- const GdaNumeric*   gda_value_get_numeric               (const GValue *value);
	--
	--   value :   a GValue whose value we want to get.
	--   Returns : the value stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_set_numeric ()
	--
	-- void                gda_value_set_numeric               (GValue *value,
	--                                                          const GdaNumeric *val);
	--
	--   Stores val into value.
	--
	--   value : a GValue that will store val.
	--   val :   value to be stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_get_short ()
	--
	-- gshort              gda_value_get_short                 (const GValue *value);
	--
	--   value :   a GValue whose value we want to get.
	--   Returns : the value stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_set_short ()
	--
	-- void                gda_value_set_short                 (GValue *value,
	--                                                          const gshort val);
	--
	--   Stores val into value.
	--
	--   value : a GValue that will store val.
	--   val :   value to be stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_get_ushort ()
	--
	-- gushort             gda_value_get_ushort                (const GValue *value);
	--
	--   value :   a GValue whose value we want to get.
	--   Returns : the value stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_set_ushort ()
	--
	-- void                gda_value_set_ushort                (GValue *value,
	--                                                          const gushort val);
	--
	--   Stores val into value.
	--
	--   value : a GValue that will store val.
	--   val :   value to be stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_get_time ()
	--
	-- const GdaTime*      gda_value_get_time                  (const GValue *value);
	--
	--   value :   a GValue whose value we want to get.
	--   Returns : the value stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_set_time ()
	--
	-- void                gda_value_set_time                  (GValue *value,
	--                                                          const GdaTime *val);
	--
	--   Stores val into value.
	--
	--   value : a GValue that will store val.
	--   val :   value to be stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_get_timestamp ()
	--
	-- const GdaTimestamp* gda_value_get_timestamp             (const GValue *value);
	--
	--   value :   a GValue whose value we want to get.
	--   Returns : the value stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_set_timestamp ()
	--
	-- void                gda_value_set_timestamp             (GValue *value,
	--                                                          const GdaTimestamp *val);
	--
	--   Stores val into value.
	--
	--   value : a GValue that will store val.
	--   val :   value to be stored in value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_set_from_string ()
	--
	-- gboolean            gda_value_set_from_string           (GValue *value,
	--                                                          const gchar *as_string,
	--                                                          GType type);
	--
	--   Stores the value data from its string representation as type.
	--
	--   value :     a GValue that will store val.
	--   as_string : the stringified representation of the value.
	--   type :      the type of the value
	--   Returns :   TRUE if the value has been converted to type from its string
	--               representation; it not means that the value is converted
	--               successfully, just that the transformation is avairable. FALSE
	--               otherwise.
	--
	--   --------------------------------------------------------------------------
	--
	set_from_value (a_value: G_VALUE) is
			-- Sets the value of Current GDA_VALUE from `another'. This
			-- is different from `copy' creation feature which creates a
			-- new object. gda_value_set_from_value, on the other hand,
			-- copies the contents of copy into value, which must already
			-- be allocated.
		require not_void: a_value /= Void
		local discarded: INTEGER
		do
			discarded := gda_value_set_from_value(handle, a_value.handle)
			--   Returns : TRUE if successful, FALSE otherwise.
		end

	to_string: STRING is
			-- Converts a GValue to its string representation which is a
			-- human readable value. Note that the returned string does
			-- not take into account the current locale of the user (on
			-- the contrary to the GdaDataHandler objects). Using this
			-- function should be limited to debugging and values
			-- serialization purposes.

			-- Dates are converted in a YYYY-MM-DD format.
		
			-- Void if the conversion cannot be done.
		local cstr: POINTER
		do
			-- TODO: the value shall be freed the value with a g_free()
			-- when you've finished using it.

			cstr := gda_value_stringify(handle)
			if cstr.is_not_null then create Result.from_external(cstr) end
		end

	infix "<" (another: like Current): BOOLEAN is
		do
			Result:=compare(another)<0
		end

	compare (another: like Current): INTEGER is
			-- Compares two values of the same type. Result is 0 if both
			-- Current and `another' contain the same value, an integer
			-- less than 0 if Current is less than `another' or an integer
			-- greater than 0 if Current is greater than `another'.

			-- TODO: GDA also offer the gda_value_compare_ext that should
			-- be wrapped.
		require else same_type: type = another.type
		do
			Result := gda_value_compare (handle, another.handle)
		end

	--  gda_value_compare_ext ()
	--
	-- gint                gda_value_compare_ext               (const GValue *value1,
	--                                                          const GValue *value2);
	--
	--   Like gda_value_compare(), compares two values of the same type, except
	--   that NULL values and values of type GDA_TYPE_NULL are considered equals
	--
	--   value1 :  a GValue to compare.
	--   value2 :  the other GValue to be compared to value1.
	--   Returns : 0 if both contain the same value, an integer less than 0 if
	--             value1 is less than value2 or an integer greater than 0 if
	--             value1 is greater than value2.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_value_to_xml ()
	--
	-- xmlNodePtr          gda_value_to_xml                    (const GValue *value);
	--
	--   Serializes the given GValue to a XML node string.
	--
	--   value :   a GValue.
	--   Returns : the XML node. Once not needed anymore, you should free it.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_binary_to_string ()
	--
	-- gchar*              gda_binary_to_string                (const GdaBinary *bin,
	--                                                          guint maxlen);
	--
	--   Converts all the non printable characters of bin->data into the \xxx
	--   representation where xxx is the octal representation of the byte, and the
	--   '\' (backslash) character is converted to "\\".
	--
	--   bin :     a correctly filled GdaBinary structure
	--   maxlen :  a maximum len used to truncate, or 0 for no maximum length
	--   Returns : a new string from bin
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_string_to_binary ()
	--
	-- gboolean            gda_string_to_binary                (const gchar *str,
	--                                                          GdaBinary *bin);
	--
	--   Performs the reverse of gda_binary_to_string().
	--
	--   str :     a string to convert
	--   bin :     a non filled GdaBinary structure
	--   Returns : TRUE if no error were found in str, or FALSE otherwise
	--
	--See Also
	--
	--   The GdaBlobOp object which operates on blobs

	--  GdaGeometricPoint
	--
	-- typedef struct {
	--         gdouble x;
	--         gdouble y;
	-- } GdaGeometricPoint;
	--
	--   --------------------------------------------------------------------------
	--
	--  GdaNumeric
	--
	-- typedef struct {
	--         gchar *number;
	--         glong precision;
	--         glong width;
	-- } GdaNumeric;
	--
	--   --------------------------------------------------------------------------
	--
	--  GdaTime
	--
	-- typedef struct {
	--         gushort hour;
	--         gushort minute;
	--         gushort second;
	--         gulong fraction;
	--         glong timezone; /* # of seconds to the east UTC */
	-- } GdaTime;
	--
	--   --------------------------------------------------------------------------
	--
	--  GdaTimestamp
	--
	-- typedef struct {
	--         gshort year;
	--         gushort month;
	--         gushort day;
	--         gushort hour;
	--         gushort minute;
	--         gushort second;
	--         gulong fraction;
	--         glong timezone; /* # of seconds to the east UTC */
	-- } GdaTimestamp;
	--
	--   --------------------------------------------------------------------------
	--
	--  GdaBinary
	--
	-- typedef struct {
	--         guchar *data;
	--         glong   binary_length;
	-- } GdaBinary;
	--
	--   --------------------------------------------------------------------------
	--
	--  GdaBlob
	--
	-- typedef struct {
	--         GdaBinary  data;
	--         GdaBlobOp *op; /* set up by providers if the GdaBlob is linked to something actually existing in the database,
	--                           useable by anyone */
	-- } GdaBlob;
	--
	--   --------------------------------------------------------------------------
feature {} -- External calls
	--                     GdaGeometricPoint;
	--                     GdaNumeric;
	--                     GdaTime;
	--                     GdaTimestamp;
	--                     GdaBinary;
	--                     GdaBlob;
	-- typedef             GdaValueList;

	gda_value_new (a_type: like g_type): POINTER is
			-- GValue* gda_value_new (GType type);
		external "C use <libgda/libgda.h>"
		end

	gda_value_new_null: POINTER is
		external "C macro use <libgda/libgda.h>"
		end

	gda_value_new_binary (a_val: POINTER; a_size: INTEGER): POINTER is
			-- GValue* gda_value_new_binary (const guchar *val, glong size);
		external "C use <libgda/libgda.h>"
		end

	gda_value_new_blob (a_val: POINTER; a_size: INTEGER): POINTER is
			-- GValue* gda_value_new_blob (const guchar *val, glong size);
		external "C use <libgda/libgda.h>"
		end

	gda_value_new_timestamp_from_timet (a_time_t: INTEGER): POINTER is
			-- GValue* gda_value_new_timestamp_from_timet (time_t val);
		external "C use <libgda/libgda.h>"
		end

	gda_value_new_from_string (a_string: POINTER; a_gtype: like g_type): POINTER is
			-- GValue* gda_value_new_from_string (const gchar *as_string, GType type);
		external "C use <libgda/libgda.h>"
		end

	-- TODO: GValue* gda_value_new_from_xml (const xmlNodePtr node);

	gda_value_free (a_value: POINTER) is
			-- void gda_value_free (GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_reset_with_type (a_value: POINTER; a_gtype: like g_type) is
			-- void gda_value_reset_with_type (GValue *value, GType type);
		external "C use <libgda/libgda.h>"
		end

	gda_value_is_null (a_value: POINTER;): INTEGER is
			-- gboolean gda_value_is_null (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_is_number (a_value: POINTER;): INTEGER is
			-- gboolean gda_value_is_number (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	-- #define gda_value_isa (value, type)
	gda_value_copy (a_value: POINTER;): POINTER is
			-- GValue* gda_value_copy (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_binary_copy (a_boxed: POINTER): POINTER is
			-- gpointer gda_binary_copy (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_binary_free (a_boxed: POINTER) is
			-- void gda_binary_free (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_blob_copy (a_boxed: POINTER): POINTER is
			-- gpointer gda_blob_copy (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_blob_free (a_boxed: POINTER) is
			-- void gda_blob_free (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_geometricpoint_copy (a_boxed: POINTER): POINTER is
			-- gpointer gda_geometricpoint_copy (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_geometricpoint_free (a_boxed: POINTER) is
			-- void gda_geometricpoint_free (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_numeric_copy (a_boxed: POINTER): POINTER is
			-- gpointer gda_numeric_copy (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_numeric_free (a_boxed: POINTER) is
			-- void gda_numeric_free (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_time_copy (a_boxed: POINTER): POINTER is
			-- gpointer gda_time_copy (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_time_free (a_boxed: POINTER) is
			-- void gda_time_free (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_timestamp_copy (a_boxed: POINTER): POINTER is
			-- gpointer gda_timestamp_copy (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_timestamp_free (a_boxed: POINTER) is
			-- void gda_timestamp_free (gpointer boxed);
		external "C use <libgda/libgda.h>"
		end

	gda_value_get_binary (a_value: POINTER;): POINTER is
			-- const GdaBinary* gda_value_get_binary (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_binary (a_value, a_binary: POINTER) is
			-- void gda_value_set_binary (GValue *value, const GdaBinary *binary);
		external "C use <libgda/libgda.h>"
		end

	gda_value_take_binary (a_value, a_binary: POINTER) is
			-- void gda_value_take_binary (GValue *value, const GdaBinary *binary);
		external "C use <libgda/libgda.h>"
		end

	gda_value_get_blob (a_value: POINTER): POINTER is
			-- const GdaBlob* gda_value_get_blob (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_blob (a_value, a_blob: POINTER) is
			-- void gda_value_set_blob (GValue *value, const GdaBlob *blob);
		external "C use <libgda/libgda.h>"
		end

	gda_value_take_blob (a_value, a_blob: POINTER) is
			-- void gda_value_take_blob (GValue *value, const GdaBlob *blob);
		external "C use <libgda/libgda.h>"
		end

	gda_value_get_geometric_point (a_value: POINTER): POINTER is
			-- const GdaGeometricPoint* gda_value_get_geometric_point (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_geometric_point (a_value, a_geometric_point: POINTER) is
			-- void gda_value_set_geometric_point (GValue *value, const GdaGeometricPoint *val);
		external "C use <libgda/libgda.h>"
		end

	gda_value_get_list (a_value: POINTER): POINTER is
			-- const GdaValueList* gda_value_get_list (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_list (a_value, a_gdavaluelist: POINTER) is
			-- void gda_value_set_list (GValue *value, const GdaValueList *val);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_null (a_value: POINTER) is
			-- void gda_value_set_null (GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_get_numeric (a_value: POINTER): POINTER is
			-- const GdaNumeric* gda_value_get_numeric (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_numeric (a_value, a_numeric: POINTER) is
			-- void gda_value_set_numeric (GValue *value, const GdaNumeric *val);
		external "C use <libgda/libgda.h>"
		end

	gda_value_get_short (a_value: POINTER) is
			-- gshort gda_value_get_short (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_short (a_value: POINTER; a_val: INTEGER) is
			-- void gda_value_set_short (GValue *value, const gshort val);
		external "C use <libgda/libgda.h>"
		end

	gda_value_get_ushort (a_value: POINTER): INTEGER is
			-- gushort gda_value_get_ushort (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_ushort (a_value: POINTER; a_val: like gushort) is
			-- void gda_value_set_ushort (GValue *value, const gushort val);
		external "C use <libgda/libgda.h>"
		end

	gda_value_get_time (a_value: POINTER): POINTER is
			-- const GdaTime* gda_value_get_time (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_time (a_value, a_time_value: POINTER) is
			-- void gda_value_set_time (GValue *value, const GdaTime *val);
		external "C use <libgda/libgda.h>"
		end

	gda_value_get_timestamp (a_value: POINTER): POINTER is
			-- const GdaTimestamp* gda_value_get_timestamp (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_timestamp (a_value, a_timestamp_val: POINTER) is
			-- void gda_value_set_timestamp (GValue *value, const GdaTimestamp *val);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_from_string (a_value, a_string: POINTER; a_type: like g_type): INTEGER is
			-- gboolean gda_value_set_from_string (GValue *value, const gchar *as_string, GType type);
		external "C use <libgda/libgda.h>"
		end

	gda_value_set_from_value (a_value, a_from_value: POINTER): INTEGER is
			-- gboolean gda_value_set_from_value (GValue *value, const GValue *from);
		external "C use <libgda/libgda.h>"
		end

	gda_value_stringify (a_value: POINTER): POINTER is
			-- gchar* gda_value_stringify (const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_value_compare (a_value, another: POINTER): INTEGER is
			-- gint gda_value_compare (const GValue *value1, const GValue *value2);
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_compare_ext (a_value, another: POINTER): INTEGER is
			-- gint gda_value_compare_ext (const GValue *value1, const GValue *value2);
		external "C use <libgda/libgda.h>"
		end

	-- TODO: xmlNodePtr gda_value_to_xml (const GValue *value);

	gda_binary_to_string (a_bin: POINTER; a_maxlen: INTEGER): POINTER is
			-- gchar* gda_binary_to_string (const GdaBinary *bin, guint maxlen);
		external "C use <libgda/libgda.h>"
		end

	gda_string_to_binary (a_string, a_binary: POINTER): INTEGER is
			-- gboolean gda_string_to_binary (const gchar *str, GdaBinary *bin);
		external "C use <libgda/libgda.h>"
		end

end -- class GDA_VALUE
