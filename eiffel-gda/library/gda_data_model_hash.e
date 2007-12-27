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
	GDA_DATA_MODEL
	GDA_DATA_MODEL_ROW

creation from_external_pointer

feature {} -- Creation

	--  gda_data_model_hash_new ()
	--
	-- GdaDataModel*       gda_data_model_hash_new             (gint cols);
	--
	--   cols :    number of columns for rows in this data model.
	--   Returns : a pointer to the newly created GdaDataModel.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_hash_insert_row ()
	--
	-- void                gda_data_model_hash_insert_row      (GdaDataModelHash *model,
	--                                                          gint rownum,
	--                                                          GdaRow *row);
	--
	--   Inserts a row in the model.
	--
	--   model :  the GdaDataModelHash which is gonna hold the row.
	--   rownum : the number of the row.
	--   row :    the row to insert. The model is responsible of freeing it!
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_hash_set_n_columns ()
	--
	-- void                gda_data_model_hash_set_n_columns   (GdaDataModelHash *model,
	--                                                          gint cols);
	--
	--   Sets the number of columns for rows inserted in this model. cols must be
	--   greater than or equal to 0.
	--
	--   Also clears model's contents.
	--
	--   This function calls gda_data_model_hash_clear to free the existing rows if
	--   any.
	--
	--   model : the GdaDataModelHash.
	--   cols :  the number of columns for rows inserted in model.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_hash_clear ()
	--
	-- void                gda_data_model_hash_clear           (GdaDataModelHash *model);
	--
	--   Frees all the rows inserted in model.
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
