indexing
	description: "GdaDataModel -- Basic data model class."
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

deferred class GDA_DATA_MODEL
	-- GdaDataModel represents an array of values organized in rows and
	-- columns.  All the data in the same column have the same type,
	-- and all the data in each row have the same semantic meaning. The
	-- GdaDataModel is actually an interface implemented by other
	-- objects to support various kinds of data storage and operations.

	-- Depending on the real implementation, the contents of data
	-- models may be modified by the user using functions provided by
	-- the model. The actual operations a data model permits can be
	-- known using the gda_data_model_get_access_flags() method.
	
	-- Again, depending on the real implementation, data retreiving can
	-- be done either accessing direct random values located by their
	-- row and column, or using a GdaDataModelIter cursor, or both. Use
	-- the gda_data_model_get_access_flags() method to know how the
	-- data model can be accessed. Note that a GdaDatamodel which can
	-- be accessed in a random way can also be accessed using cursors
	-- (and several cusrors may be used at the same time), whereas data
	-- model which can only be accessed using cursors can only have one
	-- cursor for iterating.

	-- Random access data models are easier to use since picking a
	-- value is very simple using the gda_data_model_get_value_at(),
	-- but consume more memory since all the accessible values must
	-- generally be present in memory even if they are not used. Thus
	-- if a data model must handle large quantities of data, it is
	-- generally wiser to use a data model which can be only accessed
	-- using a cursor.

	-- As a side note there are also data models which wrap other data
	-- models such as:

	-- o The GdaDataProxy data model which stores temporary
	--   modifications and shows only some parts of the wrapped data
	--   model

	-- o The GdaDataAccessWrapper data model which offers a
	--   memory-efficient random access on top of a wrapped cursor
	--   based access data model

inherit GDA_OBJECT
	-- TODO: its a GInnterface

	-- Known Implementations: GdaDataModel is implemented by
	-- GdaDataModelFilterSQL, GdaDataProxy, GdaDataModelRow,
	-- GdaDataModelHash, GdaDataModelQuery, GdaDataAccessWrapper,
	-- GdaDataModelImport and GdaDataModelArray.

insert 
	GDA_DATA_MODEL_ACCESS_FLAGS_ENUM
	GDA_DATA_MODEL_HINT_ENUM

