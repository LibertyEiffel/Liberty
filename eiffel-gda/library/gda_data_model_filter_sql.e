indexing
	description: "GdaDataModelFilterSQL -- Filtering data from one or several GdaDataModel objects."
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

class GDA_DATA_MODEL_FILTER_SQL

inherit GDA_DATA_MODEL_FILTER_SQL

insert GDA_DATA_MODEL_FILTER_SQL_EXTERNALS

creation make, from_external_pointer

feature {} -- Creation


Object Hierarchy


   GObject
    +----GdaObject
          +----GdaDataModelRow
                +----GdaDataModelArray
                      +----GdaDataModelFilterSQL

Implemented Interfaces

   GdaDataModelFilterSQL implements GdaDataModel.

Description

   The GdaDataModelFilterSQL object implements simple SQL "SELECT" queries
   accessing data stored in various GdaDataModel objects which it is
   instructed to use.

Details

  GdaDataModelFilterSQL

 typedef struct _GdaDataModelFilterSQL GdaDataModelFilterSQL;

   --------------------------------------------------------------------------

  gda_data_model_filter_sql_new ()

 GdaDataModel* gda_data_model_filter_sql_new (void);

   Creates a new GdaDataModelFilterSQL object, which allows programs to
   filter GdaDataModel's based on a given SQL SELECT command.

   A GdaDataModelFilterSQL is just another GdaDataModel-based class, so it
   can be used in the same way any other data model class is.

   Returns : the newly created object.

   --------------------------------------------------------------------------

  gda_data_model_filter_sql_add_source ()

 void        gda_data_model_filter_sql_add_source
                                             (GdaDataModelFilterSQL *sel,
                                              const gchar *name,
                                              GdaDataModel *source);

   Adds a data model as a source of data for the GdaDataModelFilterSQL
   object. When the select object is run (via gda_data_model_filter_sql_run),
   it will parse the SQL and get the required data from the source data
   models.

   sel :    a GdaDataModelFilterSQL object.
   name :   name to identify the data model (usually a table name).
   source : a GdaDataModel from which to get data.

   --------------------------------------------------------------------------

  gda_data_model_filter_sql_set_sql ()

 void        gda_data_model_filter_sql_set_sql
                                             (GdaDataModelFilterSQL *sel,
                                              const gchar *sql);

   Sets the SQL command to be used on the given GdaDataModelFilterSQL object
   for filtering rows from the source data model (which is set with
   gda_data_model_filter_sql_set_source).

   sel : a GdaDataModelFilterSQL object.
   sql : the SQL command to be used for filtering rows.

   --------------------------------------------------------------------------

  gda_data_model_filter_sql_run ()

 gboolean    gda_data_model_filter_sql_run   (GdaDataModelFilterSQL *sel);

   Runs the query and fills in the GdaDataModelFilterSQL object with the rows
   that matched the SQL command (which can be set with
   gda_data_model_filter_sql_set_sql) associated with this
   GdaDataModelFilterSQL object.

   After calling this function, if everything is successful, the
   GdaDataModelFilterSQL object will contain the matched rows, which can then
   be accessed like a normal GdaDataModel.

   sel :     a GdaDataModelFilterSQL object.
   Returns : TRUE if successful, FALSE if there was an error.

end -- class  GDA_DATA_MODEL_FILTER_SQL
