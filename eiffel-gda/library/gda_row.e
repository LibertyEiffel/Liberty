indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
				   Copyright (C) 1998 - 2006 The GNOME Foundation.
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GDA_ROW

inherit G_OBJECT redefine copy end

insert SHARED_G_ERROR

creation make, from_list, from_external_pointer

feature {} -- Creation
	make (a_model: GDA_DATA_MODEL; a_count: INTEGER) is
			-- Creates a GDA_ROW thast can hold `a_count'
			-- values. 
		do
			-- `a_model' should be the GDA_DATA_MODEL this row belongs
			-- to, or Void if the row is outside any data model.
			-- "from_external_pointer(gda_row_new(null_or(a_model),
			-- a_count))". Since the caller of this function is the only
			-- owner of a reference to the newly created GdaRow object,
			-- even if a_model.handle is not NULL (it is recommended to
			-- pass NULL as the @model argument * if this function is not
			-- called from within a #GdaDataModel implementation).

			-- Since we are not implementing any new GDA_DATA_MODEL we 
			-- do not offer access to the model argument.
			from_external_pointer(gda_row_new(default_pointer,a_count))
		end

feature 
	copy (another: like Current) is
			-- Copy constructor.
		do
			from_external_pointer(gda_row_copy(another.handle))
		end


	from_list (some_values: G_LIST[G_VALUE]) is
			-- Creates a GdaRow from some_values.  
		do 
			-- See the gda_row_new() function's documentation for more
			-- information about the @model attribute, the GdaDataModel
			-- this row belongs to, or %NULL if the row is outside any
			-- data model.

			-- The GValue's are value-copied and the user are still
			-- responsible for freeing them. This has no consequences to 
			-- Eiffel code.
			from_external_pointer(gda_row_new_from_list 
										 (default_pointer, some_values.handle))
		end

	model: GDA_DATA_MODEL is
		-- the GdaDataModel Current GDA_ROW belongs to.
		local factory: G_OBJECT_EXPANDED_FACTORY[GDA_DATA_MODEL]
		do
			Result:=factory.wrapper_or_void(gda_row_get_model(handle))
		end

	number: INTEGER is
			-- the number of the given row, that is, its position in its
			-- containing data model; -1 if there was an error.
		do
			Result:=gda_row_get_number(handle)
		end

	set_number (a_number: INTEGER) is
			-- Sets the row number for the given row.
		do
			gda_row_set_number(handle,a_number)
		ensure set: number = a_number
		end

	id: CONST_STRING is
			-- The unique identifier for this row. This identifier is
			-- assigned by the different providers, to uniquely identify
			-- rows returned to clients. If there is no ID, this means
			-- that the row has not been created by a provider, or that
			-- it the provider cannot identify it (ie, modifications to
			-- it won't take place into the database).
		do
			create Result.from_external(gda_row_get_id(handle))
		ensure not_void: Result/=Void
		end
	
	is_valid_index (a_num: INTEGER): BOOLEAN is
			-- Is `a_num' a valid index for `value', `set_value', 
			-- `is_default' and `set_default' features?
		do
			Result:=((0<=a_num) and (a_num<length))
		end

	value (a_num: INTEGER): G_VALUE is
			-- the G_VALUE in the position `a_num' of Current row.
		require is_valid_index (a_num)
		do
			create Result.from_external_pointer
			(gda_row_get_value(handle, a_num))
			-- The obtained pointer points to the internal array of
			-- values. Don't try to free or modify it!
			Result.petrify
		ensure not_void: Result/=Void 
		end

	set_value (a_num: INTEGER; a_value: G_VALUE) is
			-- Sets the value stored at position `a_num' to be a copy of
			-- `a_value' which can be Void. `is_successful' is updated;
			-- it will be True if no error occurred.
		require is_valid_index (a_num)
		do
			is_successful:=(gda_row_set_value
								 (handle,a_num, null_or(a_value)).to_boolean)
		end

	length: INTEGER is
			-- the number of columns in Current row.
		do
			Result:=gda_row_get_length(handle)
		end
	
	set_default (a_num: INTEGER; a_setting: BOOLEAN) is 
			-- Instructs the Current row that the value at column `a_num'
			-- must be considered as a default value.
		require is_valid_index (a_num)
		do
			gda_row_set_is_default(handle,a_num,a_setting.to_integer)
		end

	is_default_value (a_num: INTEGER): BOOLEAN is
			-- Shall the value at column `a_num' be considered as a
			-- default value?
		require is_valid_index (a_num)
		do
			Result:=gda_row_get_is_default(handle,a_num).to_boolean
		end

feature dummy_gobject: POINTER is do unimplemented end

feature {} -- Unwrapped code
	-- type: like g_type is -- The GType of GDA_ROW do
	-- Result:=gda_row_get_type end

	-- Note: gda_row_set_model is not wrapped, since this function is
	-- reserved to GdaDataModel implementations and should therefore
	-- not be called by the user.

	-- gda_row_set_id Assigns a new identifier to the given row. This
	-- function is usually called by providers.

feature {} -- External calls
	gda_row_get_type: like g_type is
			-- GType gda_row_get_type (void);
		external "C use <libgda/libgda.h>"
		end

	gda_row_new (a_model: POINTER; a_count: INTEGER): POINTER is
			-- GdaRow *gda_row_new (GdaDataModel *model, gint count);
		external "C use <libgda/libgda.h>"
		end

	gda_row_new_from_list (a_model, some_values: POINTER): POINTER is
			-- GdaRow *gda_row_new_from_list (GdaDataModel *model, const GList *values);
		external "C use <libgda/libgda.h>"
		end

	gda_row_copy (a_row: POINTER): POINTER is
			-- GdaRow *gda_row_copy (GdaRow *row);
		external "C use <libgda/libgda.h>"
		end

	gda_row_set_model (a_row, a_model: POINTER) is
			-- void gda_row_set_model (GdaRow *row, GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end


	gda_row_get_model (a_row: POINTER): POINTER is
			-- GdaDataModel *gda_row_get_model (GdaRow *row);
		external "C use <libgda/libgda.h>"
		end

	gda_row_get_length (a_row: POINTER): INTEGER is
			-- gint gda_row_get_length (GdaRow *row);
		external "C use <libgda/libgda.h>"
		end

	gda_row_get_number (a_row: POINTER): INTEGER is
			-- gint gda_row_get_number (GdaRow *row);
		external "C use <libgda/libgda.h>"
		end

	gda_row_set_number (a_row: POINTER; a_number: INTEGER) is
			-- void gda_row_set_number (GdaRow *row, gint number);
		external "C use <libgda/libgda.h>"
		end

	gda_row_get_id (a_row: POINTER): POINTER is
			-- const gchar *gda_row_get_id (GdaRow *row);
		external "C use <libgda/libgda.h>"
		end

	gda_row_set_id (a_row, an_id: POINTER) is
			-- void gda_row_set_id (GdaRow *row, const gchar *id);
		external "C use <libgda/libgda.h>"
		end

	gda_row_get_value (a_row: POINTER; a_num: INTEGER): POINTER is
			-- GValue *gda_row_get_value (GdaRow *row, gint num);
		external "C use <libgda/libgda.h>"
		end

	gda_row_set_value (a_row: POINTER; a_num: INTEGER; a_value: POINTER): INTEGER is
			-- gboolean gda_row_set_value (GdaRow *row, gint num, const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_row_set_is_default (a_row: POINTER; a_num, is_default_bool: INTEGER) is
			-- void gda_row_set_is_default (GdaRow *row, gint num, gboolean is_default);
		external "C use <libgda/libgda.h>"
		end

	gda_row_get_is_default (a_row: POINTER; a_num: INTEGER): INTEGER is
			-- gboolean gda_row_get_is_default (GdaRow *row, gint num);
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaRow)"
		end

end -- class GDA_ROW
