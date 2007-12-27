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

deferred class GDA_DATA_HANDLER
	-- GdaDataHandler, an interface providing data handling
	-- capabilities.
	
	-- Because data types vary a lot from a DBMS to another, the
	-- GdaDataHandler interface helps designing modules which can
	-- handle very specific pieces of data through plugins. Each object
	-- which imlements the GdaDataHandler interface is expected to
	-- handle a subset of the possible libgda defined data types.

	-- The GdaDataHandler object can convert a GValue to and from both
	-- SQL and 'STR'. The SQL representation of a value is the actual
	-- string which would be used in an SQL statement (for example a
	-- string's SQL representation is surrounded by quotes such as
	-- 'that\'s a string'). The 'STR' representation is a user friendly
	-- representation of a value (and the previous example would simply
	-- be: that's a string).
	
	-- Only one object which implements this interface is needed for
	-- any given data type, and it mainly contains some methods to
	-- manage values (as GValue structures). The GnomeDbDataEntry
	-- interface is complementary to this one since it it implemented
	-- by widgets where the user can enter or modify some data.

inherit
	G_OBJECT

	--Known Implementations: GdaDataHandler is implemented by
	--GdaHandlerBoolean, GdaHandlerType, GdaHandlerBin,
	--GdaHandlerNumerical, GdaHandlerTime and GdaHandlerString.

insert GLIB_BASIC_TYPES

feature

	sql_from_value (a_value: G_VALUE): STRING is 
			-- A new string which is an SQL representation of the given
			-- value. If `a_value' is Void or is of type GDA_TYPE_NULL,
			-- the returned string is Void.
		local p: POINTER
		do
			p:=gda_data_handler_get_sql_from_value(handle, null_or(a_value))
			if p.is_not_null then create Result.from_external(p) end
		end

	string_from (a_value: G_VALUE): STRING is
			-- A new string which is a "user friendly" representation of
			-- the given value (in the users's locale, specially for the
			-- dates). If the `a_value' is Void or is of type
			-- GDA_TYPE_NULL, the returned string is empty.
		do
			create Result.from_external(gda_data_handler_get_str_from_value
												 (handle, null_or(a_value)))
		end
	
	value_from_sql (some_sql: STRING; a_type: like g_type): G_VALUE is
			-- A new G_VALUE which represents the SQL value given as
			-- argument.  This is the opposite of the function
			-- `sql_from_value'. `a_type' is used to determine the real
			-- data type requested for the returned value.
		
			-- If `some_sql' is Void, then Result is of type
			-- GDA_TYPE_NULL; if `some_sql' does not correspond to a
			-- valid SQL string for the requested type, then Void is
			-- returned.
		local res: POINTER
		do
			res:=gda_data_handler_get_value_from_sql(handle, null_or_string(some_sql), a_type)
			if res.is_not_null then create Result.from_external_pointer(res) end
		end


	value_from_string (a_string: STRING; a_type: like g_type): G_VALUE is
			-- Creates a new GValue which represents the STR value given
			-- as argument.  This is the opposite of the function
			-- `string_from_value'. `a_type' is used to determine the
			-- real data type requested for the returned value.
		
			-- If `a_string' is Void, then Result is of type
			-- GDA_TYPE_NULL; if `a_string' does not correspond to a
			-- valid string for the requested type, then Void is
			-- returned.
		local p: POINTER
		do
			p:=gda_data_handler_get_value_from_str(handle,null_or_string(a_string),a_type)
			if p.is_not_null then create Result.from_external_pointer(p) end
		end

	sane_init_value (a_type: like g_type): G_VALUE is
			-- A new G_VALUE which holds a sane initial value to be used
			-- if no value is specifically provided. For example for a
			-- simple string, this would return a new value containing
			-- the "" string. Void if no such value can be created.
		local p: POINTER
		do
			p:=gda_data_handler_get_sane_init_value(handle,a_type)
			if p.is_not_null then create Result.from_external_pointer(p) end
		end

	handled_g_types_count: like guint is
			-- The number of GType types the GdaDataHandler can handle
			-- correctly.
		do
			Result:=gda_data_handler_get_nb_g_types(handle)
		end

	accepts_g_type (a_type: like g_type): BOOLEAN is
			-- Is Current GDA_DATA_HANDLER able to handle a_type?
		do
			Result:=(gda_data_handler_accepts_g_type(handle,a_type).to_boolean)
		end

	type_item (an_index: like guint): like g_type is
			-- The type handled by the GdaDataHandler, at `an_index' (starting at zero).
		do
			Result:=gda_data_handler_get_g_type_index(handle, an_index)
		end

	handler_description: CONST_STRING is
			-- A short description of the GdaDataHandler
		do
			create Result.from_external(gda_data_handler_get_descr(handle))
		end
	
feature {} -- External calls
	--                     GdaDataHandler;
	
	gda_data_handler_get_sql_from_value (a_data_handler, a_value: POINTER): POINTER is
			-- gchar* gda_data_handler_get_sql_from_value (GdaDataHandler *dh, const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_data_handler_get_str_from_value (a_data_handler, a_value: POINTER): POINTER is
			-- gchar* gda_data_handler_get_str_from_value (GdaDataHandler *dh, const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_data_handler_get_value_from_sql (a_data_handle, some_sql: POINTER; a_type: like g_type): POINTER is
			-- GValue* gda_data_handler_get_value_from_sql (GdaDataHandler *dh, const gchar *sql, GType type);
		external "C use <libgda/libgda.h>"
		end

	gda_data_handler_get_value_from_str (a_data_handler, a_string: POINTER; a_type: like g_type): POINTER is
			-- GValue* gda_data_handler_get_value_from_str (GdaDataHandler *dh, const gchar *str, GType type);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_handler_get_sane_init_value (a_data_handler: POINTER; a_type: like g_type): POINTER is
			-- GValue* gda_data_handler_get_sane_init_value (GdaDataHandler *dh, GType type);
		external "C use <libgda/libgda.h>"
		end

	gda_data_handler_get_nb_g_types (a_data_handler: POINTER): like guint is
			-- guint gda_data_handler_get_nb_g_types (GdaDataHandler *dh);
		external "C use <libgda/libgda.h>"
		end

	gda_data_handler_accepts_g_type (a_data_handler: POINTER; a_type: like g_type): INTEGER is
			-- gboolean gda_data_handler_accepts_g_type (GdaDataHandler *dh, GType type);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_handler_get_g_type_index (a_data_handler: POINTER; an_index: like guint): like g_type is
			-- GType gda_data_handler_get_g_type_index (GdaDataHandler *dh, guint index);
		external "C use <libgda/libgda.h>"
		end

	gda_data_handler_get_descr (a_data_handler: POINTER): POINTER is
			-- const gchar* gda_data_handler_get_descr (GdaDataHandler *dh);
		external "C use <libgda/libgda.h>"
		end

end -- class GDA_DATA_HANDLER
