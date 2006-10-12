indexing
	description: "An implementation of GdaDataModel based on an array."
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

class GDA_DATA_MODEL_ARRAY

inherit 
	GDA_DATA_MODEL
	GDA_DATA_MODEL_ROW
		-- Known heirs: GdaDataModelFilterSQL
insert GDA_DATA_MODEL_ARRAY_EXTERNALS

creation with_column_number, from_external_pointer

feature {} -- Creation
	with_column_number (a_number_of_columns: INTEGER) is
		-- Creates a new GdaDataModel object without initializing the column 
		-- types. TODO: wrap  gda_data_model_array_new_with_types() 
		-- that is usually better.
		require positive_n: a_number_of_columns >= 0
		do
			from_external_pointer(gda_data_model_array_new(a_number_of_columns))
		end

	-- TODO: mimick variadic call gda_data_model_array_new_with_types 

	-- GdaDataModel* gda_data_model_array_new_with_types (gint cols,
	-- ...); Creates a new GdaDataModel object with the column types as
	-- specified.  cols : number of columns for rows in this data
	-- model.  ... : types of the columns of the model to create
	-- Returns : a pointer to the newly created GdaDataModel.

	-- TODO: copy, since it requires to access a G_ERROR 

	-- GdaDataModel* gda_data_model_array_copy_model (GdaDataModel
	-- *src, GError **error); Makes a copy of src into a new
	-- GdaDataModelArray object src : a GdaDataModel to copy data from
	-- error : a place to store errors, or NULL Returns : a new data
	-- model, or NULL if an error occurred

	set_n_columns (a_number: INTEGER) is
			-- Sets the number of columns for rows inserted in this
			-- model. Also clears model's contents.
		require positive: a_number >= 0
		do
			gda_data_model_array_set_n_columns (handle, a_number)
		end

	clear is
			-- Frees all the rows in model.		
		do
			gda_data_model_array_clear (handle)
		end
end -- class GDA_DATA_MODEL_ARRAY
