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

class GDA_DATA_MODEL_HASH
	-- GdaDataModelHash, an implementation of GdaDataModel based on a
	-- hash table.

	-- Unlike GdaDataModelArray, this data model implementation stores
	-- the GdaRow in a hash table. So it only retrieves from the
	-- database backend exactly the requested rows (while in
	-- GdaDataModelArray you have to retrieve all the rows until the
	-- one requested).
	
inherit
	GDA_DATA_MODEL_ROW
		redefine 
			columns_count
		end

creation make, from_external_pointer

feature {} -- Creation
	make (a_columns_n: INTEGER) is
			-- Creates a new GdaDataModel with `a_columns_n'
		do
			from_external_pointer(gda_data_model_hash_new(a_columns_n))
		end

feature
	insert (a_row: GDA_ROW; a_row_number: INTEGER) is
			--   Inserts `a_row' in the model at `a_row_number'.
		do
			gda_data_model_hash_insert_row(handle, a_row_number, a_row.handle)
			-- Note: The C documentation says that the model is
			-- responsible of freeing the inserted row. AFAIK it should
			-- be a problem in Eiffel, since a GDA_ROW is already a
			-- shared-by-definition G_OBJECT.
		end

	set_n_columns (a_number: INTEGER) is
			-- Sets the number of columns for rows inserted in this
			-- model. Is also clears model's contents (invoking `clear').
		require not_negative: a_number>=0
		do
			gda_data_model_hash_set_n_columns(handle,a_number)
		end

	clear is
			--   Frees all the rows inserted in model.
		do
			gda_data_model_hash_clear(handle)
		end

	columns_count: INTEGER is
			--   The number of columns in the model.
		do
			Result:=integer_property_from_pspec(n_cols_pspec)
		end

feature {} -- 
	n_cols_property_name: STRING is "n-columns" 
	
	n_cols_pspec: G_PARAM_SPEC is
			--  "n-columns" guint : Read / Write
		require has_property (n_cols_property_name)
		once
			create Result.from_external_pointer(g_object_class_find_property(g_object_get_class(handle),n_cols_property_name.to_external))
		end			

feature
	dummy_gobject: POINTER is do unimplemented end

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataModelHash)"
		end

feature {} -- External calls
	gda_data_model_hash_new (a_cols: INTEGER): POINTER is
			-- GdaDataModel* gda_data_model_hash_new (gint cols)
		external "C <libgda/libgda.h>"
		end

	gda_data_model_hash_insert_row (a_model: POINTER; a_rownum: INTEGER; a_row: POINTER) is
			-- void gda_data_model_hash_insert_row (GdaDataModelHash *model, gint rownum, GdaRow *row)
		external "C <libgda/libgda.h>"
		end

	gda_data_model_hash_set_n_columns (a_model: POINTER; a_cols: INTEGER) is
			-- void gda_data_model_hash_set_n_columns (GdaDataModelHash *model, gint cols)
		external "C <libgda/libgda.h>"
		end

	gda_data_model_hash_clear (a_model: POINTER) is
			-- void gda_data_model_hash_clear (GdaDataModelHash *model)
		external "C <libgda/libgda.h>"
		end

	--
end -- class GDA_DATA_MODEL_HASH
