indexing
	description: "GdaDataModelIter."
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

class GDA_DATA_MODEL_ITER

inherit
	GDA_PARAMETER_LIST

	 -- TODO: ITERATOR [something]

insert
	 GDA_DATA_MODEL_ITER_EXTERNALS

creation from_model, from_external_pointer

feature {} -- Creation

	from_model (a_model: GDA_DATA_MODEL) is
			-- Creates a new GdaDataModelIter object which represents a value or a
			-- parameter.
		require
			model_not_void: a_model /= Void
		do
			from_external_pointer(gda_data_model_iter_new(a_model.handle))
		end
feature 
	is_valid: BOOLEAN is
			-- Is Current iter valid?
		do
			Result:=(gda_data_model_iter_is_valid(handle)).to_boolean
		end

	-- TODO: those two can be improved
	is_successful: BOOLEAN
	has_error: BOOLEAN is do Result:= not is_successful end
	
	set_at_row (a_row: INTEGER) is
			-- Synchronizes the values of the parameters in iter with the values at
			-- `a_row'. If `a_row' < 0 then iter is not bound to any row of the
			-- data model it iters through.
			-- `is_successful' will be True if no error occures
		do
			is_successful:=(gda_data_model_iter_set_at_row
								 (handle, a_row)).to_boolean

		end

	next is
			-- Moves iter one row further than where it already is (synchronizes
			-- the values of the parameters in iter with the values at the new
			-- row). `is_successful' will be True if no error occures

		do
			is_successful:=(gda_data_model_iter_move_next(handle)).to_boolean
		end

	prev is
			-- Moves iter one row before where it already is (synchronizes the
			-- values of the parameters in iter with the values at the new row).
			-- `is_successful' will be True if no error occures
		do
			is_successful:=(gda_data_model_iter_move_prev(handle)).to_boolean
		end


	row: INTEGER is
			-- the row number which iter represents in the data model, or -1 if not
			-- available.
		do
			Result := gda_data_model_iter_get_row (handle)
		end

	invalidate_contents is
			-- Declare all the parameters in iter invalid, without modifying the
			-- GdaDataModel iter is for or changing the row it represents
		do
			gda_data_model_iter_invalidate_contents (handle)
		end

	column_for_param (a_parameter: GDA_PARAMETER): INTEGER is
			-- the column number in the GdaDataModel for which iter is an iterator
			-- as represented by `a_parameter'.
		require
			parameter_not_void: a_parameter /= Void
		do
			Result := (gda_data_model_iter_get_column_for_param
						  (handle, a_parameter.handle))
		end

	parameter_for_column (a_column: INTEGER): GDA_PARAMETER is
			-- the GdaParameter object which is synchronized with data at
			-- `a_column'. Void if an error occurred.
		local ptr: POINTER
		do
			ptr:= (gda_data_model_iter_get_param_for_column
					 (handle, a_column))
			if ptr.is_not_null then 
				create Result.from_external_pointer (ptr)
			end
		end

feature -- TODO: Properties


--    "current-row"          gint                  : Read / Write
--    "data-model"           gpointer              : Read / Write / Construct Only
--    "forced-model"         gpointer              : Read / Write
--    "update-model"         gboolean              : Read / Write

-- Signals


--  "end-of-data"
--              void        user_function      (GdaDataModelIter *gdadatamodeliter,
--                                              gpointer          user_data)             : Run first
--  "row-changed"
--              void        user_function      (GdaDataModelIter *gdadatamodeliter,
--                                              gint              arg1,
--                                              gpointer          user_data)             : Run first


-- Property Details

--   The "current-row" property

--    "current-row"          gint                  : Read / Write

--    Allowed values: >= -1

--    Default value: -1

--    --------------------------------------------------------------------------

--   The "data-model" property

--    "data-model"           gpointer              : Read / Write / Construct Only

--    --------------------------------------------------------------------------

--   The "forced-model" property

--    "forced-model"         gpointer              : Read / Write

--    --------------------------------------------------------------------------

--   The "update-model" property

--    "update-model"         gboolean              : Read / Write

--    Default value: TRUE

-- Signal Details

--   The "end-of-data" signal

--  void        user_function                  (GdaDataModelIter *gdadatamodeliter,
--                                              gpointer          user_data)             : Run first

--    gdadatamodeliter : the object which received the signal.
--    user_data :        user data set when the signal handler was connected.

--    --------------------------------------------------------------------------

--   The "row-changed" signal

--  void        user_function                  (GdaDataModelIter *gdadatamodeliter,
--                                              gint              arg1,
--                                              gpointer          user_data)             : Run first

--    gdadatamodeliter : the object which received the signal.
--    arg1 :
--    user_data :        user data set when the signal handler was connected.

end -- class GDA_DATA_MODEL_ITER
