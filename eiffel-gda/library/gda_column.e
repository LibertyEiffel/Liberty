indexing
	description: "GdaDataModel column, Management of GdaDataModel column attributes."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

class GDA_COLUMN

inherit
	G_OBJECT 
		redefine 
			copy,
			type 
		end
insert
	GDA_COLUMN_EXTERNALS
	
creation make, from_external_pointer
	
feature {} -- Creation
	make is
			-- a newly allocated GdaColumn object.
		do
			from_external_pointer(gda_column_new)
		end

	copy (another: GDA_COLUMN) is
			-- Creates a new GdaColumn object from `another' existing one.
		do
			from_external_pointer (gda_column_copy(another.handle))
		end

feature 
	defined_size: INTEGER is
			-- the defined size of column.
		do
			Result:=gda_column_get_defined_size (handle)
		end

	set_defined_size (a_size: INTEGER) is
			-- Sets the defined size of a GdaColumn.
		do
			gda_column_set_defined_size (handle, a_size)
		end

	name: STRING is
			-- the name of column.
		do
			create {CONST_STRING} Result.from_external
			(gda_column_get_name(handle))
		ensure not_void: Result /= Void
		end
	
	set_name (a_name: STRING) is
			-- Sets the name of column to `a_name'.
		require
			name_not_void: a_name /= Void
		do
			gda_column_set_name (handle, a_name.to_external)
		end

	title: STRING is
			-- the column's title
		do
			create {CONST_STRING} Result.from_external
			(gda_column_get_title (handle))
		ensure not_void: Result /= Void
		end

	set_title (a_title: STRING) is
			-- Sets the column's title
		require
			title_not_void: a_title /= Void
		do
			gda_column_set_title (handle, a_title.to_external)
		end

	table: STRING is
		-- the name of the table to which this column belongs.
		do
			create {CONST_STRING} Result.from_external
			(gda_column_get_table(handle))
		ensure not_void: Result /= Void
		end

	set_table (a_table: STRING) is
		   -- Sets the name of the table to which the given column belongs.
		require
			table_not_void: a_table /= Void
		do
			gda_column_set_table (handle, a_table.to_external)
		end 

	caption: STRING is
			-- the column's caption.
		do
			create {CONST_STRING} Result.from_external
			(gda_column_get_caption(handle))
		ensure not_void: Result /= Void
		end

	set_caption (a_caption: STRING) is
			-- Sets column's caption.
		require
			caption_not_void: a_caption /= Void
		do
			gda_column_set_caption (handle, a_caption.to_external)
		end

	scale: INTEGER is
			-- the number of decimals of column.
		do
			Result := gda_column_get_scale (handle)
		end

	set_scale (a_scale: INTEGER) is
			-- Sets the scale of column to scale.
		do
			gda_column_set_scale (handle, a_scale)
		end

	dbms_type: STRING is
			-- the dbms_type of column.
		do
			create {CONST_STRING} Result.from_external
			(gda_column_get_dbms_type(handle))
		ensure not_void: Result /= Void
		end			

	-- gda_column_set_dbms_type ()
	-- void gda_column_set_dbms_type (GdaColumn *column, const gchar *dbms_type);

	type: INTEGER is
			-- the type of column.
		do
			Result:=gda_column_get_gda_type(handle)
		end

	set_type (a_type: INTEGER) is
			-- Sets the type of column to `a_type'.
		do
			gda_column_set_gda_type (handle, a_type)
		end

	does_allow_null: BOOLEAN is
			-- Does the column allows null values?
		do
			Result:=(gda_column_get_allow_null(handle).to_boolean)
		end
			
	allow_null is
			-- Makes the column to allow null values.
		do
			gda_column_set_allow_null (handle, 1)
		end

	forbid_null is
			-- Makes the column to allow null values.
		do
			gda_column_set_allow_null (handle, 0)
		end

	is_primary_key: BOOLEAN is
		-- Is Current column is a primary key?
		do
			Result:=(gda_column_get_primary_key(handle).to_boolean)
		end

	set_primary_key is
			-- Sets the 'primary key' flag of the given column.
		do
			gda_column_set_primary_key (handle, 1)
		end

	unset_primary_key is
			-- Sets the 'primary key' flag of the given column.
		do
			gda_column_set_primary_key (handle, 0)
		end

	is_unique_key: BOOLEAN is
			-- whether if the given column is an unique key (TRUE or FALSE).
		do
			Result:=(gda_column_get_unique_key(handle).to_boolean)
		end
	
	set_unique_key is
			-- Sets the unique key' flag of the given column.
		do
			gda_column_set_unique_key (handle,1)
		end

	unset_unique_key is
			-- Unsets the unique key' flag of the given column.
		do
			gda_column_set_unique_key (handle,0)
		end

	references: STRING is
			-- Reference in tablename.fieldname format.
		do
			create {CONST_STRING} Result.from_external
			(gda_column_get_references(handle))
			-- Do not free this variable, it is used internally within GdaColumn.
		ensure not_void: Result /= Void
		end			

	set_references (a_reference: STRING) is
			-- Sets column's references.
		require
			reference_not_void: a_reference /= Void
		do
			gda_column_set_references (handle, a_reference.to_external)
		end

	has_auto_increment: BOOLEAN is
			-- Is the column an auto incremented one?
		do
			Result:=(gda_column_get_auto_increment(handle).to_boolean)
		end

	set_auto_increment is
			-- Sets the auto increment flag for the given column.
		do
			gda_column_set_auto_increment (handle, 1)
		end

	unset_auto_increment is
			-- Sets the auto increment flag for the given column.
		do
			gda_column_set_auto_increment (handle, 0)
		end


	position: INTEGER is
			-- the position of the column refer to in the containing data model.
		do
			Result:=gda_column_get_position (handle)
		end

	set_position (a_position: INTEGER) is
			-- Sets the position of the column refer to in the containing data
			-- model.
		do
			gda_column_set_position (handle, a_position)
		end

	default_value: G_VALUE is
			-- column's default value.
		do
			create Result.from_external_pointer(gda_column_get_default_value(handle))
			Result.set_shared
		ensure not_void: Result /= Void
		end

	set_default_value (a_default: G_VALUE) is
			-- Sets column's default GValue.
		require
			default_not_void: a_default /= Void
		do
			gda_column_set_default_value(handle, a_default.handle)
		end
	
feature -- TODO: Properties
--    "id"                   gchararray            : Read / Write

feature -- TODO: Signals


--  "gda-type-changed"
--              void        user_function      (GdaColumn *gdacolumn,
--                                              gint       arg1,
--                                              gint       arg2,
--                                              gpointer   user_data)      : Run last
--  "name-changed"
--              void        user_function      (GdaColumn *gdacolumn,
--                                              gchar     *arg1,
--                                              gpointer   user_data)      : Run last

-- Property Details

--   The "id" property

--    "id"                   gchararray            : Read / Write

--    Default value: NULL

-- Signal Details

--   The "gda-type-changed" signal

--  void        user_function                  (GdaColumn *gdacolumn,
--                                              gint       arg1,
--                                              gint       arg2,
--                                              gpointer   user_data)      : Run last

--    @: @: @:

--    gdacolumn : the object which received the signal.
--    arg1 :
--    arg2 :
--    user_data : user data set when the signal handler was connected.

--    --------------------------------------------------------------------------

--   The "name-changed" signal

--  void        user_function                  (GdaColumn *gdacolumn,
--                                              gchar     *arg1,
--                                              gpointer   user_data)      : Run last

--    gdacolumn : the object which received the signal.
--    arg1 :
--    user_data : user data set when the signal handler was connected.

end -- class GDA_COLUMN
