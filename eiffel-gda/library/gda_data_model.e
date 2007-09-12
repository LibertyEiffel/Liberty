indexing
	description: "GdaDataModel -- Basic data model class."
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

			-- Description:A GdaDataMode represents an array of values
			-- organized in rows and columns.  All the data in the same
			-- column have the same type, and all the data in each row
			-- have the same semantic meaning. The GdaDataModel is
			-- actually an interface implemented by other objects to
			-- support various kinds of data storage and operations.

			-- Depending on the real implementation, the contents of data
			-- models may be modified by the user using functions
			-- provided by the model. The actual operations a data model
			-- permits can be known using the
			-- gda_data_model_get_access_flags() method.

			-- Again, depending on the real implementation, data
			-- retreiving can be done either accessing direct random
			-- values located by their row and column, or using a
			-- GdaDataModelIter cursor, or both. Use the
			-- gda_data_model_get_access_flags() method to know how the
			-- data model can be accessed. Note that a GdaDatamodel which
			-- can be accessed in a random way can also be accessed using
			-- cursors (and several cusrors may be used at the same
			-- time), whereas data model which can only be accessed using
			-- cursors can only have one cursor for iterating.

			-- Random access data models are easier to use since picking
			-- a value is very simple using the
			-- gda_data_model_get_value_at(), but consume more memory
			-- since all the accessible values must generally be present
			-- in memory even if they are not used. Thus if a data model
			-- must handle large quantities of data, it is generally
			-- wiser to use a data model which can be only accessed using
			-- a cursor.

			-- As a side note there are also data models which wrap other
			-- data models such as:

			-- o The GdaDataProxy data model which stores temporary
			-- modifications and shows only some parts of the wrapped
			-- data model

			-- o The GdaDataAccessWrapper data model which offers a
			-- memory-efficient random access on top of a wrapped cursor
			-- based access data model

class GDA_DATA_MODEL

	-- Note: this should be deferred. It has not made deferred because
	-- it is necessary to create GDA_DATA_MODELs without knowing which
	-- effective heir it is...
	
inherit 
	GDA_OBJECT 

		-- Prerequisites: GdaDataModel requires GdaObject.
	
		-- Known Implementations: GdaDataModel is implemented by
		-- GdaDataModelFilterSQL, GdaDataProxy, GdaDataModelRow,
		-- GdaDataModelHash, GdaDataModelQuery, GdaDataAccessWrapper,
		-- GdaDataModelImport and GdaDataModelArray.

insert
	GDA_DATA_MODEL_EXTERNALS
	GDA_DATA_MODEL_ACCESS_FLAGS_ENUM
	GDA_DATA_MODEL_HINT_ENUM
	GDA_DATA_MODEL_IO_FORMAT_ENUM

	SHARED_G_ERROR
	
creation dummy, make, from_external_pointer

