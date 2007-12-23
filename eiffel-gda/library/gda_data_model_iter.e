indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GDA developers
					
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

class GDA_DATA_MODEL_ITER

inherit
	GDA_PARAMETER_LIST
		redefine struct_size end 
		-- TODO: make it an ITERATOR

creation make, from_external_pointer

feature {} -- Creation
	make (a_model: GDA_DATA_MODEL) is
			-- Creates a new GdaDataModelIter object which represents a
			-- value or a parameter from `a_model'.
		require model_not_void: a_model/=Void
		do
			from_external_pointer(gda_data_model_iter_new(a_model.handle))
		end

feature 
	is_valid_iter: BOOLEAN is
			-- Is Current valid iterator (if it actually corresponds to a
			-- valid row in the model)?
		do
			Result:=gda_data_model_iter_is_valid(handle).to_boolean
		end

	set_at_row (a_row: INTEGER) is
			-- Synchronizes the values of the parameters in iter with the
			-- values at `a_row'.
		
			-- If `a_row' < 0 then iter is not bound to any row of the
			-- data model it iters through.
		
			-- `is_successful' is updated
		do
			is_successful:=(gda_data_model_iter_set_at_row
								 (handle, a_row)).to_boolean
		end

	move_next is
			-- Moves iter one row further than where it already is
			-- (synchronizes the values of the parameters in iter with
			-- the values at the new row). `is_successful' is updated
		do
			is_successful:=(gda_data_model_iter_move_next(handle).to_boolean)
		end

	move_prev is
			-- Moves iter one row before where it already is
			-- (synchronizes the values of the parameters in iter with
			-- the values at the new row). `is_successful' is updated
		do
			is_successful:=gda_data_model_iter_move_prev(handle).to_boolean
		end

	row: INTEGER is
			-- The row which iter represents in the data model or -1 if
			-- not available.
		do
			Result:=gda_data_model_iter_get_row(handle)
		end

	invalidate_contents is
			-- Declare all the parameters in iter invalid, without
			-- modifying the GdaDataModel iter is for or changing the row
			-- it represents.
		do
			gda_data_model_iter_invalidate_contents(handle)
		end

	column_for_param (a_parameter: GDA_PARAMETER): INTEGER is
			-- The column number in the GdaDataModel for which iter is an
			-- iterator as represented by the param parameter.
		do
			Result:=gda_data_model_iter_get_column_for_param(handle,a_parameter.handle)
		end	

	parameter_for_column (a_column: INTEGER): GDA_PARAMETER is
			-- the GdaParameter synchronized with data at
			-- `a_column'. Void if an error occurred
		local ptr: POINTER; factory: G_OBJECT_EXPANDED_FACTORY[GDA_PARAMETER]
		do
			ptr := gda_data_model_iter_get_param_for_column(handle,a_column)
			if ptr.is_not_null then 
				Result:=factory.existant_wrapper(ptr)
				if Result=Void then create Result.from_external_pointer(ptr) end
			end
		end	

feature -- TODO: Properties
	--
	--
	--   "current-row"              gint                  : Read / Write
	--   "data-model"               GdaDataModel          : Read / Write / Construct Only
	--   "forced-model"             GdaDataModel          : Read / Write
	--   "update-model"             gboolean              : Read / Write
	--
	--Property Details
	--
	--  The "current-row" property
	--
	--   "current-row"              gint                  : Read / Write
	--
	--   Allowed values: >= -1
	--
	--   Default value: -1
	--
	--   --------------------------------------------------------------------------
	--
	--  The "data-model" property
	--
	--   "data-model"               GdaDataModel          : Read / Write / Construct Only
	--
	--   --------------------------------------------------------------------------
	--
	--  The "forced-model" property
	--
	--   "forced-model"             GdaDataModel          : Read / Write
	--
	--   --------------------------------------------------------------------------
	--
	--  The "update-model" property
	--
	--   "update-model"             gboolean              : Read / Write
	--
	--   Default value: TRUE
	--
	--Signals
	--
	--
	--   "end-of-data"                                    : Run First
	--   "row-changed"                                    : Run First
	--   "row-to-change"                                  : Run Last

	--Signal Details
	--
	--  The "end-of-data" signal
	--
	-- void                user_function                      (GdaDataModelIter *gdadatamodeliter,
	--                                                         gpointer          user_data)             : Run First
	--
	--   gdadatamodeliter : the object which received the signal.
	--   user_data :        user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "row-changed" signal
	--
	-- void                user_function                      (GdaDataModelIter *gdadatamodeliter,
	--                                                         gint              arg1,
	--                                                         gpointer          user_data)             : Run First
	--
	--   gdadatamodeliter : the object which received the signal.
	--   arg1 :
	--   user_data :        user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "row-to-change" signal
	--
	-- gboolean            user_function                      (GdaDataModelIter *gdadatamodeliter,
	--                                                         gint              arg1,
	--                                                         gpointer          user_data)             : Run Last
	--
	--   gdadatamodeliter : the object which received the signal.
	--   arg1 :
	--   user_data :        user data set when the signal handler was connected.
	--   Returns :

feature {} -- External calls
	gda_data_model_iter_new (a_model: POINTER): POINTER is
			-- GdaDataModelIter* gda_data_model_iter_new (GdaDataModel
			-- *model);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_iter_is_valid (an_iter: POINTER): INTEGER is
			-- gboolean gda_data_model_iter_is_valid (GdaDataModelIter
			-- *iter);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_iter_set_at_row (an_iter: POINTER; a_row: INTEGER): INTEGER is
			-- gboolean gda_data_model_iter_set_at_row (GdaDataModelIter
			-- *iter, gint row);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_iter_move_next (an_iter: POINTER): INTEGER is
			-- gboolean gda_data_model_iter_move_next (GdaDataModelIter
			-- *iter);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_iter_move_prev (an_iter: POINTER): INTEGER is
			-- gboolean gda_data_model_iter_move_prev (GdaDataModelIter
			-- *iter);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_iter_get_row (an_iter: POINTER): INTEGER is
			-- gint gda_data_model_iter_get_row (GdaDataModelIter *iter);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_iter_invalidate_contents (an_iter: POINTER) is
			-- void gda_data_model_iter_invalidate_contents
			-- (GdaDataModelIter *iter);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_iter_get_column_for_param (an_iter, a_parameter: POINTER): INTEGER is
			-- gint gda_data_model_iter_get_column_for_param
			-- (GdaDataModelIter *iter, GdaParameter *param);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_iter_get_param_for_column (an_iter: POINTER; a_column: INTEGER): POINTER is
			-- GdaParameter* gda_data_model_iter_get_param_for_column
			-- (GdaDataModelIter *iter, gint col);
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataModelIter)"
		end
end -- class GDA_DATA_MODEL_ITER
