indexing
	description: "gda-value -- Data values."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later Version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

implementation_notes: "[
							  GdaValueList is just a typed for GList; most
							  probably a GdaValueList will contain only
							  GdaVelues, and should be wrapped as a G_LIST [GDA_VALUE]
							  ]"

class GDA_VALUE

inherit
	SHARED_C_STRUCT
		redefine copy, dispose 
		end
insert GDA_VALUE_EXTERNALS

creation 

feature 
	gtype: INTEGER is
			-- G_type of GDA_VALUE
		once
			Result := gda_value_get_gtype 
		end            

feature {NONE} -- Creation
	make_null is
			-- Makes a new GdaValue of type null.
		do
			from_external_pointer (gda_value_new_null)
		ensure is_null_type: is_null_type
		end

	from_integer_64 (a_value: INTEGER_64) is
			-- Makes an INTEGER_64 GdaValue with `a_value'
		do
			from_external_pointer (gda_value_new_bigint (a_value))
		ensure is_integer_64: is_integer_64
		end

	from_natural_64 (a_value: INTEGER_64) is
			-- Makes a NATURAL_64 GdaValue with `a_value'. TODO: change 
			-- `a_value' type when NATURAL_64 will be available.
		obsolete "a_value should be NATURAL_64"
		require positive: a_value >= 0
		do
			from_external_pointer (gda_value_new_biguint (a_value))
		ensure is_natural_64
		end

   -- TODO: is make_binary (a_size: INTEGER) necessary?
   -- Makes a new GdaValue of type GDA_VALUE_TYPE_BINARY with value val.
	-- val :     value to set for the new GdaValue.
   -- size :    the size of the memory pool pointer to by val.
	-- do from_external_pointer (gda_value_new_binary (a_value, a_size)

	from_blob (a_blob: GDA_BLOB) is
			-- Make a GDA_VALUE from `a_blob'
		do
			from_external_pointer (gda_value_new_blob(a_blob.handle))
		ensure is_blob: is_blob
		end
	
	from_boolean (a_value: BOOLEAN) is
			-- Makes a new boolena GdaValue from `a_value'.
		do
			from_external_pointer (gda_value_new_boolean (a_value.to_integer))
		end

	from_date (a_date: GDA_DATE) is
			-- Makes a new date GdaValue from `a_date'.
		require date_not_void: a_date /= Void
		do
			from_external_pointer (gda_value_new_date (a_date.handle))
		ensure is_date: is_date
		end

	from_real (a_value: REAL) is
			-- Makes a new real GDA_VALUE from `a_value'
		do
			from_external_pointer (gda_value_new_double (a_value))
		ensure is_real: is_real
		end

	from_geometric_point (a_point: GDA_GEOMETRIC_POINT) is
			-- Makes a new GdaValue from `a_point'
		require point_not_void: a_point /= Void
		do
			from_external_pointer (gda_value_new_geometric_point (a_point.value))
		ensure is_geometric_point: is_geometric_point
		end

	
	from_gobject (a_gobject: G_OBJECT) is
			-- Makes a new GdaValue from `a_gobject'.
		do
			from_external_pointer (gda_value_new_gobject (a_gobject.handle))
		ensure is_gobject: is_gobject
		end

	from_integer (a_value: INTEGER) is
			-- Makes a new integer GdaValue from `a_value'.
		do
			from_external_pointer (gda_value_new_integer (a_value))
		ensure is_integer: is_integer
		end

	from_list (some_values: G_LIST [GDA_VALUE]) is
			-- Makes a new GdaValue holding a list of values.
		require 
			values_not_void: some_values /= Void
		do
			from_external_pointer(gda_value_new_list(some_values.handle))
		ensure is_list: is_list	
		end

	from_money (a_value: GDA_MONEY) is
		require 
			value_not_void: a_value /= Void
		do 
			from_external_pointer(gda_value_new_money(a_value.handle))
		ensure is_money: is_money
		end

	from_numeric (a_value: GDA_NUMERIC) is
			-- Makes a new numeric GdaValue from `a_value'.
		require 
			value_not_void: a_value /= Void
		do
			from_external_pointer (gda_value_new_numeric (a_value.handle))
		ensure is_numeric: is_numeric
		end

	from_real_32 (a_value: REAL_32) is 
			-- Makes a new GdaValue from `a_value'.
		do
			from_external_pointer(gda_value_new_single(a_value))
		ensure is_real_32: is_real_32
		end

	from_integer_16 (a_value: INTEGER_16) is
			-- Makes a new GdaValue from an INTEGER_16
		do
			from_external_pointer(gda_value_new_smallint(a_value))
		ensure is_integer_16: is_integer_16
		end

	from_natural_16 (a_value: INTEGER_16) is
			-- Makes a new GdaValue from a NATURAL_16
		obsolete "a_value should be a NATURAL_16"
		require positive: a_value >= 0
		do
			from_external_pointer(gda_value_new_smalluint(a_value))
		ensure is_natural_16: is_natural_16
		end

	from_string (a_string: STRING) is
			-- Makes a new GdaValue from `a_string'
		do
			from_external_pointer(gda_value_new_string(a_string.to_external))
		ensure is_string: is_string
		end

	from_time (a_value: GDA_TIME) is
			-- Makes a new date GdaValue from `a_value'.
		require a_value /= Void
		do
			from_external_pointer(gda_value_new_time(a_value.handle))
		ensure is_time: is_time
		end

	from_timestamp (a_value: GDA_TIMESTAMP) is
			-- Makes a new timestamp GdaValue with `a_value'.
		require value_not_void: a_value /= Void
		do
			from_external_pointer(gda_value_new_timestamp(a_value.handle))
		ensure is_timestamp: is_timestamp
		end
	
	-- TODO: gda_value_new_timestamp_from_timet ()

	--  GdaValue*   gda_value_new_timestamp_from_timet
	--                                              (time_t val);

	--    Makes a new GdaValue of type GDA_VALUE_TYPE_TIMESTAMP with value val (of type time_t).

	--    val :     value to set for the new GdaValue.
	--    Returns : the newly created GdaValue.

	--    ----------------------------------------------------------------------------------------------
	
	from_integer_8 (a_tiny_integer: INTEGER_8) is
			-- Makes a new INTEGER_8 GdaValue
		do
			from_external_pointer(gda_value_new_tinyint(a_tiny_integer))
		ensure is_integer_8: is_integer_8
		end

	from_natural_8 (a_natural_8: INTEGER_16) is
			-- Makes a new NATURAL_8 GdaValue from `a_tiny_natural_8'
		obsolete "a_tiny_natural_8 should be NATURAL_8"
		require fits_integer_8: a_natural_8.in_range ({INTEGER_16 0},
																	 {INTEGER_16 255})
		do
			from_external_pointer 
			(gda_value_new_tinyuint(a_natural_8.to_integer_8))
		ensure is_natural_8
		end


	-- gda_value_new_type ()

	--  GdaValue*   gda_value_new_type              (GdaValueType val);

	--    Makes a new GdaValue of type GDA_VALUE_TYPE_TYPE with value val.

	--    val :     Value to set for the new GdaValue.
	--    Returns : the newly created GdaValue.

	from_natural (a_natural: INTEGER) is
			-- Makes a new NATURAL GdaValue from `a_natural'
		do
			from_external_pointer(gda_value_new_uinteger(a_natural))


	--    Makes a new GdaValue of type GDA_VALUE_TYPE_UINTEGER with value val.

	--    val :     value to set for the new GdaValue.
l	--    Returns : the newly created GdaValue.

	--    ----------------------------------------------------------------------------------------------

	convert_from_string (a_string: STRING; a_type: INTEGER) is
			-- Makes a new GdaValue of `a_type' type from `a_string'
			-- representation. The created object will be of null type if
			-- the string representation cannot be converted to the
			-- specified type.
		require
			string_not_void: a_string /= Void
			valid_type: is_valid_type (a_type)
		local ptr: POINTER
		do
			ptr:=gda_value_new_from_string(a_string.to_external, a_type)
			if ptr.is_null 
			 then make_null
			else from_external_pointer(ptr)
			end
		end   

