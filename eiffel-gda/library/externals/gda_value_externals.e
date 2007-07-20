indexing
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_VALUE_EXTERNALS

inherit ANY undefine is_equal, copy end


insert  
	GDA_VALUE_TYPE_ENUM

feature {} -- size

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaValue)"
		end

 
feature {} -- Accessing 
--   GdaValue

--  typedef struct {
--          GdaValueType type;
--          union {
--                  gint64 v_bigint;
--                  guint64 v_biguint;
--                  gpointer v_binary;
--                  GdaBlob v_blob;
--                  gboolean v_boolean;
--                  GdaDate v_date;
--                  gdouble v_double;
--                  GdaGeometricPoint v_point;
--                  GObject *v_gobj;
--                  gint v_integer;
--                  GdaValueList *v_list;
--                  GdaMoney v_money;
--                  GdaNumeric v_numeric;
--                  gfloat v_single;
--                  gshort v_smallint;
--                  gushort v_smalluint;
--                  gchar *v_string;
--                  GdaTime v_time;
--                  GdaTimestamp v_timestamp;
--                  gchar v_tinyint;
--                  guchar v_tinyuint;
--                  GdaValueType v_type;
--                  guint v_uinteger;
--          } value;
--          glong binary_length;
--  } GdaValue;

   ----------------------------------------------------------------------------------------------