feature 
	changed is
			-- Notifies listeners of the given data model object of
			-- changes in the underlying data. Listeners usually will
			-- connect themselves to the "changed" signal in the
			-- GdaDataModel class, thus being notified of any new data
			-- being appended or removed from the data model.
		do
			gda_data_model_changed (handle)
		end

	row_inserted (a_row_number: INTEGER) is
			-- Emits the 'row_inserted' and 'changed' signals on model.
		do
			gda_data_model_row_inserted (handle, a_row_number)
		end

	row_updated  (a_row_number: INTEGER) is
			-- Emits the 'row_updated' and 'changed' signals on model.
		do
			gda_data_model_row_updated (handle, a_row_number)
		end

	row_removed  (a_row_number: INTEGER) is
			-- Emits the 'row_removed' and 'changed' signal on model.
		do
			gda_data_model_row_removed (handle, a_row_number)
		end


	freeze is
			-- Disables notifications of changes on the given data
			-- model. To re-enable notifications again, you should call
			-- the `thaw' feature.
		do
			gda_data_model_freeze (handle)
		end

	thaw is
			-- Re-enables notifications of changes on the given data
			-- model.
		do
			gda_data_model_thaw (handle)
		end

	access_flags: INTEGER is
			-- the attributes of model such as how to access the data it
			-- contains if it's modifiable, etc.
			-- TODO: should be NATURAL
		do
			Result := gda_data_model_get_access_flags (handle)
		ensure valid: are_valid_access_flags (Result)
		end

	count, rows_count: INTEGER is
			-- the number of rows in the data model, or -1 if the number
			-- of rows is not known.
		do
			Result := gda_data_model_get_n_rows (handle)
		end

	columns_count: INTEGER is
			-- the number of columns in the data model.
		do
			Result := gda_data_model_get_n_columns (handle)
		end


	column (a_column_number: INTEGER): GDA_COLUMN is
			-- A description of a given column.
		local ptr: POINTER
		do
			ptr := gda_data_model_describe_column(handle,a_column_number)
			if ptr.is_not_null then
				create Result.from_external_pointer (ptr)
				-- WARNING: the returned GdaColumn object belongs to the
				-- model model and and should not be destroyed; any
				-- modification will impact the whole data model. Hence 
				-- it is made shared
				Result.set_shared
			end
		end

	column_title (a_column_number: INTEGER): STRING is
			-- the title for the given column in a data model object.
		do
			create {CONST_STRING} Result.from_external
			(gda_data_model_get_column_title (handle, a_column_number))
		end

	set_column_title (a_column_number: INTEGER; a_title: STRING) is
			-- Sets the title of the given column in model.
		require title_not_void: a_title /= Void
		do
			gda_data_model_set_column_title (handle, a_column_number, a_title.to_external)
		end	

	attributes_at (a_col_n, a_row_n: INTEGER): INTEGER is
			-- the attributes of the value stored at (`a_row_n',
			-- `a_col_n') in proxy, which is an ORed value of
			-- GValueAttribute flags. As a special case, if `a_row_n' is
			-- -1, then the attributes returned correspond to a "would
			-- be" value if a row was added to model.
			-- TODO: Should be NATURAL
		do
			Result:=gda_data_model_get_attributes_at(handle, a_col_n,a_row_n)
		end

	value_at (a_col_n, a_row_n: INTEGER): G_VALUE is
			-- the data stored in the given position (identified by the
			-- `a_col_n' and `a_row_n' parameters) on a data model.
		
			-- This is the main feature for accessing data in a model.

			-- Note that the returned GValue must not be modified
			-- directly (unexpected behaviours may occur if you do
			-- so). If you want to modify a value stored in a
			-- GdaDataModel, use the `set_value' method.

			-- If `a_row_n' or `a_col_n' are not valid row/column number 
			-- Result will be Void
		local ptr: POINTER
		do
			ptr:=gda_data_model_get_value_at (handle, a_col_n, a_row_n)
			if ptr.is_not_null then 
				create Result.from_external_pointer (ptr)
			end
		end

	set_value_at (a_col_n, a_row_n: INTEGER; a_value: G_VALUE) is
			-- Set `a_value' at (`a_col_n',`a_row_n'). `a_value' can be
			-- Void. `error' and `is_successful' will be updated:
			-- is_successful will be True if the value in the data model
			-- has been updated and no error occurred.
		local value: POINTER
		do
			if a_value /= Void then value:=a_value.handle end
			is_successful:=(gda_data_model_set_value_at
								 (handle, a_col_n, a_row_n, value,
								  address_of (error.handle))).to_boolean
		end

	set_values (a_row_n: INTEGER; some_values: G_LIST[G_VALUE]) is
			-- If any value in values is actually NULL, then it is considered as a
			-- default value. `is_successful' will be True if the value in the data
			-- model has been updated and no error occurred. Otherwise `error' is
			-- updated.
		require
			values_not_void: some_values /= Void
			valid_values_count: some_values.count <= columns_count -- i.e.: values :  a list of GValue, one for each n (<nb_cols) columns of model
		do
			is_successful:=(gda_data_model_set_values
								 (handle, a_row_n,
								  some_values.handle, address_of (error.handle))
								 ).to_boolean
		end

	get_new_iterator: GDA_DATA_MODEL_ITER is
			-- Creates a new iterator object GdaDataModelIter object which can be
			-- used to iterate through rows in model.
		

			-- TODO: 
			-- The row the returned GdaDataModelIter represents is undefined. For
			-- models which can be accessed randomly the correspoding row can be
			-- set using gda_data_model_move_iter_at_row(), and for models which
			-- are accessible sequentially only then the first row will be fetched
			-- using gda_data_model_move_iter_next().
		
			-- It will be Void if an error occurred.
		local ptr: POINTER
		do
			ptr:= gda_data_model_create_iter (handle)
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		end
			
feature {} -- Duplicated iterator features
	
	-- Note: all the following features belongs to and are duplicated into 
	-- GDA_DATA_MODEL_ITER. They shouldn-'t be wrapped here
	--   gda_data_model_move_iter_at_row ()
	
	--  gboolean    gda_data_model_move_iter_at_row (GdaDataModel *model,
	--                                               GdaDataModelIter *iter,
	--                                               gint row);

	--    Sets iter to represent the row row. iter must be a valid iterator object
	--    obtained using the gda_data_model_create_iter() method.

	--    model :   a GdaDataModel object.
	--    iter :    a GdaDataModelIter object
	--    row :     row number.
	--    Returns : TRUE if no error occurred

	--    --------------------------------------------------------------------------

	--   gda_data_model_move_iter_next ()

	--  gboolean    gda_data_model_move_iter_next   (GdaDataModel *model,
	--                                               GdaDataModelIter *iter);

	--    Sets iter to the next available row in model. iter must be a valid
	--    iterator object obtained using the gda_data_model_create_iter() method.

	--    model :   a GdaDataModel object.
	--    iter :    a GdaDataModelIter object
	--    Returns : TRUE if no error occurred

	--    --------------------------------------------------------------------------

	--   gda_data_model_move_iter_prev ()

	--  gboolean    gda_data_model_move_iter_prev   (GdaDataModel *model,
	--                                               GdaDataModelIter *iter);

	--    Sets iter to the previous available row in model. iter must be a valid
	--    iterator object obtained using the gda_data_model_create_iter() method.

	--    model :   a GdaDataModel object.
	--    iter :    a GdaDataModelIter object
	--    Returns : TRUE if no error occurred

	--    --------------------------------------------------------------------------
