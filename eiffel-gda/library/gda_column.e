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
	
creation dummy, make, from_external_pointer
	
feature {} -- Creation
	make is
			-- a newly allocated GdaColumn object.
		do
			from_external_pointer(gda_column_new)
		end

feature {ANY} -- Copying
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
			create {CONST_STRING} Result.from_external(gda_column_get_name(handle))
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
			Result:=gda_column_get_g_type(handle)
		end

	set_type (a_type: INTEGER) is
			-- Sets the type of column to `a_type'.
		do
			gda_column_set_g_type (handle, a_type)
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
	
feature {} -- TODO: Properties
--    "id"                   gchararray            : Read / Write

feature {} -- TODO: Signals


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

feature {} -- 3.0

	--
	--  gda_column_get_title ()
	--
	-- const gchar*        gda_column_get_title                (GdaColumn *column);
	--
	--   column :  a GdaColumn.
	--   Returns : the column's title
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_title ()
	--
	-- void                gda_column_set_title                (GdaColumn *column,
	--                                                          const gchar *title);
	--
	--   Sets the column's title
	--
	--   column : a GdaColumn.
	--   title :  title name.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_table ()
	--
	-- const gchar*        gda_column_get_table                (GdaColumn *column);
	--
	--   column :  a GdaColumn.
	--   Returns : the name of the table to which this column belongs.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_table ()
	--
	-- void                gda_column_set_table                (GdaColumn *column,
	--                                                          const gchar *table);
	--
	--   Sets the name of the table to which the given column belongs.
	--
	--   column : a GdaColumn.
	--   table :  table name.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_caption ()
	--
	-- const gchar*        gda_column_get_caption              (GdaColumn *column);
	--
	--   column :  a GdaColumn.
	--   Returns : column's caption.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_caption ()
	--
	-- void                gda_column_set_caption              (GdaColumn *column,
	--                                                          const gchar *caption);
	--
	--   Sets column's caption.
	--
	--   column :  a GdaColumn.
	--   caption : caption.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_scale ()
	--
	-- glong               gda_column_get_scale                (GdaColumn *column);
	--
	--   column :  a GdaColumn.
	--   Returns : the number of decimals of column.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_scale ()
	--
	-- void                gda_column_set_scale                (GdaColumn *column,
	--                                                          glong scale);
	--
	--   Sets the scale of column to scale.
	--
	--   column : a GdaColumn.
	--   scale :  number of decimals.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_dbms_type ()
	--
	-- const gchar*        gda_column_get_dbms_type            (GdaColumn *column);
	--
	--   column :  a GdaColumn.
	--   Returns : the dbms_type of column.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_dbms_type ()
	--
	-- void                gda_column_set_dbms_type            (GdaColumn *column,
	--                                                          const gchar *dbms_type);
	--
	--   column :
	--   dbms_type :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_g_type ()
	--
	-- GType               gda_column_get_g_type               (GdaColumn *column);
	--
	--   column :  a GdaColumn.
	--   Returns : the type of column.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_g_type ()
	--
	-- void                gda_column_set_g_type               (GdaColumn *column,
	--                                                          GType type);
	--
	--   Sets the type of column to type.
	--
	--   column : a GdaColumn.
	--   type :   the new type of column.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_allow_null ()
	--
	-- gboolean            gda_column_get_allow_null           (GdaColumn *column);
	--
	--   Gets the 'allow null' flag of the given column.
	--
	--   column :  a GdaColumn.
	--   Returns : whether the given column allows null values or not (TRUE or
	--             FALSE).
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_allow_null ()
	--
	-- void                gda_column_set_allow_null           (GdaColumn *column,
	--                                                          gboolean allow);
	--
	--   Sets the 'allow null' flag of the given column.
	--
	--   column : a GdaColumn.
	--   allow :  whether the given column should allows null values or not.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_primary_key ()
	--
	-- gboolean            gda_column_get_primary_key          (GdaColumn *column);
	--
	--   column :  a GdaColumn.
	--   Returns : whether if the given column is a primary key (TRUE or FALSE).
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_primary_key ()
	--
	-- void                gda_column_set_primary_key          (GdaColumn *column,
	--                                                          gboolean pk);
	--
	--   Sets the 'primary key' flag of the given column.
	--
	--   column : a GdaColumn.
	--   pk :     whether if the given column should be a primary key.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_unique_key ()
	--
	-- gboolean            gda_column_get_unique_key           (GdaColumn *column);
	--
	--   column :  a GdaColumn.
	--   Returns : whether if the given column is an unique key (TRUE or FALSE).
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_unique_key ()
	--
	-- void                gda_column_set_unique_key           (GdaColumn *column,
	--                                                          gboolean uk);
	--
	--   Sets the 'unique key' flag of the given column.
	--
	--   column : a GdaColumn.
	--   uk :     whether if the given column should be an unique key.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_references ()
	--
	-- const gchar*        gda_column_get_references           (GdaColumn *column);
	--
	--   Reference is returned in tablename.fieldname format. Do not free this
	--   variable, it is used internally within GdaColumn.
	--
	--   column :  a GdaColumn.
	--   Returns : column's references.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_references ()
	--
	-- void                gda_column_set_references           (GdaColumn *column,
	--                                                          const gchar *ref);
	--
	--   Sets column's references.
	--
	--   column : a GdaColumn.
	--   ref :    references.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_auto_increment ()
	--
	-- gboolean            gda_column_get_auto_increment       (GdaColumn *column);
	--
	--   column :  a GdaColumn.
	--   Returns : whether the given column is an auto incremented one (TRUE or
	--             FALSE).
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_auto_increment ()
	--
	-- void                gda_column_set_auto_increment       (GdaColumn *column,
	--                                                          gboolean is_auto);
	--
	--   Sets the auto increment flag for the given column.
	--
	--   column :  a GdaColumn.
	--   is_auto : auto increment status.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_position ()
	--
	-- gint                gda_column_get_position             (GdaColumn *column);
	--
	--   column :  a GdaColumn.
	--   Returns : the position of the column refer to in the containing data
	--             model.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_position ()
	--
	-- void                gda_column_set_position             (GdaColumn *column,
	--                                                          gint position);
	--
	--   Sets the position of the column refer to in the containing data model.
	--
	--   column :   a GdaColumn.
	--   position : the wanted position of the column in the containing data model.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_get_default_value ()
	--
	-- const GValue*       gda_column_get_default_value        (GdaColumn *column);
	--
	--   column :  a GdaColumn.
	--   Returns : column's default value, as a GValue object.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_column_set_default_value ()
	--
	-- void                gda_column_set_default_value        (GdaColumn *column,
	--                                                          const GValue *default_value);
	--
	--   Sets column's default GValue.
	--
	--   column :        a GdaColumn.
	--   default_value : default GValue for the column
	--
	--Property Details
	--
	--  The "id" property
	--
	--   "id"                       gchararray            : Read / Write
	--
	--   Default value: NULL
	--
	--Signal Details
	--
	--  The "g-type-changed" signal
	--
	-- void                user_function                      (GdaColumn *gdacolumn,
	--                                                         gint       arg1,
	--                                                         gint       arg2,
	--                                                         gpointer   user_data)      : Run Last
	--
	--   gdacolumn : the object which received the signal.
	--   arg1 :
	--   arg2 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "name-changed" signal
	--
	-- void                user_function                      (GdaColumn *gdacolumn,
	--                                                         gchar     *arg1,
	--                                                         gpointer   user_data)      : Run Last
	--
	--   gdacolumn : the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.

feature dummy_gobject: POINTER is do unimplemented end

end -- class GDA_COLUMN
