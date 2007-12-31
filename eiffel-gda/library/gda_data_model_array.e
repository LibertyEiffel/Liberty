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

class GDA_DATA_MODEL_ARRAY
	-- GdaDataModelArray, an implementation of GdaDataModel based on an array
	
inherit 
	GDA_DATA_MODEL
	GDA_DATA_MODEL_ROW

creation from_external_pointer

feature {} -- Creation

	make (a_column_n: INTEGER) is
			-- Creates a new GdaDataModel object without initializing the
			-- column types. Using (TODO) `with_types' is usually better.
		
			-- `a_column_n' is the number of columns for rows in this
			-- data model.
		do
			from_external_pointer(gda_data_model_array_new(a_column_n))
		end

	--  gda_data_model_array_new_with_g_types ()
	--
	-- GdaDataModel*       gda_data_model_array_new_with_g_types
	--                                                         (gint cols,
	--                                                          ...);
	--
	--   Creates a new GdaDataModel object with the column types as specified.
	--
	--   cols :    number of columns for rows in this data model.
	--   ... :     types of the columns of the model to create as GType
	--   Returns : a pointer to the newly created GdaDataModel.

feature	
	-- TODO: GdaDataModel*       gda_data_model_array_copy_model     (GdaDataModel *src,
	--                                                          GError **error);
	--
	--
	--   src :     a GdaDataModel to copy data from
	--   error :   a place to store errors, or NULL
	--   Returns : a new data model, or NULL if an error occurred
	
	set_n_columns (a_columns_n: INTEGER) is
			-- Sets the number of columns for rows inserted in this
			-- model. `a_columns_n' must be greated than or equal to 0.
		
			-- It also clears model's contents.
		require positive: a_columns_n>=0
		do
			gda_data_model_array_set_n_columns(handle, a_columns_n)
		end

	clear is
			-- Frees all the rows in model.
		do
			gda_data_model_array_clear(handle)
		end

feature  -- TODO: The "n-columns" property
	--
	--   "n-columns"                guint                 : Read / Write
	--
	--   The number of columns in the model.
	--
	--   Default value: 0

feature 
	dummy_gobject: POINTER is do unimplemented end

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataModelArray)"
		end

feature {} -- v3 API

	gda_data_model_array_new (a_cols: INTEGER): POINTER is
			-- GdaDataModel* gda_data_model_array_new (gint cols)
		external "C <libgda/libgda.h>"
		end

	-- GdaDataModel* gda_data_model_array_new_with_g_types (gint cols, ...)
	
	gda_data_model_array_copy_model (a_src, an_error_ref: POINTER): POINTER is
			-- GdaDataModel* gda_data_model_array_copy_model (GdaDataModel *src, GError **error)
		external "C <libgda/libgda.h>"
		end

	gda_data_model_array_set_n_columns (a_model: POINTER; a_cols: INTEGER) is
			-- void gda_data_model_array_set_n_columns (GdaDataModelArray *model, gint cols)
		external "C <libgda/libgda.h>"
		end
	
	gda_data_model_array_clear (a_model: POINTER) is
			-- void gda_data_model_array_clear (GdaDataModelArray *model)
		external "C <libgda/libgda.h>"
		end

end -- class GDA_DATA_MODEL_ARRAY
