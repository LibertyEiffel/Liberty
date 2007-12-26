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

class GDA_DATA_MODEL_IMPORT
	--   GdaDataModelImport -- Importing data from a string or a file

	-- The GdaDataModelImport data model imports data from a string or
	-- a file.  The data can either be in a CSV (comma separated
	-- values) format or in an XML format as described by the
	-- libgda-array.dtd DTD (as a side way it is also possible to
	-- import data from an already-build XML tree validated against
	-- that DTD).

	-- The caller must decide, upon construction, if the new
	-- GdaDataModelImport must support random access or simply a cursor
	-- based access. Random acces makes it easier to use the resulting
	-- data model but consumes more memory as all the data is copied in
	-- memory, and is thus not suitable for large data sets. Note that
	-- importing from an already-build XML tree will always result in a
	-- random access data model.

	-- Various import options can be specified using parameters in a
	-- GdaParameterList object. The available options depend on the
	-- format of the imported data listed here:

	-- o "SEPARATOR" (string, CVS import only): specifies the separator
	--   to consider

	-- o "ESCAPE_CHAR" (string, CVS import only): specifies the
	--   character used to "escape" the strings contained between two
	--   separators

	-- o "ENCODING" (string, CVS import only): specifies the character
	--   set used in the imported data

	-- o "TITLE_AS_FIRST_LINE" (boolean, CVS import only): TRUE to
	--   specify that the first line of the imported data contains the
	--   column names

	-- o "GDA_TYPE_<col number>" (gda type, CVS import only): specifies
	--   the requested GDA type for the column numbered "col number"

	-- o "DBMS_TYPE_<col number>" (string, CVS import only): specifies
	--   the requested DBMS type for the column numbered "col number";
	--   if the DBMS type is listed in the dictionary used by the
	--   created model, then the GDA type is set in accordance

inherit 
	GDA_OBJECT
	GDA_DATA_MODEL

creation from_external_pointer

feature {} -- Creation

	--  gda_data_model_import_new_file ()
	--
	-- GdaDataModel*       gda_data_model_import_new_file      (const gchar *filename,
	--                                                          gboolean random_access,
	--                                                          GdaParameterList *options);
	--
	--   Creates a new GdaDataModel object which contains the data stored within
	--   the filename file.
	--
	--   The options are the following ones:
	--
	--     o For the CSV format:
	--
	--          o ENCODING (string): specifies the encoding of the data in the file
	--
	--          o SEPARATOR (string): specifies the CSV separator
	--
	--          o ESCAPE_CHAR (string): specifies the character used to "escape"
	--
	--          o TITLE_AS_FIRST_LINE (boolean): consider that the first line of
	--            the file contains columns' titles
	--
	--          o DBMS_TYPE_<column number> (string): specifies the type of value
	--            expected in column <column number>
	--
	--     o Other formats: no option
	--
	--   filename :      the file to import data from
	--   random_access : TRUE if random access will be required
	--   options :       list of importing options
	--   Returns :       a pointer to the newly created GdaDataModel.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_import_new_mem ()
	--
	-- GdaDataModel*       gda_data_model_import_new_mem       (const gchar *data,
	--                                                          gboolean random_access,
	--                                                          GdaParameterList *options);
	--
	--   Creates a new GdaDataModel object which contains the data stored in the
	--   data string.
	--
	--   Important note: the data string is not copied for memory efficiency
	--   reasons and should not therefore be altered in any way as long as the
	--   returned data model exists.
	--
	--   data :          a string containng the data to import
	--   random_access : TRUE if random access will be required
	--   options :       list of importing options, see
	--                   gda_data_model_import_new_file() for more information
	--   Returns :       a pointer to the newly created GdaDataModel.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_import_new_xml_node ()
	--
	-- GdaDataModel*       gda_data_model_import_new_xml_node  (xmlNodePtr node);
	--
	--   Creates a new GdaDataModel and loads the data in node. The resulting data
	--   model can be accessed in a random way.
	--
	--   node :    an XML node corresponding to a <data-array> tag
	--   Returns : a pointer to the newly created GdaDataModel.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_import_get_errors ()
	--
	-- GSList*             gda_data_model_import_get_errors    (GdaDataModelImport *model);
	--
	--   Get the list of errors which model has to report. The returned list is a
	--   list of GError structures, and must not be modified
	--
	--   model :   a GdaDataModelImport object
	--   Returns : the list of errors (which must not be modified), or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_import_clean_errors ()
	--
	-- void                gda_data_model_import_clean_errors  (GdaDataModelImport *model);
	--
	--   Clears the history of errors model has to report
	--
	--   model : a GdaDataModelImport object
	--
	--Properties
	--
	--
	--   "data-string"              gchararray            : Read / Write / Construct Only
	--   "filename"                 gchararray            : Read / Write / Construct Only
	--   "options"                  GdaParameterList      : Read / Write / Construct Only
	--   "random-access"            gboolean              : Read / Write / Construct Only
	--   "xml-node"                 gpointer              : Read / Write / Construct Only
	--Property Details
	--
	--  The "data-string" property
	--
	--   "data-string"              gchararray            : Read / Write / Construct Only
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "filename" property
	--
	--   "filename"                 gchararray            : Read / Write / Construct Only
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "options" property
	--
	--   "options"                  GdaParameterList      : Read / Write / Construct Only
	--
	--   --------------------------------------------------------------------------
	--
	--  The "random-access" property
	--
	--   "random-access"            gboolean              : Read / Write / Construct Only
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "xml-node" property
	--
	--   "xml-node"                 gpointer              : Read / Write / Construct Only

feature
	dummy_gobject: POINTER is do unimplemented end

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataModelImport)"
		end

feature {}	
	-- GdaDataModel*       gda_data_model_import_new_file      (const gchar *filename,
	--                                                          gboolean random_access,
	--                                                          GdaParameterList *options);
	-- GdaDataModel*       gda_data_model_import_new_mem       (const gchar *data,
	--                                                          gboolean random_access,
	--                                                          GdaParameterList *options);
	-- GdaDataModel*       gda_data_model_import_new_xml_node  (xmlNodePtr node);
	-- GSList*             gda_data_model_import_get_errors    (GdaDataModelImport *model);
	-- void                gda_data_model_import_clean_errors  (GdaDataModelImport *model);
	--
end -- class GDA_DATA_MODEL_IMPORT