feature
	appended_row_number: INTEGER
	
	append (some_values: G_LIST [G_VALUE]) is
			-- Appends a row to the given data model. (TODO: wrap and Eiffelize
			-- this: If any value in values is actually NULL, then it is considered
			-- as a default value.)
			-- `appended_row_number' will contains the appended row number.
			-- if an error occurred `error' will be updated and 
			-- `appended_row_number' will be -1.
		require
			values_not_void: some_values /= Void
			correct_values_count: some_values.count = columns_count
		do
			appended_row_number:= (gda_data_model_append_values
										  (handle, some_values.handle,
											address_of (error.handle)))
		end


	append_row is
			-- Appends a row to the data model. `appended_row_number' contains the
			-- number of the added row, or -1 if an error occurred. In that case
			-- `error' is updated.
		do
			appended_row_number:= (gda_data_model_append_row
										  (handle, address_of (error.handle)))
		end

	remove_row (a_row_number: INTEGER) is
			-- Removes a row numbered `a_row_number' from the data model.
			-- `is_successful' and `error' will be updated as necessary.
		do
			is_successful:=(gda_data_model_remove_row
								 (handle, a_row_number, 
								  address_of (error.handle))).to_boolean
		end


	row_from_values (some_values: G_SLIST[G_VALUE]; some_column_indexes: ARRAY[INTEGER]): INTEGER is
			-- the first row where all the values in values at the columns
			-- identified at cols_index match. If the row can't be identified, then
			-- it will be -1; `some_column_indexes' contains the column number to
			-- match each value of values.
		do
			Result := (gda_data_model_get_row_from_values
						  (handle, some_values.handle,
							some_column_indexes.to_external))
		end
	

	--   gda_data_model_send_hint ()
	
	--  void        gda_data_model_send_hint        (GdaDataModel *model,
	--                                               GdaDataModelHint hint,
--                                               const GValue *hint_value);
	
	--    Sends a hint to the data model. The hint may or may not be handled by the
	--    data model, depending on its implementation
	
	--    model :      a GdaDataModel
	--    hint :       a hint to send to the model
	--    hint_value : an optional value to specify the hint, or NULL

	--    --------------------------------------------------------------------------
	
	--   gda_data_model_export_to_string ()

--  gchar*      gda_data_model_export_to_string (GdaDataModel *model,
--                                               GdaDataModelIOFormat format,
--                                               const gint *cols,
--                                               gint nb_cols,
--                                               GdaParameterList *options);

--    Exports data contained in model to a string; the format is specified using
--    the format argument.

--    Specifically, the parameters in the options list can be:

--      o "SEPARATOR": a string value of which the first character is used as a
--        separator in case of CSV export

--      o "NAME": a string value used to name the exported data if the export
--        format is XML

--    model :   a GdaDataModel
--    format :  the format in which to export data
--    cols :    an array containing which columns of model will be exported, or
--              NULL for all columns
--    nb_cols : the number of columns in cols
--    options : list of options for the export
--    Returns : a new string.

--    --------------------------------------------------------------------------

--   gda_data_model_export_to_file ()

--  gboolean    gda_data_model_export_to_file   (GdaDataModel *model,
--                                               GdaDataModelIOFormat format,
--                                               const gchar *file,
--                                               const gint *cols,
--                                               gint nb_cols,
--                                               GdaParameterList *options,
--                                               GError **error);

--    Exports data contained in model to the file file; the format is specified
--    using the format argument.

--    Specifically, the parameters in the options list can be:

--      o "SEPARATOR": a string value of which the first character is used as a
--        separator in case of CSV export

--      o "NAME": a string value used to name the exported data if the export
--        format is XML

--      o "OVERWRITE": a boolean value which tells if the file must be
--        over-written if it already exists.

--    model :   a GdaDataModel
--    format :  the format in which to export data
--    file :    the filename to export to
--    cols :    an array containing which columns of model will be exported, or
--              NULL for all columns
--    nb_cols : the number of columns in cols
--    options : list of options for the export
--    error :   a place to store errors, or NULL
--    Returns : TRUE if no error occurred

--    --------------------------------------------------------------------------

--   gda_data_model_add_data_from_xml_node ()

--  gboolean    gda_data_model_add_data_from_xml_node
--                                              (GdaDataModel *model,
--                                               xmlNodePtr node,
--                                               GError **error);

--    Adds the data from a XML node to the given data model (see the DTD for
--    that node in the $prefix/share/libgda/dtd/libgda-array.dtd file).

--    model :   a GdaDataModel.
--    node :    a XML node representing a <gda_array_data> XML node.
--    error :
--    Returns : TRUE if successful, FALSE otherwise.

--    --------------------------------------------------------------------------

--   gda_data_model_import_from_model ()

--  gboolean    gda_data_model_import_from_model
--                                              (GdaDataModel *to,
--                                               GdaDataModel *from,
--                                               GHashTable *cols_trans,
--                                               GError **error);

--    Copy the contents of the from data model to the to data model. The copy
--    stops as soon as an error orrurs.

--    The cols_trans is a hash table for which keys are to columns numbers and
--    the values are the corresponding column numbers in the from data model. To
--    set the values of a column in to to NULL, create an entry in the hash
--    table with a negative value.

--    to :         the destination GdaDataModel
--    from :       the source GdaDataModel
--    cols_trans : a GHashTable for columns translating, or NULL
--    error :      a place to store errors, or NULL
--    Returns :    TRUE if no error occurred.

--    --------------------------------------------------------------------------

--   gda_data_model_import_from_string ()

--  gboolean    gda_data_model_import_from_string
--                                              (GdaDataModel *model,
--                                               const gchar *string,
--                                               GHashTable *cols_trans,
--                                               GdaParameterList *options,
--                                               GError **error);

--    Loads the data from string into model.

--    model :      a GdaDataModel
--    string :     the string to import data from
--    cols_trans : a hash table containing which columns of model will be
--                 imported, or NULL for all columns
--    options :    list of options for the export
--    error :      a place to store errors, or NULL
--    Returns :    TRUE if no error occurred.

--    --------------------------------------------------------------------------

--   gda_data_model_import_from_file ()

--  gboolean    gda_data_model_import_from_file (GdaDataModel *model,
--                                               const gchar *file,
--                                               GHashTable *cols_trans,
--                                               GdaParameterList *options,
--                                               GError **error);

--    Imports data contained in the file file into model; the format is
--    detected.

--    model :      a GdaDataModel
--    file :       the filename to export to
--    cols_trans :
--    options :    list of options for the export
--    error :      a place to store errors, or NULL
--    Returns :    TRUE if no error occurred

--    --------------------------------------------------------------------------

--   gda_data_model_dump ()

--  void        gda_data_model_dump             (GdaDataModel *model,
--                                               FILE *to_stream);

--    Dumps a textual representation of the model to the to_stream stream

--    model :     a GdaDataModel.
--    to_stream : where to dump the data model

--    --------------------------------------------------------------------------

--   gda_data_model_dump_as_string ()

--  gchar*      gda_data_model_dump_as_string   (GdaDataModel *model);

--    Dumps a textual representation of the model into a new string

--    model :   a GdaDataModel.
--    Returns : a new string.

																 -- Signals
																 

--  "row-inserted"
--              void        user_function      (GdaDataModel *gdadatamodel,
--                                              gint          arg1,
--                                              gpointer      user_data)         : Run last
--  "row-removed"
--              void        user_function      (GdaDataModel *gdadatamodel,
--                                              gint          arg1,
--                                              gpointer      user_data)         : Run last
--  "row-updated"
--              void        user_function      (GdaDataModel *gdadatamodel,
--                                              gint          arg1,
--                                              gpointer      user_data)         : Run last

-- Signal Details

--   The "row-inserted" signal

--  void        user_function                  (GdaDataModel *gdadatamodel,
--                                              gint          arg1,
--                                              gpointer      user_data)         : Run last

--    gdadatamodel : the object which received the signal.
--    arg1 :
--    user_data :    user data set when the signal handler was connected.

--    --------------------------------------------------------------------------

--   The "row-removed" signal

--  void        user_function                  (GdaDataModel *gdadatamodel,
--                                              gint          arg1,
--                                              gpointer      user_data)         : Run last

--    gdadatamodel : the object which received the signal.
--    arg1 :
--    user_data :    user data set when the signal handler was connected.

--    --------------------------------------------------------------------------

--   The "row-updated" signal

--  void        user_function                  (GdaDataModel *gdadatamodel,
--                                              gint          arg1,
--                                              gpointer      user_data)         : Run last

--    gdadatamodel : the object which received the signal.
--    arg1 :
--    user_data :    user data set when the signal handler was connected.
end -- class GDA_DATA_MODEL