feature 
	row_inserted (a_row: INTEGER) is
			-- Emits the 'row_inserted' and 'changed' signals on model.
		do
			gda_data_model_row_inserted(handle,a_row)
		end

	row_updated (a_row: INTEGER) is
			--   Emits the 'row_updated' and 'changed' signals on model.
		do
			gda_data_model_row_updated(handle,a_row)
		end

	row_removed (a_row: INTEGER) is
			--   Emits the 'row_removed' and 'changed' signal on model.
		do
			gda_data_model_row_removed(handle,a_row)	
		end

	freeze is
			-- Disables notifications of changes on the given data
			-- model. To re-enable notifications again, invoke `thaw'.
		do
			gda_data_model_freeze(handle)
		end

	thaw is
			-- Re-enables notifications of changes on the given data model.
		do                
			gda_data_model_thaw(handle)
		end

	access_flags: INTEGER is
			-- the attributes of model such as how to access the data it
			-- contains if it's modifiable, etc. as OR'ed values
		do
			Result:=gda_data_model_get_access_flags(handle)
		ensure valid: are_valid_access_flags(Result)
		end
	
	count: INTEGER is
			-- the number of rows in the given data model, or -1 if the
			-- number of rows is not known
		do
			Result:=gda_data_model_get_n_rows(handle)
		end
	
	columns_count: INTEGER is
			-- the number of columns in the given data model.
		do
			Result:=gda_data_model_get_n_columns(handle)
		end	

	describe_column (a_column_n: INTEGER): GDA_COLUMN is
			-- Queries the underlying data model implementation for a
			-- description of a given column. 

			-- WARNING: changes to Result will affect the whole data
			-- model.
		do
			-- GdaColumn* gda_data_model_describe_column (GdaDataModel
			-- *model, gint col);
		
			-- the returned GdaColumn object belongs to the model model and and
			--   should not be destroyed; any modification will affect the whole data
			--   model.
		end


	column_index_by_name (a_name: STRING): INTEGER is
			-- The index of the column named `a_name' in model, or -1 if
			-- no such column exists.
		require name_not_void: a_name/=Void
		do
			Result:=gda_data_model_get_column_index_by_name(handle,a_name.to_external)
		end

	column_title (a_column: INTEGER): CONST_STRING is
			-- the title for the given column in a data model object.
		do
			create Result.from_external(gda_data_model_get_column_title(handle,a_column))
		ensure not_void: Result/=Void
		end

	--  gda_data_model_set_column_title ()
	--
	-- void                gda_data_model_set_column_title     (GdaDataModel *model,
	--                                                          gint col,
	--                                                          const gchar *title);
	--
	--   Sets the title of the given col in model.
	--
	--   model : a GdaDataModel object.
	--   col :   column number
	--   title : title for the given column.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_get_attributes_at ()
	--
	-- GdaValueAttribute   gda_data_model_get_attributes_at    (GdaDataModel *model,
	--                                                          gint col,
	--                                                          gint row);
	--
	--   Get the attributes of the value stored at (row, col) in proxy, which is an
	--   ORed value of GdaValueAttribute flags. As a special case, if row is -1,
	--   then the attributes returned correspond to a "would be" value if a row was
	--   added to model.
	--
	--   model :   a GdaDataModel object
	--   col :     a valid column number
	--   row :     a valid row number, or -1
	--   Returns : the attributes as an ORed value of GdaValueAttribute
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_get_value_at ()
	--
	-- const GValue*       gda_data_model_get_value_at         (GdaDataModel *model,
	--                                                          gint col,
	--                                                          gint row);
	--
	--   Retrieves the data stored in the given position (identified by the col and
	--   row parameters) on a data model.
	--
	--   This is the main function for accessing data in a model.
	--
	--   Note that the returned GValue must not be modified directly (unexpected
	--   behaviours may occur if you do so). If you want to modify a value stored
	--   in a GdaDataModel, use the gda_data_model_set_value() method.
	--
	--   model :   a GdaDataModel object.
	--   col :     a valid column number.
	--   row :     a valid row number.
	--   Returns : a GValue containing the value stored in the given position, or
	--             NULL on error (out-of-bound position, etc).
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_get_value_at_col_name ()
	--
	-- const GValue*       gda_data_model_get_value_at_col_name
	--                                                         (GdaDataModel *model,
	--                                                          const gchar *column_name,
	--                                                          gint row);
	--
	--   Retrieves the data stored in the given position (identified by the
	--   col_name column and row parameters) on a data model.
	--
	--   See also gda_data_model_get_value_at().
	--
	--   model :       a GdaDataModel object.
	--   column_name : a valid column name.
	--   row :         a valid row number.
	--   Returns :     a GValue containing the value stored in the given position,
	--                 or NULL on error (out-of-bound position, etc).
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_set_value_at ()
	--
	-- gboolean            gda_data_model_set_value_at         (GdaDataModel *model,
	--                                                          gint col,
	--                                                          gint row,
	--                                                          const GValue *value,
	--                                                          GError **error);
	--
	--   model :   a GdaDataModel object.
	--   col :     column number.
	--   row :     row number.
	--   value :   a GValue, or NULL
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if the value in the data model has been updated and no
	--             error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_set_values ()
	--
	-- gboolean            gda_data_model_set_values           (GdaDataModel *model,
	--                                                          gint row,
	--                                                          GList *values,
	--                                                          GError **error);
	--
	--   If any value in values is actually NULL, then it is considered as a
	--   default value.
	--
	--   model :   a GdaDataModel object.
	--   row :     row number.
	--   values :  a list of GValue, one for each n (<nb_cols) columns of model
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if the value in the data model has been updated and no
	--             error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_create_iter ()
	--
	-- GdaDataModelIter*   gda_data_model_create_iter          (GdaDataModel *model);
	--
	--   Creates a new iterator object GdaDataModelIter object which can be used to
	--   iterate through rows in model.
	--
	--   The row the returned GdaDataModelIter represents is undefined. For models
	--   which can be accessed randomly the correspoding row can be set using
	--   gda_data_model_move_iter_at_row(), and for models which are accessible
	--   sequentially only then the first row will be fetched using
	--   gda_data_model_move_iter_next().
	--
	--   model :   a GdaDataModel object.
	--   Returns : a new GdaDataModelIter object, or NULL if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_append_values ()
	--
	-- gint                gda_data_model_append_values        (GdaDataModel *model,
	--                                                          const GList *values,
	--                                                          GError **error);
	--
	--   Appends a row to the given data model. If any value in values is actually
	--   NULL, then it is considered as a default value.
	--
	--   model :   a GdaDataModel object.
	--   values :  GList of GValue* representing the row to add. The length must
	--             match model's column count. These GValue are value-copied (the
	--             user is still responsible for freeing them).
	--   error :   a place to store errors, or NULL
	--   Returns : the number of the added row, or -1 if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_append_row ()
	--
	-- gint                gda_data_model_append_row           (GdaDataModel *model,
	--                                                          GError **error);
	--
	--   Appends a row to the data model.
	--
	--   model :   a GdaDataModel object.
	--   error :   a place to store errors, or NULL
	--   Returns : the number of the added row, or -1 if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_remove_row ()
	--
	-- gboolean            gda_data_model_remove_row           (GdaDataModel *model,
	--                                                          gint row,
	--                                                          GError **error);
	--
	--   Removes a row from the data model.
	--
	--   model :   a GdaDataModel object.
	--   row :     the row number to be removed.
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if successful, FALSE otherwise.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_get_row_from_values ()
	--
	-- gint                gda_data_model_get_row_from_values  (GdaDataModel *model,
	--                                                          GSList *values,
	--                                                          gint *cols_index);
	--
	--   Returns the first row where all the values in values at the columns
	--   identified at cols_index match. If the row can't be identified, then
	--   returns -1;
	--
	--   NOTE: the cols_index array MUST contain a column index for each value in
	--   values
	--
	--   model :      a GdaDataModel object.
	--   values :     a list of GValue values
	--   cols_index : an array of gint containing the column number to match each
	--                value of values
	--   Returns :    the requested row number, of -1 if not found
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_send_hint ()
	--
	-- void                gda_data_model_send_hint            (GdaDataModel *model,
	--                                                          GdaDataModelHint hint,
	--                                                          const GValue *hint_value);
	--
	--   Sends a hint to the data model. The hint may or may not be handled by the
	--   data model, depending on its implementation
	--
	--   model :      a GdaDataModel
	--   hint :       a hint to send to the model
	--   hint_value : an optional value to specify the hint, or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_export_to_string ()
	--
	-- gchar*              gda_data_model_export_to_string     (GdaDataModel *model,
	--                                                          GdaDataModelIOFormat format,
	--                                                          const gint *cols,
	--                                                          gint nb_cols,
	--                                                          const gint *rows,
	--                                                          gint nb_rows,
	--                                                          GdaParameterList *options);
	--
	--   Exports data contained in model to a string; the format is specified using
	--   the format argument.
	--
	--   Specifically, the parameters in the options list can be:
	--
	--     o "SEPARATOR": a string value of which the first character is used as a
	--       separator in case of CSV export
	--
	--     o "NAME": a string value used to name the exported data if the export
	--       format is XML
	--
	--   model :   a GdaDataModel
	--   format :  the format in which to export data
	--   cols :    an array containing which columns of model will be exported, or
	--             NULL for all columns
	--   nb_cols : the number of columns in cols
	--   rows :    an array containing which rows of model will be exported, or
	--             NULL for all rows
	--   nb_rows : the number of rows in rows
	--   options : list of options for the export
	--   Returns : a new string.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_export_to_file ()
	--
	-- gboolean            gda_data_model_export_to_file       (GdaDataModel *model,
	--                                                          GdaDataModelIOFormat format,
	--                                                          const gchar *file,
	--                                                          const gint *cols,
	--                                                          gint nb_cols,
	--                                                          const gint *rows,
	--                                                          gint nb_rows,
	--                                                          GdaParameterList *options,
	--                                                          GError **error);
	--
	--   Exports data contained in model to the file file; the format is specified
	--   using the format argument.
	--
	--   Specifically, the parameters in the options list can be:
	--
	--     o "SEPARATOR": a string value of which the first character is used as a
	--       separator in case of CSV export
	--
	--     o "NAME": a string value used to name the exported data if the export
	--       format is XML
	--
	--     o "OVERWRITE": a boolean value which tells if the file must be
	--       over-written if it already exists.
	--
	--   model :   a GdaDataModel
	--   format :  the format in which to export data
	--   file :    the filename to export to
	--   cols :    an array containing which columns of model will be exported, or
	--             NULL for all columns
	--   nb_cols : the number of columns in cols
	--   rows :    an array containing which rows of model will be exported, or
	--             NULL for all rows
	--   nb_rows : the number of rows in rows
	--   options : list of options for the export
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_add_data_from_xml_node ()
	--
	-- gboolean            gda_data_model_add_data_from_xml_node
	--                                                         (GdaDataModel *model,
	--                                                          xmlNodePtr node,
	--                                                          GError **error);
	--
	--   Adds the data from a XML node to the given data model (see the DTD for
	--   that node in the $prefix/share/libgda/dtd/libgda-array.dtd file).
	--
	--   model :   a GdaDataModel.
	--   node :    a XML node representing a <gda_array_data> XML node.
	--   error :
	--   Returns : TRUE if successful, FALSE otherwise.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_import_from_model ()
	--
	-- gboolean            gda_data_model_import_from_model    (GdaDataModel *to,
	--                                                          GdaDataModel *from,
	--                                                          gboolean overwrite,
	--                                                          GHashTable *cols_trans,
	--                                                          GError **error);
	--
	--   Copy the contents of the from data model to the to data model. The copy
	--   stops as soon as an error orrurs.
	--
	--   The cols_trans is a hash table for which keys are to columns numbers and
	--   the values are the corresponding column numbers in the from data model. To
	--   set the values of a column in to to NULL, create an entry in the hash
	--   table with a negative value.
	--
	--   to :         the destination GdaDataModel
	--   from :       the source GdaDataModel
	--   overwrite :  TRUE if to is completely overwritten by from's data, and
	--                FALSE if from's data is appended to to
	--   cols_trans : a GHashTable for columns translating, or NULL
	--   error :      a place to store errors, or NULL
	--   Returns :    TRUE if no error occurred.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_import_from_string ()
	--
	-- gboolean            gda_data_model_import_from_string   (GdaDataModel *model,
	--                                                          const gchar *string,
	--                                                          GHashTable *cols_trans,
	--                                                          GdaParameterList *options,
	--                                                          GError **error);
	--
	--   Loads the data from string into model.
	--
	--   model :      a GdaDataModel
	--   string :     the string to import data from
	--   cols_trans : a hash table containing which columns of model will be
	--                imported, or NULL for all columns
	--   options :    list of options for the export
	--   error :      a place to store errors, or NULL
	--   Returns :    TRUE if no error occurred.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_import_from_file ()
	--
	-- gboolean            gda_data_model_import_from_file     (GdaDataModel *model,
	--                                                          const gchar *file,
	--                                                          GHashTable *cols_trans,
	--                                                          GdaParameterList *options,
	--                                                          GError **error);
	--
	--   Imports data contained in the file file into model; the format is
	--   detected.
	--
	--   model :      a GdaDataModel
	--   file :       the filename to import from
	--   cols_trans : a GHashTable for columns translating, or NULL
	--   options :    list of options for the export
	--   error :      a place to store errors, or NULL
	--   Returns :    TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_dump ()
	--
	-- void                gda_data_model_dump                 (GdaDataModel *model,
	--                                                          FILE *to_stream);
	--
	--   Dumps a textual representation of the model to the to_stream stream
	--
	--   model :     a GdaDataModel.
	--   to_stream : where to dump the data model
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_dump_as_string ()
	--
	-- gchar*              gda_data_model_dump_as_string       (GdaDataModel *model);
	--
	--   Dumps a textual representation of the model into a new string
	--
	--   model :   a GdaDataModel.
	--   Returns : a new string.

