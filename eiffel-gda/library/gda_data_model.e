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

inherit 
	GDA_OBJECT
	
	-- TODO: COLLECTION2 [GDA_VALUE]

	-- TODO: if ever necessary: GInnterface

	-- Known Implementations: GdaDataModel is implemented by
	-- GdaDataModelFilterSQL, GdaDataProxy, GdaDataModelRow,
	-- GdaDataModelHash, GdaDataModelQuery, GdaDataAccessWrapper,
	-- GdaDataModelImport and GdaDataModelArray.
	STREAM_HANDLER undefine copy, is_equal end

insert 
	SHARED_G_ERROR
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

	set_column_title (a_column: INTEGER; a_title: STRING) is
			-- Sets the title of `a_column' in model.
		require title_not_void: a_title/=Void
		do
			gda_data_model_set_column_title(handle,a_column,a_title.to_external)
		end

	--	TODO: attributes_at  (a_column, a_row: INTEGER): GDA_VALUE_ATTRIBUTE is
	-- Couldn't find definition of GdaValueAttribute
	--
	-- GdaValueAttribute   gda_data_model_get_attributes_at    (GdaDataModel *model,
	--                                                          gint col,
	--                                                          gint row);

	--   Get the attributes of the value stored at (row, col) in proxy, which is an
	--   ORed value of GdaValueAttribute flags. As a special case, if row is -1,
	--   then the attributes returned correspond to a "would be" value if a row was
	--   added to model.

	--   model :   a GdaDataModel object
	--   col :     a valid column number
	--   row :     a valid row number, or -1
	--   Returns : the attributes as an ORed value of GdaValueAttribute

	value_at (a_column, a_row: INTEGER): G_VALUE is
			-- the data stored at `a_column' and `a_row'.
		
			-- Note that the Result is petriefied so it cannot be
			-- modified directly without raising an exception since
			-- unexpected behaviours may occur if you do so. If you want
			-- to modify a value stored in a GdaDataModel, use the
			-- `set_value' feature.
		
			-- Void on error (out-of-bound position, etc).
			
			-- TODO: require valid_column, valid_row valid column
			-- number. and a valid row number.
		local ptr: POINTER
		do
			ptr := gda_data_model_get_value_at(handle, a_column, a_row)
			if ptr.is_not_null then 
				create Result.from_external_pointer(ptr) 
				Result.petrify
			end
		end	

	value_at_col_name (a_column_name: STRING; a_row: INTEGER): G_VALUE is
			-- the data stored in the position identified by the
			-- `a_column_name' and `a_row' on a data model.

			-- Void on errors (out-of-bound position, etc).

			-- TODO: require -- column_name : a valid column name.  row :
			-- a valid row number.
		local ptr: POINTER 
		do
			ptr := gda_data_model_get_value_at_col_name(handle, a_column_name.to_external, a_row)
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end 
		end

	set_value_at (a_column, a_row: INTEGER; a_value: G_VALUE) is
			-- Set `a_value' at `a_column' and `a_row'. `is_successful' and `error' are updated.
		local res: INTEGER
		do
			is_successful:=(gda_data_model_set_value_at
								 (handle,a_column,a_row,null_or(a_value), address_of(error.handle))
								 ).to_boolean
		end

	set_values (a_row: INTEGER; some_values: G_LIST[G_VALUE]) is
			-- Set `some_values' in `a_row'. `is_successful' and `error'
			-- are updated.
		
			-- If any value in values is actually Void, then it is
			-- considered as a default value.
		
			--   model :   a GdaDataModel object.
			--   row :     row number.
			--   values :  a list of GValue, one for each n (<nb_cols) columns of model
			--   error :   a place to store errors, or NULL
			--   Returns : TRUE if the value in the data model has been updated and no
			--             error occurred
		require 
			values_not_void: some_values/=Void
			correct_size: some_values.count<=columns_count
		do
			is_successful:=(gda_data_model_set_values
								 (handle, a_row, some_values.handle, 
								  address_of(error.handle)).to_boolean)
		end

	get_new_iterator: GDA_DATA_MODEL_ITER is
			-- A new iterator object GdaDataModelIter object which can be
			-- used to iterate through rows in model.

			-- The row the returned GdaDataModelIter represents is
			-- undefined. For models which can be accessed randomly the
			-- correspoding row can be set using `move_iter_at_row', and
			-- for models which are accessible sequentially only then the
			-- first row will be fetched using `move_iter_next'.
	
			-- Can be Void if an error occurred
		local p: POINTER
		do
			p := gda_data_model_create_iter(handle)
			if p.is_not_null then create Result.from_external_pointer(p) end
		end

	appended_row: INTEGER 
			-- The number of a row newly appeded to the data
			-- model with `append_row' or `append_values'.
	
	append_values (some_values: G_LIST[G_VALUE]) is
			--   Appends a row to the Current data model. If any value in
			--   values is actually Void, then it is considered as a
			--   default value.  `appended_row' will contain the number
			--   of the newly appended row or -1 in case of errors
		require 
			values_not_void: some_values/=Void
			correct_size: some_values.count=columns_count
		local res: INTEGER
		do
			res:=gda_data_model_append_values(handle, some_values.handle, address_of(error.handle))
		end
	
	append_row is 
			-- Append a new row to the data model. `is_successful' and
			-- `error' are updated. `appended_row' will contain the 
			-- number of the newly appended row or -1 in case of errors
		do
			appended_row:=gda_data_model_append_row(handle,address_of(error.handle))
			is_successful := appended_row /= -1 
		ensure is_successful = (appended_row /= -1)
		end

	remove_row (a_row: INTEGER) is
			--   Removes `a_row' from the data model. `is_successful' and
			-- `error' are updated.
		do
			is_successful:=(gda_data_model_remove_row(handle,a_row,address_of(error.handle))).to_boolean
		end

	row_from_values (some_values: G_SLIST[GDA_VALUE]; some_column_indexes: ARRAY[INTEGER]): INTEGER is
			-- Tthe first row where all the values in `some_values' at the
			-- columns identified at `some_column_indexes' match. If the row can't
			-- be identified, then returns -1;
		require
			values_not_void: some_values/=Void
			indexes_not_void: some_column_indexes/=Void
			one_value_per_index: some_values.count = some_column_indexes.count
		do
			Result:=gda_data_model_get_row_from_values(handle,some_values.handle,
																	 some_column_indexes.to_external)
		end

	send_hint (a_hint: INTEGER; a_hint_value: G_VALUE) is
			-- Sends `a_hint' to the data model. The hint may or may not
			-- be handled by the data model, depending on its
			-- implementation. `a_hint_value' is an optional value to
			-- specify the hint; it can be Void.
		require valid_hint: is_valid_hint(a_hint)
		do
			gda_data_model_send_hint(handle, a_hint, null_or(a_hint_value))
		end

	export_to_string (a_format: INTEGER; some_columns: ARRAY[INTEGER]; 
							some_rows: ARRAY[INTEGER]; some_options: GDA_PARAMETER_LIST): STRING is 
			-- Exports data contained in model to a string; the format is
			-- specified using `a_format' argument.
		
			-- Specifically, the parameters in `an_options_list' can be:
		
			-- o "SEPARATOR": a string value of which the first character
			--   is used as a separator in case of CSV export
	
			-- o "NAME": a string value used to name the exported data if
			--   the export format is XML
	
			--   model :   a GdaDataModel
			--   format :  the format in which to export data
			--   cols :    an array containing which columns of model will be exported, or
			--             NULL for all columns
			--   nb_cols : the number of columns in cols
			--   rows :    an array containing which rows of model will be exported, or
			--             NULL for all rows
		require 
			options_not_void: some_options/=Void
		local columns_ptr, rows_ptr: POINTER; cols_n, rows_n: INTEGER
		do
			if some_columns/=Void then columns_ptr:=some_columns.to_external; cols_n:=some_columns.count end
			if some_rows/=Void then rows_ptr:=some_rows.to_external; cols_n:=some_rows.count end
			create Result.from_external(gda_data_model_export_to_string
												 (handle, a_format, 
												  columns_ptr, cols_n,
												  rows_ptr, rows_n,
												  some_options.handle))
		end

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

	import_from_model (a_model: GDA_DATA_MODEL; overwrite: BOOLEAN) is
			-- Copy the contents of `a_model' to Current model. The copy
			-- stops as soon as an error orrurs.
			
			-- TODO: add support for the cols_trans hash table (for which
			-- keys are to columns numbers and the values are the
			-- corresponding column numbers in the from data model. To
			-- set the values of a column in to to NULL, create an entry
			-- in the hash table with a negative value.)

			-- overwrite : TRUE if to is completely overwritten by from's
			-- data, and FALSE if from's data is appended to to
		
			-- `error' and `is_successful' are updated.
		require model_not_void: a_model/=Void
		do
			is_successful:=(gda_data_model_import_from_model
								  (handle,a_model.handle,overwrite.to_integer,
									default_pointer, -- Or GHashTable *cols_trans,
									address_of(error.handle))).to_boolean
		end

	import_from_string (a_string: STRING; some_options: GDA_PARAMETER_LIST) is
			-- Loads the data from `a_string' into model.  TODO: add
			-- support for cols_trans : a hash table containing which
			-- columns of model will be imported, or NULL for all columns
			-- options : list of options for the export. `error' and
			-- `is_successful' are updated
		require 
			string_not_void: a_string/=Void
			options_not_void: some_options/=Void
		do
			is_successful:=(gda_data_model_import_from_string
								 (handle, a_string.to_external,
								  default_pointer, -- TODO: GHashTable *cols_trans,
								  some_options.handle, address_of(error.handle))).to_boolean
		end	

	import_from_file (a_file: STRING; some_options: GDA_PARAMETER_LIST) is
			-- Imports data contained in `a_file' file into model; the
			-- format is detected. `some_options' is list of options
			-- considered for the import.

			-- TODO: support for cols_trans : a GHashTable for columns
			-- translating, or NULL

			-- `error' and `is_successful' are updated.
		require 
			file_not_void: a_file/=Void
			options_not_void: some_options/=Void
		do
			is_successful:=(gda_data_model_import_from_file
								 (handle, a_file.to_external,
								  default_pointer, -- TODO: support for GHashTable *cols_trans,
								  some_options.handle, address_of(error.handle))).to_boolean
		end

	dump_to (a_stream: OUTPUT_STREAM) is
			-- Dumps a textual representation of the model to `a_stream'.
		require stream_not_void: a_stream/=Void
		do
			gda_data_model_dump(handle, a_stream.stream_pointer)
		end

	to_string: STRING is
			-- A textual representation of the model. Useful as a dump.
		do
			create Result.from_external(gda_data_model_dump_as_string(handle))
		ensure not_void: Result/=Void
		end

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
