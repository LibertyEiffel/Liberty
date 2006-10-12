   Link: GNOME Data Access manual (start)
   Link: Data handling (parent)
   Link: GdaDataModelQuery (previous)
   Link: GdaDataProxy (next)
   Link: Part I. Getting started (part)
   Link: Introduction (chapter)
   Link: libgda architecture (chapter)
   Link: Installation (chapter)
   Link: Examples (chapter)
   Link: Migration from older versions (chapter)
   Link: Part II. Client API Reference (part)
   Link: Object Hierarchy (chapter)
   Link: Initialization and configuration (chapter)
   Link: Connections & commands (chapter)
   Link: Data handling (chapter)
   Link: Data conversions (chapter)
   Link: Dictionary and related objects (chapter)
   Link: Data manipulation (DML) queries (chapter)
   Link: Data definition (DDL) queries (chapter)
   Link: Miscellaneous (chapter)
   Link: Graphs (chapter)
   Link: List of lesser used interfaces (chapter)
   Link: Part III. GDA Tools (part)
   Link: Introduction (chapter)
   Link: gda-list-config (chapter)
   Link: gda-test-connection (chapter)
   Link: gda-diagnose (chapter)
   Link: gda-author-dict-file (chapter)
   Link: gda-inspect-dict-file (chapter)
   Link: Part IV. Databases access providers (part)
   Link: Introduction (chapter)
   Link: Virtual methods for providers (chapter)
   Link: Virtual methods for recordsets (chapter)
   Link: Part V. GDA Report Engine (part)
   Link: Introduction (chapter)
   Link: API reference (chapter)
   Link: Appendix A. GNU Free Documentation License (appendix)
   Link: Index (index)

   Prev Up Home                 GNOME Data Access manual                 Next
   Top  |  Description  |  Object Hierarchy

   GdaDataModelFilterSQL

   GdaDataModelFilterSQL -- Filtering data from one or several GdaDataModel
   objects

Synopsis




             GdaDataModelFilterSQL;
 GdaDataModel* gda_data_model_filter_sql_new (void);
 void        gda_data_model_filter_sql_add_source
                                             (GdaDataModelFilterSQL *sel,
                                              const gchar *name,
                                              GdaDataModel *source);
 void        gda_data_model_filter_sql_set_sql
                                             (GdaDataModelFilterSQL *sel,
                                              const gchar *sql);
 gboolean    gda_data_model_filter_sql_run   (GdaDataModelFilterSQL *sel);


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

References

   Visible links
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/index.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/data_models.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelQuery.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataProxy.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/part_begin.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/introduction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/architecture.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/installation.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/getting_started.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/migration.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/part_libgda_api.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch06.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/init_config.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/connection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/data_models.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/data_conv.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch11.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch12.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch13.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/misc.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch15.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ch16.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/part_tools.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-introduction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-list-config.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-test-connection.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-diagnose.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-author-dict.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-tools-inspect-dict.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/part_providers.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-provider-introduction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-provider-class.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-provider-recordset.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/part_libgda-reports.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-reports-introduction.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/libgda-reports.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/fdl.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/ix01.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelQuery.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/data_models.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/index.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataProxy.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html#top_of_page
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html#desc
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html#object_hierarchy
   . GdaDataModel
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModel.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html#GdaDataModelFilterSQL-struct
   . GdaDataModel
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModel.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html#gda-data-model-filter-sql-new
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html#gda-data-model-filter-sql-add-source
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModel
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModel.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html#gda-data-model-filter-sql-set-sql
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html#gda-data-model-filter-sql-run
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaObject
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaObject.html
   . GdaDataModelRow
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelRow.html
   . GdaDataModelArray
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelArray.html
   . GdaDataModel
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModel.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModel
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModel.html
   . GdaDataModel
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModel.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModel
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModel.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModel
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModel.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html#gda-data-model-filter-sql-run
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModel
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModel.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html#gda-data-model-filter-sql-set-sql
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
   . GdaDataModel
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModel.html
   . GdaDataModelFilterSQL
	file:///home/paolo/src/libgda-1.9.103/doc/C/html/GdaDataModelFilterSQL.html