--   gda_value_new_from_xml ()

--  GdaValue*   gda_value_new_from_xml          (const xmlNodePtr node);

--    Creates a GdaValue from a XML representation of it. That XML node corresponds to the following
--    string representation: &lt;value type="gdatype"&gt;value&lt;/value&gt;

--    node :    a XML node representing the value.
--    Returns : the newly created GdaValue.

--    ----------------------------------------------------------------------------------------------
feature {} -- Disposing
	dispose is
			-- Deallocates all memory associated to a GdaValue.
		do
			gda_value_free (handle)
		end

feature -- Type queries
	type: INTEGER is
			-- the type of Current value.
		do
			Result := gda_value_get_type (handle)
		end

	is_null_type: BOOLEAN is
			-- Is Current value a Null?
		do
			Result:=(gda_value_is_null(handle)).to_boolean
		end


	is_number: BOOLEAN is
			-- Is Current value a numerical value of any kind?
		do
			Result:=(gda_value_is_number(handle)).to_boolean
		end


	is_integer_64: BOOLEAN is
			-- Is current value a bigint/INTEGER_64?
      do
			Result := (type = gda_value_type_bigint)
		end
	
	is_natural_64: BOOLEAN is
			-- Is current value a biguint/NATURAL_64?
      do
			result := (type = gda_value_type_biguint)
		end
	
	is_binary: BOOLEAN is
			-- Is current value a BINARY?
      do
			Result := (type = gda_value_type_binary)
		end
	
	is_blob: BOOLEAN is
			-- Is current value a BLOB?
      do
			Result := (type = gda_value_type_blob)
		end
	
	is_boolean: BOOLEAN is
			-- Is current value a BOOLEAN?
      do
			Result := (type = gda_value_type_boolean)
		end
	
	is_date: BOOLEAN is
			-- Is current value a DATE?
      do
			Result := (type = gda_value_type_date)
		end
	
	is_real: BOOLEAN is
			-- Is current value a double/REAL?
      do
			Result := (type = gda_value_type_double)
		end
	
	is_geometric_point: BOOLEAN is
		do
			Result := (type = gda_value_type_geometric_point)
		end
	
	is_gobject: BOOLEAN is
			-- Is current value a GOBJECT?
      do
			Result := (type = gda_value_type_gobject)
		end
	
	is_integer: BOOLEAN is
			-- Is current value a INTEGER?
      do
			Result := (type = gda_value_type_integer)
		end
	
	is_list: BOOLEAN is
			-- Is current value a LIST?
      do
			Result := (type = gda_value_type_list)
		end
	
	is_money: BOOLEAN is
			-- Is current value a MONEY?
      do
			Result := (type = gda_value_type_money)
		end
	
	is_numeric: BOOLEAN is
			-- Is current value a NUMERIC?
      do
			Result := (type = gda_value_type_numeric)
		end

	is_real_32: BOOLEAN is
			-- Is current value a single/float/REAL_32?
      do
			Result := (type = gda_value_type_single)
		end
	
	is_integer_16: BOOLEAN is
			-- Is current value a smallint/INTEGER_16?
      do
			Result := (type = gda_value_type_smallint)
		end
	
	is_natural_16: BOOLEAN is
			-- Is current value a smalluint/natural_16?
      do
			Result := (type = gda_value_type_smalluint)
		end
	
	is_string: BOOLEAN is
			-- Is current value a STRING?
      do
			Result := (type = gda_value_type_string)
		end
	
	is_time: BOOLEAN is
			-- Is current value a TIME?
      do
			Result := (type = gda_value_type_time)
		end
	
	is_timestamp: BOOLEAN is
			-- Is current value a TIMESTAMP?
      do
			Result := (type = gda_value_type_timestamp)
		end
	
	is_integer_8: BOOLEAN is
			-- Is current value a tinyint/INTEGER_8?
      do
			Result := (type = gda_value_type_tinyint)
		end
	
	is_natural_8: BOOLEAN is
			-- Is current value a tinyuint/natural_8?
      do
			Result := (type = gda_value_type_tinyuint)
		end
	
	is_type: BOOLEAN is
			-- Is current value a type?
      do
			Result := (type = gda_value_type_type)
		end
	
	is_natural: BOOLEAN is
			-- Is current value a uinteger/NATURAL?
      do
			Result := (type = gda_value_type_uinteger)
		end

	is_type_unknown: BOOLEAN is
		do
			Result := (type = gda_value_type_unknown)
		end
	