feature -- TODO: Signals
	--   "reset"                                          : Run Last
	--   "row-inserted"                                   : Run Last
	--   "row-removed"                                    : Run Last
	--   "row-updated"                                    : Run Last
	--Signal Details
	--
	--  The "reset" signal
	--
	-- void                user_function                      (GdaDataModel *gdadatamodel,
	--                                                         gpointer      user_data)         : Run Last
	--
	--   gdadatamodel : the object which received the signal.
	--   user_data :    user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "row-inserted" signal
	--
	-- void                user_function                      (GdaDataModel *gdadatamodel,
	--                                                         gint          arg1,
	--                                                         gpointer      user_data)         : Run Last
	--
	--   gdadatamodel : the object which received the signal.
	--   arg1 :
	--   user_data :    user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "row-removed" signal
	--
	-- void                user_function                      (GdaDataModel *gdadatamodel,
	--                                                         gint          arg1,
	--                                                         gpointer      user_data)         : Run Last
	--
	--   gdadatamodel : the object which received the signal.
	--   arg1 :
	--   user_data :    user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "row-updated" signal
	--
	-- void                user_function                      (GdaDataModel *gdadatamodel,
	--                                                         gint          arg1,
	--                                                         gpointer      user_data)         : Run Last
	--
	--   gdadatamodel : the object which received the signal.
	--   arg1 :
	--   user_data :    user data set when the signal handler was connected.

