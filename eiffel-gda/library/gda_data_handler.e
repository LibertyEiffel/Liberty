indexing
	description: "GdaDataHandler -- Interface which provides data handling capabilities"
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GDA team
					
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

			-- Description: Because data types vary a lot from a DBMS to
			-- another, the GdaDataHandler interface helps designing
			-- modules which can handle very specific pieces of data
			-- through plugins. Each object which imlements the
			-- GdaDataHandler interface is expected to handle a subset of
			-- the possible libgda defined data types.

			-- The GdaDataHandler object can convert a GValue to and from
			-- both SQL and 'STR'. The SQL representation of a value is
			-- the actual string which would be used in an SQL statement
			-- (for example a string's SQL representation is surrounded
			-- by quotes such as 'that\'s a string'). The 'STR'
			-- representation is a user friendly representation of a
			-- value (and the previous example would simply be: that's a
			-- string).

			-- Only one object which implements this interface is needed
			-- for any given data type, and it mainly contains some
			-- methods to manage values (as GValue structures). The
			-- GnomeDbDataEntry interface is complementary to this one
			-- since it it implemented by widgets where the user can
			-- enter or modify some data.

deferred class GDA_DATA_HANDLER

inherit WRAPPER

insert GDA_DATA_HANDLER_EXTERNALS

creation make, from_external_pointer

feature
	sql_from_value (a_value: G_VALUE): STRING is
			-- Creates a new string which is an SQL representation of
			-- `a_value'. If it is Void or is of type GDA_TYPE_NULL, the
			-- returned string is Void.
		local ptr: POINTER
		do
			if a_value = Void then ptr := gda_data_handler_get_sql_from_value(handle, default_pointer)
			else ptr := gda_data_handler_get_sql_from_value(handle, a_value.handle) 
			end
			if ptr.is_not_null then create Result.from_external(ptr) end
		end 

   string_from_value  (a_value: G_VALUE): STRING is
			-- a new, "user friendly" representation of `a_value', in the
			-- users's locale (specially for the dates). If the value is
			-- Void or is of type GDA_TYPE_NULL, the returned string is a
			-- copy of "" (empty string).
		local ptr: POINTER
		do
			if a_value /= Void then ptr:=a_value.handle end
			create Result.from_external(gda_data_handler_get_str_from_value(handle,ptr))
		end
			
	value_from_sql (some_sql: STRING; a_type: INTEGER): G_VALUE is
			-- a new G_VALUE which represents `some_sql'.  This is the
			-- opposite of the feature `sql_from_value'. `a_type' is used
			-- to determine the real data type requested for the Result.

			-- If `some_sql' is Void, then the returned G_VALUE is of
			-- type GDA_TYPE_NULL; if `some_sql' does not correspond to a
			-- valid SQL string for the requested type (i.e. there is an
			-- error), then Void is returned.
		local ssp, p: POINTER
		do
			if some_sql/=Void then ssp:=some_sql.to_external end
			p:=gda_data_handler_get_value_from_sql(handle, some_sql.to_external, a_type)
			if p.is_not_null then 
				-- No wrapper retrival, since a new object is always
				-- allocated.
				create Result.from_external_pointer(p)
			end
		end

	value_from_string (a_string: STRING; a_type: INTEGER): G_VALUE is
			-- Creates a new GValue which represents `a_string'. This is
			-- the opposite of the feature `string_from_value'. `a_type'
			-- is used to determine the real data type requested for the
			-- Result.
		
			-- If `a_string' is Void, then the returned GValue is of type
			-- GDA_TYPE_NULL; if `a_string' does not correspond to a
			-- valid STR string for the requested type (i.e. an error),
			-- then Void is returned.
		local sp, p: POINTER   
		do
			if a_string/=Void then sp:=a_string.to_external end
			p:=gda_data_handler_get_value_from_str(handle,sp,a_type)
			if p.is_not_null then 
				create Result.from_external(p)
			end
		end

	sane_init_value (a_type: INTEGER): G_VALUE is
			-- a new GValue which holds a sane initial value to be used
			-- if no value is specifically provided. For example for a
			-- simple string, this would return a new value containing
			-- the "" string. Void if no such value can be created.
		local p: POINTER
		do
			p:=gda_data_handler_get_sane_init_value(handle,a_type)
			if p.is_not_null then create Result.from_external_pointer(p) end
		end

	types_count: INTEGER is
			-- the number of GType types the GdaDataHandler can handle
			-- correctly
		obsolete "Should be NATURAL, since it is a guint"
		do
			Result:=gda_data_handler_get_nb_gda_types(handle)
		end


	accepts_type (a_type: INTEGER): BOOLEAN is
			-- Is the GdaDataHandler able to handle `a_type'?
		do
			Result:=(gda_data_handler_accepts_gda_type(handle, a_type)).to_boolean
		end

	type_at_index (an_index: INTEGER) is
			-- the GType handled by the GdaDataHandler, at `an_index'
		obsolete "an_index shall be NATURAL, since it is a guint"
		require positive_index: an_index >= 0
		do
			Result:=gda_data_handler_get_gda_type_index(handke, an_index)
		end

	description: STRING is
			-- a short description of the GdaDataHandler
		do
			create {CONST_STRING} Result.from_external(gda_data_handler_get_descr(handle))
		ensure not_void: Result /= Void
		end
end -- GDA_DATA_HANDLER
