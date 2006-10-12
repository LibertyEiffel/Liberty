indexing
	description: "GdaDataModelQuery: An implementation of GdaDataModel based on a SELECT query."
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

			-- Description: The GdaDataModelQuery data model simply stores the
			-- values returned by a SELECT query. The connection used to execute
			-- the SELECT query (given when the object is constructed) is the same
			-- as the one provided th the GdaDict object to which the query
			-- relates.
			
class GDA_DATA_MODEL_QUERY

inherit
	GDA_OBJECT
	GDA_DATA_MODEL
		-- GdaDataModelQuery implements GdaDataModel.
	
insert
	GDA_DATA_MODEL_EXTERNALS
	SHARED_G_ERROR
	
creation make, from_external_pointer

feature {} -- Creation

	from_query (a_query: GDA_QUERY) is
			-- Creates a new GdaDataModel object using the data returned by the
			-- execution of the query SELECT query.
		require
			query_not_void: a_query /= Void
			select_query: -- TODO: a_query should be a SELECT query
		do
			from_external_pointer(gda_data_model_query_new(a_query.handle))
		end

feature
	parameters: GDA_PARAMETER_LIST is
			--  The parameters eventually required to execute the SELECT query used in
			--  the model data model. Void if no parameters are needed.
		local ptr: POINTER
		do
			ptr:=gda_data_model_query_get_param_list(handle)
			if ptr.is_not_null then
				create Result.from_external_pointer(ptr)
			end
		end
	
	refresh is
			-- (Re)-runs the SELECT query to update the contents of model
		
			--    model :   a GdaDataModelQuery data model
			--    error :   a place to store errors, or NULL
			--    Returns : TRUE if no error occurred
		do
			is_successful:=(gda_data_model_query_refresh
								 (handle, address_of (error.handle))).to_boolean
		end
	
--   gda_data_model_query_set_modification_query ()

--  gboolean    gda_data_model_query_set_modification_query
--                                              (GdaDataModelQuery *model,
--                                               const gchar *query,
--                                               GError **error);

--    Sets the modification query to be used by model to actually perform any
--    change to the dataset in the database.

--    The provided query (the query SQL) must be either a INSERT, UPDATE or
--    DELETE query. It can contain parameters, and the parameters named
--    '[+-]<num>' will be replaced when the query is run:

--      o a parameter named +<num> will take the new value set at the <num>th
--        column in model

--      o a parameter named -<num> will take the old value set at the <num>th
--        column in model

--    Please note that the "+0" and "-0" parameters names are valid and will
--    respectively take the new and old values of the first column of model.

--    Examples of queries are: "INSERT INTO orders (customer, creation_date,
--    delivery_before, delivery_date) VALUES (## [:name="Customer"
--    :type="integer"], date('now'), ## [:name="+2" :type="date"
--    :nullok="TRUE"], NULL)", "DELETE FROM orders WHERE id = ## [:name="-0"
--    :type="integer"]" and "UPDATE orders set id=## [:name="+0"
--    :type="integer"], delivery_before=## [:name="+2" :type="date"
--    :nullok="TRUE"], delivery_date=## [:name="+3" :type="date" :nullok="TRUE"]
--    WHERE id=## [:name="-0" :type="integer"]"

--    model :   a GdaDataModelQuery data model
--    query :   the SQL code for a query
--    error :   a place to store errors, or NULL
--    Returns : TRUE if no error occurred.

-- Properties


--    "delete-query"         gpointer              : Read / Write
--    "insert-query"         gpointer              : Read / Write
--    "query"                gpointer              : Read / Write / Construct Only
--    "update-query"         gpointer              : Read / Write

-- Property Details

--   The "delete-query" property

--    "delete-query"         gpointer              : Read / Write

--    DELETE Query to be executed to remove data.

--    --------------------------------------------------------------------------

--   The "insert-query" property

--    "insert-query"         gpointer              : Read / Write

--    INSERT Query to be executed to add data.

--    --------------------------------------------------------------------------

--   The "query" property

--    "query"                gpointer              : Read / Write / Construct Only

--    SELECT Query to be executed to populate the model with data.

--    --------------------------------------------------------------------------

--   The "update-query" property

--    "update-query"         gpointer              : Read / Write

--    UPDATE Query to be executed to update data.

end -- class GDA_DATA_MODEL_QUERY