feature {} -- External calls
																	--                     GdaDataModel;
	-- enum                GdaDataModelAccessFlags;
	-- enum                GdaDataModelHint;
	-- enum                GdaDataModelIOFormat;
	gda_data_model_row_inserted (a_model: POINTER; a_row: INTEGER) is
			-- void gda_data_model_row_inserted (GdaDataModel *model, gint row);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_row_updated (a_model: POINTER; a_row: INTEGER) is
			-- void gda_data_model_row_updated (GdaDataModel *model, gint row);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_row_removed (a_model: POINTER; a_row: INTEGER) is
			-- void gda_data_model_row_removed (GdaDataModel *model, gint row);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_freeze (a_model: POINTER) is
			-- void gda_data_model_freeze (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_thaw (a_model: POINTER) is
			-- void gda_data_model_thaw (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_get_access_flags (a_model: POINTER): INTEGER is
			-- GdaDataModelAccessFlags gda_data_model_get_access_flags (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_get_n_rows (a_model: POINTER): INTEGER is
			-- gint gda_data_model_get_n_rows (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_get_n_columns (a_model: POINTER): INTEGER is
			-- gint gda_data_model_get_n_columns (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_describe_column (a_model: POINTER; a_col: INTEGER): POINTER is
			-- GdaColumn* gda_data_model_describe_column (GdaDataModel *model, gint col);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_get_column_index_by_name (a_model, a_name: POINTER): INTEGER is
			-- gint gda_data_model_get_column_index_by_name (GdaDataModel *model, const gchar *name);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_get_column_title (a_model: POINTER; a_col: INTEGER): POINTER is
			-- const gchar* gda_data_model_get_column_title (GdaDataModel *model, gint col);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_set_column_title (a_model: POINTER; a_col: INTEGER; a_title: POINTER) is
			-- void gda_data_model_set_column_title (GdaDataModel *model, gint col, const gchar *title);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_get_attributes_at (a_model: POINTER; a_col, a_row: INTEGER): INTEGER is
			-- GdaValueAttribute gda_data_model_get_attributes_at (GdaDataModel *model, gint col, gint row);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_get_value_at (a_model: POINTER; a_col, a_row: INTEGER): POINTER is
			-- const GValue* gda_data_model_get_value_at (GdaDataModel *model, gint col, gint row);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_get_value_at_col_name (a_model, a_name: POINTER; a_row: INTEGER): POINTER is
				-- const GValue* gda_data_model_get_value_at_col_name (GdaDataModel *model, const gchar *column_name, gint row);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_set_value_at (a_model: POINTER; a_col, a_row: INTEGER; a_value, an_error_ref: POINTER): INTEGER is
			-- gboolean gda_data_model_set_value_at (GdaDataModel *model, gint col, gint row, const GValue *value, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_set_values (a_model: POINTER; a_row: INTEGER; some_values, an_error_ref: POINTER): INTEGER is
			-- gboolean gda_data_model_set_values (GdaDataModel *model, gint row, GList *values, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_create_iter (a_model: POINTER): POINTER is
			-- GdaDataModelIter* gda_data_model_create_iter (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_append_values (a_model, some_values, an_error_ref: POINTER): INTEGER is
			-- gint gda_data_model_append_values (GdaDataModel *model, const GList *values, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_append_row (a_model, an_error_ref: POINTER): INTEGER is
			-- gint gda_data_model_append_row (GdaDataModel *model, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_remove_row (a_model: POINTER; a_row: INTEGER; an_error_ref: POINTER): INTEGER is
			-- gboolean gda_data_model_remove_row (GdaDataModel *model, gint row, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_get_row_from_values (a_model, some_values, a_cols_index: POINTER): INTEGER is
			-- gint gda_data_model_get_row_from_values (GdaDataModel *model, GSList *values, gint *cols_index);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_send_hint (a_model: POINTER; an_hint: INTEGER; an_hint_value: POINTER) is
			-- void gda_data_model_send_hint (GdaDataModel *model, GdaDataModelHint hint, const GValue *hint_value);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_export_to_string (a_model: POINTER; a_format: INTEGER; some_cols: POINTER; a_cols_n: INTEGER; some_rows: POINTER; a_rows_n: INTEGER; some_options: POINTER): POINTER is
			-- gchar* gda_data_model_export_to_string (GdaDataModel *model, GdaDataModelIOFormat format, const gint *cols, gint nb_cols, const gint *rows, gint nb_rows, GdaParameterList *options);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_export_to_file (a_model: POINTER; a_format: INTEGER; a_file, some_cols: POINTER; a_cols_n: INTEGER; some_rows: POINTER; a_rows_n: INTEGER; some_options, an_error_ref: POINTER): INTEGER is
			-- gboolean gda_data_model_export_to_file (GdaDataModel *model, GdaDataModelIOFormat format, const gchar *file, const gint *cols, gint nb_cols, const gint *rows, gint nb_rows, GdaParameterList *options, GError **error);
		external "C use <libgda/libgda.h>"
		end

	-- TODO: gboolean gda_data_model_add_data_from_xml_node (GdaDataModel *model, xmlNodePtr node, GError **error);
	
	gda_data_model_import_from_model (a_model_to, a_model_from: POINTER; an_overwrite_flag: INTEGER; a_col_trans, an_error_ref: POINTER): INTEGER is
			-- gboolean gda_data_model_import_from_model (GdaDataModel *to, GdaDataModel *from, gboolean overwrite, GHashTable *cols_trans, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_import_from_string (a_model, a_string, a_cols_trans, some_options, an_error_ref: POINTER): INTEGER is
			-- gboolean gda_data_model_import_from_string (GdaDataModel *model, const gchar *string, GHashTable *cols_trans, GdaParameterList *options, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_import_from_file (a_model, a_file, a_cols_trans, some_options, an_error: POINTER): INTEGER is
			-- gboolean gda_data_model_import_from_file (GdaDataModel *model, const gchar *file, GHashTable *cols_trans, GdaParameterList *options, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_dump (a_model, a_to_stream: POINTER) is
			-- void gda_data_model_dump (GdaDataModel *model, FILE *to_stream);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_dump_as_string (a_model: POINTER): POINTER is
			-- gchar* gda_data_model_dump_as_string (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end


end -- class GDA_DATA_MODEL
