indexing
	description: "GdaDataModelQuery an implementation of GdaDataModel based on a SELECT"
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

class GDA_DATA_MODEL_QUERY
	-- The GdaDataModelQuery data model simply stores the values
	-- returned by a SELECT query. The connection used to execute the
	-- SELECT query (given when the object is constructed) is the same
	-- as the one provided th the GdaDict object to which the query
	-- relates.

inherit GDA_DATA_MODEL

creation from_external_pointer

feature {} -- Creation
		
	--  gda_data_model_query_new ()
	--
	-- GdaDataModel*       gda_data_model_query_new            (GdaQuery *query);
	--
	--   Creates a new GdaDataModel object using the data returned by the execution
	--   of the query SELECT query.
	--
	--   query :   a SELECT query
	--   Returns : a pointer to the newly created GdaDataModel.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_query_get_parameter_list ()
	--
	-- GdaParameterList*   gda_data_model_query_get_parameter_list
	--                                                         (GdaDataModelQuery *model);
	--
	--   If some parameters are required to execute the SELECT query used in the
	--   model data model, then returns the GdaParameterList used; otherwise does
	--   nothing and returns NULL.
	--
	--   model :   a GdaDataModelQuery data model
	--   Returns : a GdaParameterList object, or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_query_refresh ()
	--
	-- gboolean            gda_data_model_query_refresh        (GdaDataModelQuery *model,
	--                                                          GError **error);
	--
	--   (Re)-runs the SELECT query to update the contents of model
	--
	--   model :   a GdaDataModelQuery data model
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_query_set_modification_query ()
	--
	-- gboolean            gda_data_model_query_set_modification_query
	--                                                         (GdaDataModelQuery *model,
	--                                                          const gchar *query,
	--                                                          GError **error);
	--
	--   Sets the modification query to be used by model to actually perform any
	--   change to the dataset in the database.
	--
	--   The provided query (the query SQL) must be either a INSERT, UPDATE or
	--   DELETE query. It can contain parameters, and the parameters named
	--   '[+-]<num>' will be replaced when the query is run:
	--
	--     o a parameter named +<num> will take the new value set at the <num>th
	--       column in model
	--
	--     o a parameter named -<num> will take the old value set at the <num>th
	--       column in model
	--
	--   Please note that the "+0" and "-0" parameters names are valid and will
	--   respectively take the new and old values of the first column of model.
	--
	--   Examples of queries are: "INSERT INTO orders (customer, creation_date,
	--   delivery_before, delivery_date) VALUES (## / *name:'Customer'
	--   type:integer* /, date('now'), ## / *name:"+2" type:date nullok:TRUE * /,
	--   NULL)", "DELETE FROM orders WHERE id = ## / *name:"-0" type:integer* /"
	--   and "UPDATE orders set id=## / *name:"+0" type:integer* /,
	--   delivery_before=## / *name:"+2" type:date nullok:TRUE* /, delivery_date=##
	--   / *name:"+3" type:date nullok:TRUE* / WHERE id=## / *name:"-0"
	--   type:integer* /"
	--
	--   model :   a GdaDataModelQuery data model
	--   query :   the SQL code for a query
	--   error :   a place to store errors, or NULL
	--   Returns : TRUE if no error occurred.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_data_model_query_compute_modification_queries ()
	--
	-- gboolean            gda_data_model_query_compute_modification_queries
	--                                                         (GdaDataModelQuery *model,
	--                                                          const gchar *target,
	--                                                          GdaDataModelQueryOptions options,
	--                                                          GError **error);
	--
	--   Try to compute the INSERT, DELETE and UPDATE queries; any previous
	--   modification query will be discarded.
	--
	--   If specified, the table which will be updated is the one represented by
	--   the target.
	--
	--   If target is NULL, then an error will be returned if model's SELECT query
	--   has more than one target.
	--
	--   model :   a GdaDataModelQuery object
	--   target :  the target table to modify, or NULL
	--   options : options to specify how the queries must be built in some special
	--             cases
	--   error :   a place to store errors or NULL
	--   Returns : TRUE if the INSERT, DELETE and UPDATE queries have been
	--             computed.
	--


	
	--
	--Properties
	--
	--
	--   "delete-query"             GdaQuery              : Read / Write
	--   "insert-query"             GdaQuery              : Read / Write
	--   "query"                    GdaQuery              : Read / Write / Construct Only
	--   "update-query"             GdaQuery              : Read / Write
	--   "use-transaction"          gboolean              : Read / Write / Construct
	--Property Details
	--
	--  The "delete-query" property
	--
	--   "delete-query"             GdaQuery              : Read / Write
	--
	--   DELETE Query to be executed to remove data.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "insert-query" property
	--
	--   "insert-query"             GdaQuery              : Read / Write
	--
	--   INSERT Query to be executed to add data.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "query" property
	--
	--   "query"                    GdaQuery              : Read / Write / Construct Only
	--
	--   SELECT Query to be executed to populate the model with data.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "update-query" property
	--
	--   "update-query"             GdaQuery              : Read / Write
	--
	--   UPDATE Query to be executed to update data.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "use-transaction" property
	--
	--   "use-transaction"          gboolean              : Read / Write / Construct
	--
	--   Run modification queries within a transaction.
	--
	--   Default value: FALSE

feature {} -- External calls
	--                     GdaDataModelQuery;
	--                     GdaDataModelQueryClass;
	--                     GdaDataModelQueryPrivate;
	-- GdaDataModel*       gda_data_model_query_new            (GdaQuery *query);
	-- GdaParameterList*   gda_data_model_query_get_parameter_list
	--                                                         (GdaDataModelQuery *model);
	-- gboolean            gda_data_model_query_refresh        (GdaDataModelQuery *model,
	--                                                          GError **error);
	-- gboolean            gda_data_model_query_set_modification_query
	--                                                         (GdaDataModelQuery *model,
	--                                                          const gchar *query,
	--                                                          GError **error);
	-- gboolean            gda_data_model_query_compute_modification_queries
	--                                                         (GdaDataModelQuery *model,
	--                                                          const gchar *target,
	--                                                          GdaDataModelQueryOptions options,
	--                                                          GError **error);
	--
	--
feature -- Various
	dummy_gobject: POINTER is do unimplemented end

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataModelQuery)"
		end

end -- class GDA_DATA_MODEL_QUERY