feature -- Copying
	copy (another: like Current) is
			-- Creates a new GdaValue from an existing one.
		do
			from_external_pointer(gda_value_copy(another.handle))
		end
		
feature -- 64 bit integer value
	integer_64: INTEGER_64 is
		require is_integer_64: is_integer_64
		do
			Result := gda_value_get_bigint (handle)
		end

	set_integer_64 (a_value: INTEGER_64) is
		require is_integer_64: is_integer_64
		do
			gda_value_set_bigint (handle, a_value)
		ensure value_set: a_value = integer_64
		end

feature -- 64 bit natural values
	natural_64: INTEGER_64 is
		obsolete "should be NATURAL_64"
		require is_natural_64: is_natural_64
		do
			Result := gda_value_get_biguint (handle)
		end

	set_natural_64 (a_value: INTEGER_64) is
			-- Set `a_value' as natural_64
		obsolete "should be NATURAL_64"
		require 
			is_natural_64: is_natural_64
			is_natural: a_value >= 0
		do
			gda_value_set_biguint (handle, a_value)
		ensure value_set: a_value = natural_64
		end

feature -- TODO: Binary values
--   gda_value_get_binary ()

--  const gpointer gda_value_get_binary         (GdaValue *value,
--                                               glong *size);

--    value :   a GdaValue whose value we want to get.
--    size :    holder for length of data.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_binary ()

--  void        gda_value_set_binary            (GdaValue *value,
--                                               gconstpointer val,
--                                               glong size);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.
--    size :  the size of the memory pool pointed to by val.

feature -- TODO: Blob value
--   gda_value_get_blob ()

--  const GdaBlob* gda_value_get_blob           (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_blob ()

--  void        gda_value_set_blob              (GdaValue *value,
--                                               const GdaBlob *val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

feature -- Boolean value
	boolean: BOOLEAN is
		require is_boolean: is_boolean
		do
			Result := gda_value_get_boolean(handle).to_boolean
		end

	set_boolean (a_boolean: BOOLEAN) is
		require is_boolean: is_boolean
		do
			-- Note: this "if" is required because BOOLEAN does not have
			-- a to_integer_8 feature, even if it would be a no-op at C level:
			-- BOOLEAN and INTEGER_8 are both gchars
			if a_boolean = True 
			 then gda_value_set_boolean (handle, 1)
			 else gda_value_set_boolean (handle, 0)
			end
		ensure value_set: a_boolean = boolean
		end

feature -- Date value
	date: GDA_DATE is
		require is_date: is_date
		local p: POINTER
		do
			p:=gda_value_get_date (handle)
			if wrappers.has(p) then
				Result::=wrappers.at(p).to_any
			else create Result.from_external_pointer(p)
			end

			-- check shared: Result.is_shared Note: because
			-- gda_value_get_date returns a "const GdaDate*", thus it
			-- should not be freed. end
		ensure not_void: Result /= Void
		end

	set_date (a_date: GDA_DATE) is
		require 
			is_date: is_date
			date_not_void: a_date /= Void
		do
			gda_value_set_date (handle, a_date.handle)
		end

feature -- Real value
	
	real: REAL is
		require is_real: is_real
		do
			Result := gda_value_get_double(handle)
		end

	set_real (a_real: REAL) is
		require is_real: is_real
		do
			gda_value_set_double(handle,a_real)
		ensure value_set: a_real = real
		end

feature -- Geometric point value
	geometric_point: GDA_GEOMETRIC_POINT is
		require is_geometric_point: is_geometric_point
		local p: POINTER
		do
			p:=gda_value_get_geometric_point(handle)
			if wrappers.has(p) then Result::=wrappers.at(p).to_any
			else create Result.from_external_pointer end
			check 
				shared_result: Result.is_shared 
				-- because gda_value_get_geomtric_point returns a "const
				-- GdaGeometricPoint*"
			end
		ensure not_void: Result /= Void 
		end
	
	set_geometric_point (a_point: GDA_GEOMETRIC_POINT) is
		require 
			is_geometric_point: is_geometric_point
			point_not_void: a_point /= Void
		do
			gda_value_set_geometric_point (handle, a_point.handle)
			-- TODO: ensure a_point.is_equal (Result)
		end

feature -- TODO gobject value

--   gda_value_get_gobject ()

--  const GObject* gda_value_get_gobject        (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_gobject ()

--  void        gda_value_set_gobject           (GdaValue *value,
--                                               const GObject *val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

feature -- Integer value
	integer: INTEGER is
		require is_integer: is_integer
		do
			Result:=gda_value_get_integer(handle)
		end 

	set_integer (an_integer: INTEGER) is
		require is_integer: is_integer
		do		
			gda_value_set_integer(handle,an_integer)
		end

feature -- List value
	list: G_LIST [GDA_VALUE] is
		local p: POINTER
		do
			p:=gda_value_get_list (handle)
			if wrappers.has(p) then Result::=wrappers.at(p).to_any
			else create Result.from_external_pointer(p) end
			check
				shared: Result.is_shared 
				-- because the returned pointer is const
			end
		ensure is_list: is_list
		end

	set_list (a_list: G_LIST [GDA_VALUE]) is
		require
			is_list: is_list
			list_not_void: a_list /= Void
		do
			gda_value_set_list(handle,a_list.handle)
		end

feature -- Null value
	set_null is
		-- Sets the type of value to "null"
		do
			gda_value_set_null(handle)
		ensure null: is_null_type
		end

feature -- Money value
	money: GDA_MONEY is
		local p: POINTER
		do
			p:=gda_value_get_money(handle)
			if wrappers.has(p) then Result::=wrappers.at(p).to_any
			else create Result.from_external_pointer(p) end
		ensure not_void: Result /= Void
		end

	set_money (a_money: GDA_MONEY) is
		require
			is_money: is_money
			not_void: a_money /= Void
		do
			gda_value_set_money(handle, a_money.handle)
		end

feature -- Numeric value

--   gda_value_get_numeric ()

--  const GdaNumeric* gda_value_get_numeric     (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_numeric ()

--  void        gda_value_set_numeric           (GdaValue *value,
--                                               const GdaNumeric *val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_get_single ()

--  gfloat      gda_value_get_single            (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_single ()

--  void        gda_value_set_single            (GdaValue *value,
--                                               gfloat val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_get_smallint ()

--  gshort      gda_value_get_smallint          (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_smallint ()

--  void        gda_value_set_smallint          (GdaValue *value,
--                                               gshort val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_get_smalluint ()

--  gushort     gda_value_get_smalluint         (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_smalluint ()

--  void        gda_value_set_smalluint         (GdaValue *value,
--                                               gushort val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_get_string ()

--  const gchar* gda_value_get_string           (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_string ()

--  void        gda_value_set_string            (GdaValue *value,
--                                               const gchar *val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_get_time ()

--  const GdaTime* gda_value_get_time           (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_time ()

--  void        gda_value_set_time              (GdaValue *value,
--                                               const GdaTime *val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_get_timestamp ()

--  const GdaTimestamp* gda_value_get_timestamp (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_timestamp ()

--  void        gda_value_set_timestamp         (GdaValue *value,
--                                               const GdaTimestamp *val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_get_tinyint ()

--  gchar       gda_value_get_tinyint           (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_tinyint ()

--  void        gda_value_set_tinyint           (GdaValue *value,
--                                               gchar val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_get_tinyuint ()

--  guchar      gda_value_get_tinyuint          (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_tinyuint ()

--  void        gda_value_set_tinyuint          (GdaValue *value,
--                                               guchar val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_get_uinteger ()

--  guint       gda_value_get_uinteger          (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_uinteger ()

--  void        gda_value_set_uinteger          (GdaValue *value,
--                                               guint val);

--    Stores val into value.

--    value : a GdaValue that will store val.
--    val :   value to be stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_get_vtype ()

--  GdaValueType gda_value_get_vtype            (GdaValue *value);

--    value :   a GdaValue whose value we want to get.
--    Returns : the value stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_vtype ()

--  void        gda_value_set_vtype             (GdaValue *value,
--                                               GdaValueType type);

--    Stores type into value.

--    value : a GdaValue that will store type.
--    type :  value to be stored in value.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_from_string ()

--  gboolean    gda_value_set_from_string       (GdaValue *value,
--                                               const gchar *as_string,
--                                               GdaValueType type);

--    Stores the value data from its string representation as type.

--    value :     a GdaValue that will store val.
--    as_string : the stringified representation of the value.
--    type :      the type of the value
--    Returns :   TRUE if the value has been properly converted to type from its string
--                representation. FALSE otherwise.

--    ----------------------------------------------------------------------------------------------

--   gda_value_set_from_value ()

--  gboolean    gda_value_set_from_value        (GdaValue *value,
--                                               const GdaValue *from);

--    Sets the value of a GdaValue from another GdaValue. This is different from
--    gda_value_copy, which creates a new GdaValue. gda_value_set_from_value, on the
--    other hand, copies the contents of copy into value, which must already be allocated.

--    value :   a GdaValue.
--    from :    the value to copy from.
--    Returns : TRUE if successful, FALSE otherwise.

--    ----------------------------------------------------------------------------------------------

--   gda_value_compare ()

--  gint        gda_value_compare               (GdaValue *value1,
--                                               GdaValue *value2);

--    Compares two values of the same type.

--    value1 :  a GdaValue to compare.
--    value2 :  the other GdaValue to be compared to value1.
--    Returns : if both values have the same type, returns 0 if both contain the same value, an
--              integer less than 0 if value1 is less than value2 or an integer greater than 0 if
--              value1 is greater than value2.

--    ----------------------------------------------------------------------------------------------

--   gda_value_stringify ()

--  gchar*      gda_value_stringify             (GdaValue *value);

--    Converts a GdaValue to its string representation as indicated by this table:

--    value :   a GdaValue.
--    Returns : a string formatted according to the printf() style indicated in the preceding table.
--              Free the value with a g_free() when you've finished using it.

--    ----------------------------------------------------------------------------------------------

--   gda_value_to_xml ()

--  xmlNodePtr  gda_value_to_xml                (GdaValue *value);

--    Serializes the given GdaValue to a XML node string.

--    value :   a GdaValue.
--    Returns : the XML node. Once not needed anymore, you should free it.
end -- GDA_VALUE
