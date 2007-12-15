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

inherit GDA_PARAMETER_LIST

	-- TODO: make it an ITERATOR

-- insert GDA_DATA_MODEL_ITER_EXTERNALS

creation from_external_pointer

feature {} -- Creation
	--   GdaDataModelIter
	--
	--Synopsis
	--
	--
	--
	--
	--                     GdaDataModelIter;
	-- GdaDataModelIter*   gda_data_model_iter_new             (GdaDataModel *model);
	-- gboolean            gda_data_model_iter_is_valid        (GdaDataModelIter *iter);
	-- gboolean            gda_data_model_iter_set_at_row      (GdaDataModelIter *iter,
	--                                                          gint row);
	-- gboolean            gda_data_model_iter_move_next       (GdaDataModelIter *iter);
	-- gboolean            gda_data_model_iter_move_prev       (GdaDataModelIter *iter);
	-- gint                gda_data_model_iter_get_row         (GdaDataModelIter *iter);
	-- void                gda_data_model_iter_invalidate_contents
	--                                                         (GdaDataModelIter *iter);
	-- gint                gda_data_model_iter_get_column_for_param
	--                                                         (GdaDataModelIter *iter,
	--                                                          GdaParameter *param);
	-- GdaParameter*       gda_data_model_iter_get_param_for_column
	--                                                         (GdaDataModelIter *iter,
	--                                                          gint col);
	--
	--
	--Object Hierarchy
	--
	--
	--   GObject
	--    +----GdaObject
	--          +----GdaParameterList
	--                +----GdaDataModelIter
	--
	--Properties
	--
	--
	--   "current-row"              gint                  : Read / Write
	--   "data-model"               GdaDataModel          : Read / Write / Construct Only
	--   "forced-model"             GdaDataModel          : Read / Write
	--   "update-model"             gboolean              : Read / Write
	--
	--Signals
	--
	--
	--   "end-of-data"                                    : Run First
	--   "row-changed"                                    : Run First
	--   "row-to-change"                                  : Run Last
	--
	--Description
	--
	--Details
	--
	--  GdaDataModelIter
	--
	-- typedef struct _GdaDataModelIter GdaDataModelIter;
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_iter_new ()
	--
	-- GdaDataModelIter*   gda_data_model_iter_new             (GdaDataModel *model);
	--
	--   Creates a new GdaDataModelIter object which represents a value or a
	--   parameter.
	--
	--   model :   Model used to create the GdaDataModelIter
	--   Returns : the new object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_iter_is_valid ()
	--
	-- gboolean            gda_data_model_iter_is_valid        (GdaDataModelIter *iter);
	--
	--   Tells if iter is a valid iterator (if it actually corresponds to a valid
	--   row in the model)
	--
	--   iter :    a GdaDataModelIter object
	--   Returns : TRUE if iter is valid
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_iter_set_at_row ()
	--
	-- gboolean            gda_data_model_iter_set_at_row      (GdaDataModelIter *iter,
	--                                                          gint row);
	--
	--   Synchronizes the values of the parameters in iter with the values at the
	--   row row
	--
	--   If row < 0 then iter is not bound to any row of the data model it iters
	--   through.
	--
	--   iter :    a GdaDataModelIter object
	--   row :     the row to set iter to
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_iter_move_next ()
	--
	-- gboolean            gda_data_model_iter_move_next       (GdaDataModelIter *iter);
	--
	--   Moves iter one row further than where it already is (synchronizes the
	--   values of the parameters in iter with the values at the new row).
	--
	--   iter :    a GdaDataModelIter object
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_iter_move_prev ()
	--
	-- gboolean            gda_data_model_iter_move_prev       (GdaDataModelIter *iter);
	--
	--   Moves iter one row before where it already is (synchronizes the values of
	--   the parameters in iter with the values at the new row).
	--
	--   iter :    a GdaDataModelIter object
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_iter_get_row ()
	--
	-- gint                gda_data_model_iter_get_row         (GdaDataModelIter *iter);
	--
	--   Get the row which iter represents in the data model
	--
	--   iter :    a GdaDataModelIter object
	--   Returns : the row number, or -1 if not available
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_iter_invalidate_contents ()
	--
	-- void                gda_data_model_iter_invalidate_contents
	--                                                         (GdaDataModelIter *iter);
	--
	--   Declare all the parameters in iter invalid, without modifying the
	--   GdaDataModel iter is for or changing the row it represents
	--
	--   iter : a GdaDataModelIter object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_iter_get_column_for_param ()
	--
	-- gint                gda_data_model_iter_get_column_for_param
	--                                                         (GdaDataModelIter *iter,
	--                                                          GdaParameter *param);
	--
	--   Get the column number in the GdaDataModel for which iter is an iterator as
	--   represented by the param parameter
	--
	--   iter :    a GdaDataModelIter object
	--   param :   a GdaParameter object, listed in iter
	--   Returns : the column number, or param is not valid
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_iter_get_param_for_column ()
	--
	-- GdaParameter*       gda_data_model_iter_get_param_for_column
	--                                                         (GdaDataModelIter *iter,
	--                                                          gint col);
	--
	--   Fetch a pointer to the GdaParameter object which is synchronized with data
	--   at column col
	--
	--   iter :    a GdaDataModelIter object
	--   col :     the requested column
	--   Returns : the GdaParameter, or NULL if an error occurred
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

end -- class GDA_DATA_MODEL_ITER
