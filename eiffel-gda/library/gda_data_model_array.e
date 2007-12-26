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

	--  gda_data_model_array_new ()
	--
	-- GdaDataModel*       gda_data_model_array_new            (gint cols);
	--
	--   Creates a new GdaDataModel object without initializing the column types.
	--   Using gda_data_model_array_new_with_g_types() is usually better.
	--
	--   cols :    number of columns for rows in this data model.
	--   Returns : a pointer to the newly created GdaDataModel.
	--
	--   --------------------------------------------------------------------------
	--
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
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_array_copy_model ()
	--
	-- GdaDataModel*       gda_data_model_array_copy_model     (GdaDataModel *src,
	--                                                          GError **error);
	--
	--   Makes a copy of src into a new GdaDataModelArray object
	--
	--   src :     a GdaDataModel to copy data from
	--   error :   a place to store errors, or NULL
	--   Returns : a new data model, or NULL if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_array_set_n_columns ()
	--
	-- void                gda_data_model_array_set_n_columns  (GdaDataModelArray *model,
	--                                                          gint cols);
	--
	--   Sets the number of columns for rows inserted in this model. cols must be
	--   greated than or equal to 0.
	--
	--   Also clears model's contents.
	--
	--   model : the GdaDataModelArray.
	--   cols :  number of columns for rows this data model should use.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_array_clear ()
	--
	-- void                gda_data_model_array_clear          (GdaDataModelArray *model);
	--
	--   Frees all the rows in model.
	--
	--   model : the model to clear.
	--
	--Property Details
	--
	--  The "n-columns" property
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

	--                     GdaDataModelArrayClass;
	--                     GdaDataModelArrayPrivate;
	-- GdaDataModel*       gda_data_model_array_new            (gint cols);
	-- GdaDataModel*       gda_data_model_array_new_with_g_types
	--                                                         (gint cols,
	--                                                          ...);
	-- GdaDataModel*       gda_data_model_array_copy_model     (GdaDataModel *src,
	--                                                          GError **error);
	-- void                gda_data_model_array_set_n_columns  (GdaDataModelArray *model,
	--                                                          gint cols);
	-- void                gda_data_model_array_clear          (GdaDataModelArray *model);
end -- class GDA_DATA_MODEL_ARRAY