feature {} -- External calls
   timezone_invalid: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "TIMEZONE_INVALID"
		end

	gda_value_get_gtype: INTEGER is
			--  GType gda_value_get_gtype (void)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_null: POINTER is 
			--  GdaValue* gda_value_new_null (void)
		external "C use <libgda/libgda.h>"
		end
	    
	gda_value_new_bigint (a_val: INTEGER_64): POINTER is
			--  GdaValue* gda_value_new_bigint (gint64 val)
		external "C use <libgda/libgda.h>"
		end
	    
	gda_value_new_biguint (a_value: INTEGER_64): POINTER is 
			--  GdaValue* gda_value_new_biguint (guint64 val)
			-- a_value should be NATURAL_64
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_binary (a_value: POINTER; a_size: INTEGER): POINTER is
			--  GdaValue* gda_value_new_binary (gconstpointer val, glong size)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_blob (a_blob: POINTER): POINTER is 
			--  GdaValue* gda_value_new_blob (const GdaBlob *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_boolean (a_gboolean: INTEGER): POINTER is 
			--  GdaValue* gda_value_new_boolean (gboolean val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_date (a_date: POINTER): POINTER is 
			--  GdaValue* gda_value_new_date (const GdaDate *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_double (a_double: REAL): POINTER is
			--  GdaValue* gda_value_new_double (gdouble val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_geometric_point (a_gdageometricpoint: POINTER): POINTER is
      	      --  GdaValue* gda_value_new_geometric_point (const GdaGeometricPoint *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_gobject (a_gobject: POINTER): POINTER is
			--  GdaValue* gda_value_new_gobject (const GObject *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_integer (an_int: INTEGER): POINTER is
			--  GdaValue* gda_value_new_integer (gint val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_list (a_list: POINTER): POINTER is 
			--  GdaValue* gda_value_new_list (const GdaValueList *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_money (a_gdamoney: POINTER): POINTER is
			--  GdaValue* gda_value_new_money (const GdaMoney *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_numeric (a_numeric: POINTER): POINTER is
			--  GdaValue* gda_value_new_numeric (const GdaNumeric *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_single (a_float: REAL_32): POINTER is
			--  GdaValue* gda_value_new_single (gfloat val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_smallint (a_short: INTEGER_16): POINTER is
			--  GdaValue* gda_value_new_smallint (gshort val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_smalluint (an_ushort: INTEGER_16): POINTER is 
			--  GdaValue* gda_value_new_smalluint (gushort val)
			-- an_ushort should be a NATURAL_16
		external "C use <libgda/libgda.h>"
		end
	    
	gda_value_new_string (a_string: POINTER): POINTER is
			--  GdaValue* gda_value_new_string (const gchar *val)
		external "C use <libgda/libgda.h>"
		end
	    
	gda_value_new_time (a_time: POINTER): POINTER is
			--  GdaValue* gda_value_new_time (const GdaTime *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_timestamp (a_timestamp): POINTER is
			--  GdaValue* gda_value_new_timestamp (const GdaTimestamp *val)
		external "C use <libgda/libgda.h>"
		end
	
	-- TODO what's a time_t gda_value_new_timestamp_from_timet (time_t val): POINTER is -- GdaValue*
	--  GdaValue* gda_value_new_timestamp_from_timet (time_t val)
	-- external "C use <libgda/libgda.h>"
	-- end
	
	gda_value_new_tinyint (a_value: INTEGER_8): POINTER is
			--  GdaValue* gda_value_new_tinyint (gchar val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_tinyuint (an_unsigned: INTEGER_8): POINTER is
			--  GdaValue* gda_value_new_tinyuint (guchar val)
			-- an_unsigned should be a NATURAL_8
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_type (a_type: INTEGER): POINTER is 
			--  GdaValue* gda_value_new_type (GdaValueType val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_uinteger (an_unsigned: INTEGER): POINTER is 
			--  GdaValue* gda_value_new_uinteger (guint val)
			-- an_unsigned should be a NATURAL
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_new_from_string (a_string: STRING; a_type: INTEGER): POINTER is
			--  GdaValue* gda_value_new_from_string (const gchar *as_string, GdaValueType type)
		external "C use <libgda/libgda.h>"
		end
	
	-- TODO: gda_value_new_from_xml (const xmlNodePtr node): POINTER is -- GdaValue*
	-- GdaValue* gda_value_new_from_xml (const xmlNodePtr node)
	--	external "C use <libgda/libgda.h>"
	-- end
	    
	gda_value_free (a_value: POINTER) is
			--  void gda_value_free (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	    
	gda_value_get_type (a_value: POINTER): INTEGER is
			--  GdaValueType gda_value_get_type (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_isa (a_value: POINTER; a_type: INTEGER): INTEGER is
			--  #define gda_value_isa (value,type)
		external "C macro use <libgda/libgda.h>"
		end
	
	gda_value_is_null (a_value: POINTER): INTEGER is
			--  gboolean gda_value_is_null (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_is_number (a_value: POINTER): INTEGER is
			--  gboolean gda_value_is_number (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_copy (a_value: POINTER): POINTER is -- GdaValue*
			--  GdaValue* gda_value_copy (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_bigint (a_value: POINTER): INTEGER_64 is
			--  gint64 gda_value_get_bigint (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_bigint (a_value: POINTER; a_value: INTEGER_64) is
			--  void gda_value_set_bigint (GdaValue *value, gint64 val)
		external "C use <libgda/libgda.h>"
		end
	    
	gda_value_get_biguint (a_value: POINTER): INTEGER_64 is
			--  guint64 gda_value_get_biguint (GdaValue *value)
			-- result should be NATURAL_64
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_biguint (a_value: POINTER; a_value: INTEGER_64) is
			--  void gda_value_set_biguint (GdaValue *value, guint64 val)
			-- a_value should be a NATURAL_64
		external "C use <libgda/libgda.h>"
		end
	    
	-- TODO: const gpointer gda_value_get_binary (a_value: POINTER, glong *size) is
	--  const gpointer gda_value_get_binary (GdaValue *value, glong *size)
	-- external "C use <libgda/libgda.h>"
	-- end
	    
	-- gda_value_set_binary (a_value: POINTER, gconstpointer val, glong size) is
	--  void gda_value_set_binary (GdaValue *value, gconstpointer val, glong size)
	-- external "C use <libgda/libgda.h>"
	-- end
	    
	gda_value_get_blob (a_value: POINTER): POINTER is
      	      --  const GdaBlob* gda_value_get_blob (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_blob (a_value, a_blog: POINTER) is
			--  void gda_value_set_blob (GdaValue *value, const GdaBlob *val)
		external "C use <libgda/libgda.h>"
		end
	    
	gda_value_get_boolean (a_value: POINTER): INTEGER is
			--  gboolean gda_value_get_boolean (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_boolean (a_value: POINTER; a_bool: INTEGER) is
			--  void gda_value_set_boolean (GdaValue *value, gboolean val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_date (a_value: POINTER): POINTER is
			--  const GdaDate* gda_value_get_date (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_date (a_value, a_date: POINTER) is
			--  void gda_value_set_date (GdaValue *value, const GdaDate *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_double (a_value: POINTER): REAL is
			--  gdouble gda_value_get_double (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	    
	gda_value_set_double (a_value: POINTER; a_double: REAL) is
			--  void gda_value_set_double (GdaValue *value, gdouble val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_geometric_point (a_value: POINTER): POINTER is
			--  const GdaGeometricPoint* gda_value_get_geometric_point (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_geometric_point (a_value, a_point: POINTER) is
			--  void gda_value_set_geometric_point (GdaValue *value, const GdaGeometricPoint *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_gobject (a_value: POINTER): POINTER is
			--  const GObject* gda_value_get_gobject (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_gobject (a_value, a_gobject: POINTER) is
			--  void gda_value_set_gobject (GdaValue *value, const GObject *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_integer (a_value: POINTER): INTEGER is
			--  gint gda_value_get_integer (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_integer (a_value: POINTER; an_int: INTEGER) is
			--  void gda_value_set_integer (GdaValue *value, gint val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_list (a_value: POINTER): POINTER is
			--  const GdaValueList* gda_value_get_list (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_list (a_value, a_list: POINTER) is
			--  void gda_value_set_list (GdaValue *value, const GdaValueList *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_null (a_value: POINTER) is
			--  void gda_value_set_null (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	    
	gda_value_get_money (a_value: POINTER): INTEGER is
			--  const GdaMoney* gda_value_get_money (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_money (a_value, a_money: POINTER) is
			--  void gda_value_set_money (GdaValue *value, const GdaMoney *val)
		external "C use <libgda/libgda.h>"
		end
	    
	gda_value_get_numeric (a_value: POINTER): POINTER is
			--  const GdaNumeric* gda_value_get_numeric (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_numeric (a_value, a_numeric: POINTER) is
			--  void gda_value_set_numeric (GdaValue *value, const GdaNumeric *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_single (a_value: POINTER): REAL_32 is
			--  gfloat gda_value_get_single (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_single (a_value: POINTER; a_float: REAL_32) is
			--  void gda_value_set_single (GdaValue *value, gfloat val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_smallint (a_value: POINTER): INTEGER_16 is
			--  gshort gda_value_get_smallint (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_smallint (a_value: POINTER; a_short: INTEGER_16) is
			--  void gda_value_set_smallint (GdaValue *value, gshort val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_smalluint (a_value: POINTER): INTEGER_16 is
			--  gushort gda_value_get_smalluint (GdaValue *value)
			-- Result should NATURAL_16
		external "C use <libgda/libgda.h>"
		end
	    
	gda_value_set_smalluint (a_value: POINTER; an_unsigned: INTEGER_16) is
			--  void gda_value_set_smalluint (GdaValue *value, gushort val)
			-- an_unsigned should be NATURAL_16
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_string (a_value: POINTER): POINTER is
			--  const gchar* gda_value_get_string (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_string (a_value, a_string: POINTER) is
			--  void gda_value_set_string (GdaValue *value, const gchar *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_time (a_value: POINTER): POINTER is
			--  const GdaTime* gda_value_get_time (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_time (a_value, a_time: POINTER) is
			--  void gda_value_set_time (GdaValue *value, const GdaTime *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_timestamp (a_value: POINTER): POINTER is
			--  const GdaTimestamp* gda_value_get_timestamp (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_timestamp (a_value, a_timestamp: POINTER) is
			--  void gda_value_set_timestamp (GdaValue *value, const GdaTimestamp *val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_tinyint (a_value: POINTER): INTEGER_8 is
			--  gchar gda_value_get_tinyint (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_tinyint (a_value: POINTER; a_tinyint: INTEGER_8) is
			--  void gda_value_set_tinyint (GdaValue *value, gchar val)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_tinyuint (a_value: POINTER): INTEGER_8 is
			--  guchar gda_value_get_tinyuint (GdaValue *value)
			-- Result should be NATURAL_8
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_tinyuint (a_value: POINTER; a_value: INTEGER_8) is
			--  void gda_value_set_tinyuint (GdaValue *value, guchar val)
			-- a_value should be NATURAL_8
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_uinteger (a_value: POINTER): INTEGER is
			--  guint gda_value_get_uinteger (GdaValue *value)
			-- REsult should be NATURAL
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_uinteger (a_value: POINTER a_value: INTEGER) is
			--  void gda_value_set_uinteger (GdaValue *value, guint val)
			-- a_value should be NATURAL
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_get_vtype (a_value: POINTER): INTEGER is
			--  GdaValueType gda_value_get_vtype (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_vtype (a_value: POINTER; a_type: INTEGER) is
			--  void gda_value_set_vtype (GdaValue *value, GdaValueType type)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_from_string (a_value, a_string: POINTER; a_type: INTEGER): INTEGER is
			-- gboolean gda_value_set_from_string (GdaValue *value, const
			-- gchar *as_string, GdaValueType type)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_set_from_value (a_value, another: POINTER): INTEGER is
			--  gboolean gda_value_set_from_value (GdaValue *value, const GdaValue *from)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_compare (a_value, another: POINTER): INTEGER is
			--  gint gda_value_compare (GdaValue *value1, GdaValue *value2)
		external "C use <libgda/libgda.h>"
		end
	
	gda_value_stringify (a_value: POINTER): POINTER is
			--  gchar* gda_value_stringify (GdaValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	-- TODO: how to wrap this? xmlNodePtr gda_value_to_xml (a_value: POINTER) is
	--  xmlNodePtr gda_value_to_xml (GdaValue *value)
	-- external "C use <libgda/libgda.h>"
	-- end
end -- GDA_VALUE_EXTERNALS
 

