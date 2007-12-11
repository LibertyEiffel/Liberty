indexing
	description: "GdaDataModelHash: An implementation of GdaDataModel based on a hash table."
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

					-- Description: Unlike GdaDataModelArray, this data model
					-- implementation stores the GdaRow in a hash table. So it only
					-- retrieves from the database backend exactly the requested rows
					-- (while in GdaDataModelArray you have to retrieve all the rows
					-- until the one requested).

class GDA_DATA_MODEL_HASH

inherit 
	GDA_DATA_MODEL_ROW
	GDA_DATA_MODEL -- since GdaDataModelHash implements GdaDataModel.

insert GDA_DATA_MODEL_HASH_EXTERNALS

creation dummy, make, from_external_pointer

feature {} -- Creation
	with_column (a_column_number: INTEGER) is
			-- Create a new GDA_DATA_MODEL_HASH with `a_column_number'
		do
			from_external_pointer(gda_data_model_hash_new(a_column_number))
		end
	
feature
	insert_row (a_row_number: INTEGER; a_row: GDA_ROW) is
			-- Inserts `a_row' in the model in `a_number_row'.
		require
			row_not_void: a_row /= Void
			positive_row: a_row_number >= 0
		do
			gda_data_model_hash_insert_row (handle, a_row_number, a_row.handle)
		end

	set_n_columns (a_column_number: INTEGER) is
			-- Sets the number of columns for rows inserted in this model. Also
			-- clears model's contents, calling `clear' to free/dispose the
			-- existing rows if any.
		require
			positive_row: a_row_number >= 0
		do
			gda_data_model_hash_set_n_columns (handle, a_column_number)
		end

	clear is
			-- Frees all the rows inserted in model.
		do
			gda_data_model_hash_clear (handle)
		end
end -- class GDA_DATA_MODEL_HASH
