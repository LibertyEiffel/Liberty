indexing
	description: "GdaQuery -- Represents any kind of DML query."
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

class GDA_QUERY
	-- Any query (which can be of any type, see the GDA_QUERY_TYPE
	-- enum) can be represented by a GDA_QUERY object. Also a query may
	-- require some parameters to be provided before in can be
	-- executed; each parameter is then represented by a GDA_PARAMETER
	-- object, and parameters required for a query are organised within
	-- a GDA_PARAMETER_LIST object.

inherit 
	GDA_QUERY_OBJECT redefine struct_size end
		-- TODO: GdaQuery implements GdaXmlStorage, GdaReferer,
		-- GdaRenderer and GdaEntity.
	GDA_ENTITY

insert 
	GDA_QUERY_TYPE
	GDA_QUERY_FIELD_STATE	

creation from_external_pointer

feature {} -- Creation
	make (a_dictionary: GDA_DICT) is
			-- Creates a new GdaQuery object from a
		require dictionary_not_void: a_dictionary/=Void
		do
			from_external_pointer(gda_query_new(a_dictionary.handle))
		end

	--TODO: copy_with_replacement (another: GDA_QUERY; some_replacements: G_HASH_TABLE) is
	-- do			from_external_pointer(gda_query_new_copy                  (GdaQuery *orig,
	--                                                          GHashTable *replacements);
	--
	--   Copy constructor
	--
	--   orig :         a GdaQuery to make a copy of
	--   replacements : a hash table to store replacements, or NULL
	--   Returns :      a the new copy of orig


	from_sql (a_dictionary: GDA_DICT; some_sql: STRING) is
			-- Creates a new GdaQuery object and fills its structure by
			-- parsing the `some_sql'. If the parsing failed, then the
			-- returned query is of type GDA_QUERY_TYPE_NON_PARSED_SQL.

			-- To be parsed successfully, the expected SQL must respect
			-- the SQL standard; some extensions have been added to be
			-- able to define variables within the SQL statement. See the
			-- introduction to the GdaQuery for more information.
			
			-- `error' is updated and set only if the SQL statement
			-- parsing produced an error.
		require
			dictionary_not_void: a_dictionary/=Void
			sql_not_void: some_sql/=Void
		do
			from_external_pointer(gda_query_new_from_sql
										 (a_dictionary.handle,some_sql.to_external,
										  address_of(error.handle)))
		end

feature 
	set_query_type (a_type: INTEGER) is
			-- Sets the type of query
		require is_valid_query_type(a_type)
		do
			gda_query_set_query_type(handle,a_type)
		end

	query_type: INTEGER is
			-- the type of query
		do
			Result:=gda_query_get_query_type(handle)
		end

	query_type_as_string: CONST_STRING is
			-- The type of a query as a human readable string.
		do
			create Result.from_external(gda_query_get_query_type_string(handle))
		end

	is_select_query: BOOLEAN is
			-- Is Current query a SELECTION query (a simple SELECT,
			-- UNION, INTERSECT or EXCEPT)?
		do
			Result:=gda_query_is_select_query(handle).to_boolean
		end

	is_insert_query: BOOLEAN is
			--   Tells if query is a INSERT query.	
		do
			Result:=gda_query_is_insert_query(handle).to_boolean
		end	

	is_update_query: BOOLEAN is
			-- Is query a UPDATE query?
		do
			Result:=gda_query_is_update_query(handle).to_boolean
		end

	is_delete_query: BOOLEAN is
			-- Is Current query a DELETE query?
		do
			Result:=gda_query_is_delete_query(handle).to_boolean
		end

	is_well_formed (a_context: GDA_PARAMETER_LIST): BOOLEAN is
			-- Is Current query well formed? If `a_context' is not Void,
			-- it also tells if rendering to SQL can be done without
			-- error. `error' is updated.
		do
			Result:=(gda_query_is_well_formed(handle,null_or(a_context),
														 address_of(error.handle)).to_boolean)
		end

	set_sql_text (an_sql: STRING) is
			-- Defines query's contents from an SQL statement. The SQL
			-- text is parsed and the internal query structured is built
			-- from that; the query type is also set. If the SQL text
			-- cannot be parsed, then the internal structure of the query
			-- is emptied and the query type is set to
			-- GDA_QUERY_TYPE_NON_PARSED_SQL.

			-- To be parsed successfully, the expected SQL must respect
			-- the SQL standard; some extensions have been added to be
			-- able to define variables within the SQL statement. See the
			-- introduction to the GdaQuery for more information.
		
			-- `error' is updated.
		require sql_not_void: an_sql/=Void
		do
			gda_query_set_sql_text(handle, an_sql.to_external, address_of(error.handle))
		end	

	sql_text: CONST_STRING is
			-- A new string representing the SQL version of the query.
			
			-- WARNING: the returned SQL statement may contain some
			-- extensions which allow for the definition of variables
			-- (see the introduction to the GdaQuery for more
			-- information). As such the returned SQL cannot be executed
			-- as it may provoque errors. To get an executable statement,
			-- use the GdaRenderer interface's methods.
		do
			create Result.from_external(gda_query_get_sql_text(handle))
		end

	parameters: G_OBJECT_SLIST[GDA_PARAMETER] is
			-- A list of parameters which the query accepts.
		do
			create Result.from_external_pointer(gda_query_get_parameters(handle))
			-- TODO: the list and objects contained must be freed by the
			-- caller
			Result.set_unshared
			Result.set_shared_items(False)
		end

	parameter_list: GDA_PARAMETER_LIST is
			-- A list of parameters which the query accepts like
			-- `parameters'; this feature can be directly used as an
			-- argument to the `execute' method.  Void when the query
			-- does not accept any parameter.
		local p: POINTER
		do
			p:=gda_query_get_parameter_list(handle)
			if p.is_not_null then 
				create Result.from_external_pointer(p) 
			end
		end

	execute (some_parameters: GDA_PARAMETER_LIST; iter_model_only_requested: BOOLEAN) is
			-- Executes query; Result is GDA_DATA_MODEL if query's
			-- execution yields to a data set, or a GDA_PARAMETER_LIST
			-- object otherwise; Void if an error occurred. Use ?:= operator 

			
			-- For more information about the returned value, see
			-- GDA_SERVER_PROVIDER.`execute_command'.
		
			-- `some_parameters' can be obtained using an `parameter_list'.

			-- `iter_model_only_requested' : set to TRUE if the returned
			-- data model will only be accessed using an iterator.

			-- `error' is updated
		do
			from_external_pointer(gda_query_execute
										 (handle, null_or(some_parameters),
										  iter_model_only_requested.to_integer,
										  address_of(error.handle)))
		end

	parent_query: GDA_QUERY is
			-- the parent query, or Void if query does not have any
			-- parent.
		local factory: G_OBJECT_EXPANDED_FACTORY[GDA_QUERY]; ptr: POINTER
		do
			ptr:=gda_query_get_parent_query(handle)
			if ptr.is_not_null then Result:=factory.wrapper(ptr) end
		end

	field_by_ref_field (a_ref_field: GDA_ENTITY_FIELD; a_field_state: INTEGER; a_target: GDA_QUERY_TARGET): GDA_QUERY_FIELD is
			-- The first GdaQueryField object in query which represents
			-- `a_ref_field'; can be Void.

			-- The returned object will be a GdaQueryFieldField object
			-- which represents `a_ref_field'. (TODO: the documentation
			-- is unclear about the type of the returned C object.
			-- Please inquire the developers of GDA for further
			-- informations).
		
			-- If `a_target' is specified (i.e. not Void), then the
			-- returned field will be linked to that GdaQueryTarget
			-- object.
	
			-- `a_field_state' tells about the status of the requested
			-- field, see GdaQueryFieldState. 
		require 
			field_not_void: a_ref_field/=Void
			valid_field_state: is_valid_field_state(a_field_state)
		local p: POINTER; f: G_OBJECT_EXPANDED_FACTORY[GDA_QUERY_FIELD]
		do
			p:=(gda_query_get_field_by_ref_field(handle, null_or(a_target),
															 a_ref_field.handle,
															 a_field_state))
			if p.is_not_null then 
				Result:=f.existant_wrapper(p)
				if Result=Void then 
					create Result.from_external_pointer(p)
				end
			end
		end

	field_by_param_name (a_name: STRING): GDA_QUERY_FIELD is
			-- The field with `a_name'. Can be Void
		require name_not_void: a_name/=Void
		local p: POINTER; f:  G_OBJECT_EXPANDED_FACTORY[GDA_QUERY_FIELD]
		do
			p:=gda_query_get_field_by_param_name(handle,a_name.to_external)
			if p.is_not_null then
				Result:=f.existant_wrapper(p)
				if Result=Void then 
					create Result.from_external_pointer(p)
				end
			end
		end

	first_field_for_target (a_target: GDA_QUERY_TARGET): GDA_QUERY_FIELD is
			-- The first occurence of a GdaQueryFieldField object whose
			-- target is `a_target' in query
		require target_not_void: a_target/=Void
		local p: POINTER; f:  G_OBJECT_EXPANDED_FACTORY[GDA_QUERY_FIELD]
		do
			p:=gda_query_get_first_field_for_target(handle,a_target.handle)
			if p.is_not_null then
				Result:=f.existant_wrapper(p)
				if Result=Void then 
					create Result.from_external_pointer(p)
				end
			end
		end

	sub_queries: G_OBJECT_SLIST[GDA_QUERY] is
			-- A new copy of a list with all the sub-queries managed by
			-- Current query.
		do
			create Result.from_external_pointer(gda_query_get_sub_queries(handle))
		end	
		
	add_param_source (a_parameter_source: GDA_DATA_MODEL) is 
			-- Tells Current query that `a_parameter_source' is a query which
			-- potentially will constraint the possible values of one or
			-- more of query's parameters. 
		require source_not_void: a_parameter_source/=Void
		do
			gda_query_add_param_source(handle,a_parameter_source.handle)
			-- Note: this implies that Current query keeps a reference on
			-- `a_param_source'.
		end

	delete_param_source (a_parameter_source: GDA_DATA_MODEL) is 
			-- Tells Current query that it should no longer take care of
			-- `a_parameter_source'. The parameters which depend on
			-- param_source will still depend on it, though.
		require source_not_void: a_parameter_source/=Void
		do
			gda_query_del_param_source(handle, a_parameter_source.handle)
		end

	sources: G_OBJECT_SLIST[GDA_QUERY] is
			-- A list of the parameter source queries that are references
			-- as such by query.
		do
			create Result.from_external_pointer(gda_query_get_param_sources(handle))
			Result.petrify
		end


	--  gda_query_add_sub_query ()
	--
	-- void                gda_query_add_sub_query             (GdaQuery *query,
	--                                                          GdaQuery *sub_query);
	--
	--   Add sub_query to query. Sub queries are managed by their parent query, and
	--   as such they are destroyed when their parent query is destroyed.
	--
	--   query :     a GdaQuery object
	--   sub_query : a GdaQuery object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_del_sub_query ()
	--
	-- void                gda_query_del_sub_query             (GdaQuery *query,
	--                                                          GdaQuery *sub_query);
	--
	--   Removes sub_query from query. sub_query MUST be present within query.
	--
	--   query :     a GdaQuery object
	--   sub_query : a GdaQuery object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_targets ()
	--
	-- GSList*             gda_query_get_targets               (GdaQuery *query);
	--
	--   Get a list of all the targets used in query
	--
	--   query :   a GdaQuery object
	--   Returns : a new list of the targets
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_add_target ()
	--
	-- gboolean            gda_query_add_target                (GdaQuery *query,
	--                                                          GdaQueryTarget *target,
	--                                                          GError **error);
	--
	--   Adds a target to query. A target represents a entity (it can actually be a
	--   table, a view, or another query) which query will use.
	--
	--   For a SELECT query, the targets appear after the FROM clause. The targets
	--   can be joined two by two using GdaQueryJoin objects
	--
	--   For UPDATE, DELETE or INSERT queries, there can be only ONE GdaQueryTarget
	--   object which is the one where the data modifications are performed.
	--
	--   For UNION and INTERSECT queries, there is no possible GdaQueryTarget
	--   object.
	--
	--   query :   a GdaQuery object
	--   target :  a GdaQueryTarget to add to query
	--   error :   location to store error, or NULL
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_del_target ()
	--
	-- void                gda_query_del_target                (GdaQuery *query,
	--                                                          GdaQueryTarget *target);
	--
	--   Removes target from query. target MUST be present within query. Warning:
	--   All the joins and fields which depended on target are also removed.
	--
	--   query :  a GdaQuery object
	--   target : a GdaQueryTarget object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_target_by_xml_id ()
	--
	-- GdaQueryTarget*     gda_query_get_target_by_xml_id      (GdaQuery *query,
	--                                                          const gchar *xml_id);
	--
	--   Get a pointer to a GdaQueryTarget (which must be within query) using its
	--   XML Id
	--
	--   query :   a GdaQuery object
	--   xml_id :  the XML Id of the requested GdaQueryTarget object
	--   Returns : the GdaQueryTarget object, or NULL if not found
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_target_by_alias ()
	--
	-- GdaQueryTarget*     gda_query_get_target_by_alias       (GdaQuery *query,
	--                                                          const gchar *alias_or_name);
	--
	--   Get a pointer to a GdaQueryTarget (which must be within query) using its
	--   alias (if not found then alias_or_name is interpreted as the target name)
	--
	--   query :         a GdaQuery object
	--   alias_or_name : the alias or name
	--   Returns :       the GdaQueryTarget object, or NULL if not found
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_target_pkfields ()
	--
	-- GSList*             gda_query_get_target_pkfields       (GdaQuery *query,
	--                                                          GdaQueryTarget *target);
	--
	--   Makes a list of the GdaQueryField objects which represent primary key
	--   fields of the entity represented by target.
	--
	--   If the entity represented by target does not have any primary key, or if
	--   the primary key's fields are not present in query, then the returned value
	--   is NULL.
	--
	--   query :   a GdaQuery object
	--   target :  a GdaQueryTarget object
	--   Returns : a new GSList, or NULL.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_joins ()
	--
	-- GSList*             gda_query_get_joins                 (GdaQuery *query);
	--
	--   Get a list of all the joins used in query
	--
	--   query :   a GdaQuery object
	--   Returns : a new list of the joins
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_join_by_targets ()
	--
	-- GdaQueryJoin*       gda_query_get_join_by_targets       (GdaQuery *query,
	--                                                          GdaQueryTarget *target1,
	--                                                          GdaQueryTarget *target2);
	--
	--   Find a join in query which joins the target1 and target2 targets
	--
	--   query :   a GdaQuery object
	--   target1 : a GdaQueryTarget object
	--   target2 : a GdaQueryTarget object
	--   Returns : the GdaQueryJoin object, or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_add_join ()
	--
	-- gboolean            gda_query_add_join                  (GdaQuery *query,
	--                                                          GdaQueryJoin *join);
	--
	--   Add a join to query. A join is defined by the two GdaQueryTarget objects
	--   it joins and by a join condition which MUST ONLY make use of fields of the
	--   two entities represented by the targets.
	--
	--   For any given couple of GdaQueryTarget objects, there can exist ONLY ONE
	--   GdaQueryJoin which joins the two.
	--
	--   query :   a GdaQuery object
	--   join :    a GdaQueryJoin object
	--   Returns : TRUE on success, and FALSE otherwise
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_del_join ()
	--
	-- void                gda_query_del_join                  (GdaQuery *query,
	--                                                          GdaQueryJoin *join);
	--
	--   Removes join from query. join MUST be present within query.
	--
	--   query : a GdaQuery object
	--   join :  a GdaQueryJoin object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_condition ()
	--
	-- GdaQueryCondition*  gda_query_get_condition             (GdaQuery *query);
	--
	--   Get the query's associated condition
	--
	--   query :   a GdaQuery object
	--   Returns : the GdaQueryCondition object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_set_condition ()
	--
	-- void                gda_query_set_condition             (GdaQuery *query,
	--                                                          GdaQueryCondition *cond);
	--
	--   Sets the query's associated condition; if there was already a query
	--   condition, then the old one is trashed first.
	--
	--   Pass NULL as the cond argument to remove any query condition
	--
	--   query : a GdaQuery object
	--   cond :  a GdaQueryCondition object, or NULL to remove condition
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_add_field_from_sql ()
	--
	-- GdaQueryField*      gda_query_add_field_from_sql        (GdaQuery *query,
	--                                                          const gchar *field,
	--                                                          GError **error);
	--
	--   Parses field and if it represents a valid SQL expression for a field, then
	--   add it to query.
	--
	--   query :   a GdaQuery object
	--   field :   a SQL expression
	--   error :   place to store the error, or NULL
	--   Returns : a new GdaQueryField object, or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_set_order_by_field ()
	--
	-- void                gda_query_set_order_by_field        (GdaQuery *query,
	--                                                          GdaQueryField *field,
	--                                                          gint order,
	--                                                          gboolean ascendant);
	--
	--   Sets field to be used in the ORDER BY clause (using the order and
	--   ascendant attributes) if order >= 0. If order < 0, then field will not be
	--   used in the ORDER BY clause.
	--
	--   query :     a GdaQuery
	--   field :     a GdaQueryField which is in query
	--   order :     the order in the list of ORDER BY fields (starts at 0), or -1
	--   ascendant : TRUE to sort ascending
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_order_by_field ()
	--
	-- gint                gda_query_get_order_by_field        (GdaQuery *query,
	--                                                          GdaQueryField *field,
	--                                                          gboolean *ascendant);
	--
	--   Tells if field (which MUST be in query) is part of the ORDER BY clause.
	--
	--   query :     a GdaQuery
	--   field :     a GdaQueryField which is in query
	--   ascendant : if not NULL, will be set TRUE if ascendant sorting and FALSE
	--               otherwise
	--   Returns :   -1 if no, and the order where it appears in the ORDER BY list
	--               otherwise
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_all_fields ()
	--
	-- GSList*             gda_query_get_all_fields            (GdaQuery *query);
	--
	--   Fetch a list of all the fields of query: the ones which are visible, and
	--   the ones which are not visible and are not internal query fields.
	--
	--   query :   a GdaQuery object
	--   Returns : a new list of fields
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_field_by_sql_naming ()
	--
	-- GdaQueryField*      gda_query_get_field_by_sql_naming   (GdaQuery *query,
	--                                                          const gchar *sql_name);
	--
	--   query :    a GdaQuery object
	--   sql_name : the SQL naming for the requested field
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_field_by_sql_naming_fields ()
	--
	-- GdaQueryField*      gda_query_get_field_by_sql_naming_fields
	--                                                         (GdaQuery *query,
	--                                                          const gchar *sql_name,
	--                                                          GSList *fields_list);
	--
	--   query :       a GdaQuery object
	--   sql_name :    the SQL naming for the requested field
	--   fields_list : an explicit list of fields to search into
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_fields_by_target ()
	--
	-- GSList*             gda_query_get_fields_by_target      (GdaQuery *query,
	--                                                          GdaQueryTarget *target,
	--                                                          gboolean visible_fields_only);
	--
	--   Get a list of all the GdaQueryField objects in query which depent on the
	--   existance of target.
	--
	--   query :               a GdaQuery object
	--   target :              a GdaQueryTarget object representing a target in
	--                         query
	--   visible_fields_only :
	--   Returns :             a new list of GdaQueryField objects
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_get_main_conditions ()
	--
	-- GSList*             gda_query_get_main_conditions       (GdaQuery *query);
	--
	--   Makes a list of all the conditions (part of the WHERE clause) which are
	--   always verified by query when it is executed.
	--
	--   Examples: if the WHERE clause is: --> "A and B" then the list will
	--   contains {A, B} --> "A and (B or C)" it will contain {A, B or C} --> "A
	--   and (B and not C)", it will contain {A, B, not C}
	--
	--   query :   a GdaQuery object
	--   Returns : a new list of GdaQueryCondition objects
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_append_condition ()
	--
	-- void                gda_query_append_condition          (GdaQuery *query,
	--                                                          GdaQueryCondition *cond,
	--                                                          gboolean append_as_and);
	--
	--   Appends the cond object to query's condition. If query does not yet have
	--   any condition, then the result is the same as gda_query_set_condition();
	--   otherwise, cond is added to query's condition, using the AND operator if
	--   append_as_and is TRUE, and an OR operator if append_as_and is FALSE.
	--
	--   query :         a GdaQuery object
	--   cond :          a GdaQueryCondition object
	--   append_as_and : mode of append if there is already a query condition
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_expand_all_field ()
	--
	-- GSList*             gda_query_expand_all_field          (GdaQuery *query,
	--                                                          GdaQueryTarget *target);
	--
	--   Converts each visible "target.*" (GdaQueryFieldAll) field into its list of
	--   fields. For example "t1.*" becomes "t1.a, t1.b" if table t1 is composed of
	--   fields "a" and "b". The original GdaQueryFieldAll field is not removed,
	--   but simply rendered non visible.
	--
	--   The returned list must be free'd by the caller using g_slist_free().
	--
	--   query :   a GdaQuery object
	--   target :  a GdaQueryTarget, or NULL
	--   Returns : a new list of the GdaQueryField objects which have been created
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_order_fields_using_join_conds ()
	--
	-- void                gda_query_order_fields_using_join_conds
	--                                                         (GdaQuery *query);
	--
	--   Re-orders the fields in query using the joins' conditions: for each join
	--   condition, the used query fields are grouped together near the 1st visible
	--   field.
	--
	--   query : a GdaQuery object
	--
	--Properties
	--
	--
	--   "auto-clean"               gboolean              : Read / Write
	--   "cond-serial"              guint                 : Read
	--   "field-serial"             guint                 : Read
	--   "really-all-fields"        gpointer              : Read
	--   "target-serial"            guint                 : Read
		--Property Details
	--
	--  The "auto-clean" property
	--
	--   "auto-clean"               gboolean              : Read / Write
	--
	--   Determines if the query tries to clean unused objects.
	--
	--   Default value: TRUE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "cond-serial" property
	--
	--   "cond-serial"              guint                 : Read
	--
	--   Allowed values: >= 1
	--
	--   Default value: 1
	--
	--   --------------------------------------------------------------------------
	--
	--  The "field-serial" property
	--
	--   "field-serial"             guint                 : Read
	--
	--   Allowed values: >= 1
	--
	--   Default value: 1
	--
	--   --------------------------------------------------------------------------
	--
	--  The "really-all-fields" property
	--
	--   "really-all-fields"        gpointer              : Read
	--
	--   --------------------------------------------------------------------------
	--
	--  The "target-serial" property
	--
	--   "target-serial"            guint                 : Read
	--
	--   Allowed values: >= 1
	--
	--   Default value: 1
	--
	--Signals
	--
	--
	--   "condition-changed"                              : Run First
	--   "join-added"                                     : Run First
	--   "join-removed"                                   : Run First
	--   "join-updated"                                   : Run First
	--   "sub-query-added"                                : Run First
	--   "sub-query-removed"                              : Run First
	--   "sub-query-updated"                              : Run First
	--   "target-added"                                   : Run First
	--   "target-removed"                                 : Run First
	--   "target-updated"                                 : Run First
	--   "type-changed"                                   : Run First

	--Signal Details
	--
	--  The "condition-changed" signal
	--
	-- void                user_function                      (GdaQuery *gdaquery,
	--                                                         gpointer  user_data)      : Run First
	--
	--   dbquery :   the object which received the signal.
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "join-added" signal
	--
	-- void                user_function                      (GdaQuery     *gdaquery,
	--                                                         GdaQueryJoin *arg1,
	--                                                         gpointer      user_data)      : Run First
	--
	--   dbquery :   the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "join-removed" signal
	--
	-- void                user_function                      (GdaQuery     *gdaquery,
	--                                                         GdaQueryJoin *arg1,
	--                                                         gpointer      user_data)      : Run First
	--
	--   dbquery :   the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "join-updated" signal
	--
	-- void                user_function                      (GdaQuery     *gdaquery,
	--                                                         GdaQueryJoin *arg1,
	--                                                         gpointer      user_data)      : Run First
	--
	--   dbquery :   the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "sub-query-added" signal
	--
	-- void                user_function                      (GdaQuery *gdaquery,
	--                                                         GdaQuery *arg1,
	--                                                         gpointer  user_data)      : Run First
	--
	--   dbquery :   the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "sub-query-removed" signal
	--
	-- void                user_function                      (GdaQuery *gdaquery,
	--                                                         GdaQuery *arg1,
	--                                                         gpointer  user_data)      : Run First
	--
	--   dbquery :   the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "sub-query-updated" signal
	--
	-- void                user_function                      (GdaQuery *gdaquery,
	--                                                         GdaQuery *arg1,
	--                                                         gpointer  user_data)      : Run First
	--
	--   dbquery :   the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "target-added" signal
	--
	-- void                user_function                      (GdaQuery       *gdaquery,
	--                                                         GdaQueryTarget *arg1,
	--                                                         gpointer        user_data)      : Run First
	--
	--   dbquery :   the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "target-removed" signal
	--
	-- void                user_function                      (GdaQuery       *gdaquery,
	--                                                         GdaQueryTarget *arg1,
	--                                                         gpointer        user_data)      : Run First
	--
	--   dbquery :   the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "target-updated" signal
	--
	-- void                user_function                      (GdaQuery       *gdaquery,
	--                                                         GdaQueryTarget *arg1,
	--                                                         gpointer        user_data)      : Run First
	--
	--   dbquery :   the object which received the signal.
	--   arg1 :
	--   user_data : user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "type-changed" signal
	--
	-- void                user_function                      (GdaQuery *gdaquery,
	--                                                         gpointer  user_data)      : Run First
	--
	--   dbquery :   the object which received the signal.
	--   user_data : user data set when the signal handler was connected.
feature 
	dummy_gobject: POINTER is do unimplemented end

feature {} -- Unwrapped code
	-- Note: gda_query_declare_condition and
	-- gda_query_undeclare_condition are not wrapped because they are
	-- needed only to extend GDA_QUERY_CONDITION. This is currently not
	-- supported.

	-- void gda_query_declare_condition (GdaQuery *query,
	-- GdaQueryCondition *cond);
	
	--   Declares the existence of a new condition to query. All the
	--   GdaQueryCondition objects MUST be declared to the corresponding GdaQuery
			--   object for the library to work correctly. Once cond has been declared,
			--   query does not hold any reference to cond.
		
			--   This functions is called automatically from each gda_query_condition_new*
			--   function, and it should not be necessary to call it except for classes
			--   extending the GdaQueryCondition class.
		
	--
	-- void                gda_query_declare_condition         (GdaQuery *query,
	--                                                          GdaQueryCondition *cond);
	--
	--
	--   query : a GdaQuery object
	--   cond :  a GdaQueryCondition object
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_query_undeclare_condition ()
	--
	-- void                gda_query_undeclare_condition       (GdaQuery *query,
	--                                                          GdaQueryCondition *cond);
	--
	--   Explicitely ask query to forget about the existence of cond. This function
	--   is used by the GdaQueryCondition implementation, and should not be called
	--   directly
	--
	--   query : a GdaQuery object
	--   cond :  a GdaQueryCondition object
	--
	--   --------------------------------------------------------------------------

feature {} -- External calls
	gda_query_new (a_dict: POINTER): POINTER is
			-- GdaQuery* gda_query_new (GdaDict *dict);
		external "C use <libgda/libgda.h>"
		end

	gda_query_new_copy (a_orig, a_replacements: POINTER): POINTER is
			-- GdaQuery* gda_query_new_copy (GdaQuery *orig, GHashTable *replacements);
		external "C use <libgda/libgda.h>"
		end

	gda_query_new_from_sql (a_dict, a_sql, an_error_ref: POINTER): POINTER is
			-- GdaQuery* gda_query_new_from_sql (GdaDict *dict, const gchar *sql, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_query_declare_condition (a_query, a_cond: POINTER) is
			-- void gda_query_declare_condition (GdaQuery *query, GdaQueryCondition *cond);
		external "C use <libgda/libgda.h>"
		end

	gda_query_undeclare_condition (a_query, a_cond: POINTER) is
			-- void gda_query_undeclare_condition (GdaQuery *query, GdaQueryCondition *cond);
		external "C use <libgda/libgda.h>"
		end

	gda_query_set_query_type (a_query: POINTER; a_type: INTEGER) is
			-- void gda_query_set_query_type (GdaQuery *query, GdaQueryType type);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_query_type (a_query: POINTER): INTEGER is
			-- GdaQueryType gda_query_get_query_type (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_query_type_string (a_query: POINTER): POINTER is
			-- const gchar* gda_query_get_query_type_string (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_is_select_query (a_query: POINTER): INTEGER is
			-- gboolean gda_query_is_select_query (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_is_insert_query (a_query: POINTER): INTEGER is
			-- gboolean gda_query_is_insert_query (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_is_update_query (a_query: POINTER): INTEGER is
			-- gboolean gda_query_is_update_query (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_is_delete_query (a_query: POINTER): INTEGER is
			-- gboolean gda_query_is_delete_query (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_is_well_formed (a_query, a_context, an_error_ref: POINTER): INTEGER is
			-- gboolean gda_query_is_well_formed (GdaQuery *query, GdaParameterList *context, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_query_set_sql_text (a_query, a_sql, an_error_ref: POINTER) is
			-- void gda_query_set_sql_text (GdaQuery *query, const gchar *sql, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_sql_text (a_query: POINTER): POINTER is
			-- const gchar* gda_query_get_sql_text (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_parameters (a_query: POINTER): POINTER is
			-- GSList* gda_query_get_parameters (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_parameter_list (a_query: POINTER): POINTER is
			-- GdaParameterList* gda_query_get_parameter_list (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_execute (a_query, a_params: POINTER; a_iter_model_only_requested_bool: INTEGER; an_error_ref: POINTER): POINTER is
			-- GdaObject* gda_query_execute (GdaQuery *query, GdaParameterList *params, gboolean iter_model_only_requested, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_parent_query (a_query: POINTER): POINTER is
			-- GdaQuery* gda_query_get_parent_query (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_field_by_ref_field (a_query, a_target, an_ref_field: POINTER; a_field_state: INTEGER): POINTER is
			-- GdaQueryField* gda_query_get_field_by_ref_field (GdaQuery *query, GdaQueryTarget *target, GdaEntityField *ref_field, GdaQueryFieldState field_state);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_field_by_param_name (a_query, a_param_name: POINTER): POINTER is
			-- GdaQueryField* gda_query_get_field_by_param_name (GdaQuery *query, const gchar *param_name);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_first_field_for_target (a_query, a_target: POINTER): POINTER is
			-- GdaQueryField* gda_query_get_first_field_for_target (GdaQuery *query, GdaQueryTarget *target);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_sub_queries (a_query: POINTER): POINTER is
			-- GSList* gda_query_get_sub_queries (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_add_param_source (a_query, a_param_source: POINTER) is
			-- void gda_query_add_param_source (GdaQuery *query, GdaDataModel *param_source);
		external "C use <libgda/libgda.h>"
		end

	gda_query_del_param_source (a_query, a_param_source: POINTER) is
			-- void gda_query_del_param_source (GdaQuery *query, GdaDataModel *param_source);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_param_sources (a_query: POINTER): POINTER is
			-- const GSList* gda_query_get_param_sources (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_add_sub_query (a_query, a_sub_query: POINTER) is
			-- void gda_query_add_sub_query (GdaQuery *query, GdaQuery *sub_query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_del_sub_query (a_query, a_sub_query: POINTER) is
			-- void gda_query_del_sub_query (GdaQuery *query, GdaQuery *sub_query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_targets (a_query: POINTER): POINTER is
			-- GSList* gda_query_get_targets (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_add_target (a_query, a_target, an_error_ref: POINTER): INTEGER is
			-- gboolean gda_query_add_target (GdaQuery *query, GdaQueryTarget *target, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_query_del_target (a_query, a_target: POINTER) is
			-- void gda_query_del_target (GdaQuery *query, GdaQueryTarget *target);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_target_by_xml_id (a_query, a_xml_id: POINTER): POINTER is
			-- GdaQueryTarget* gda_query_get_target_by_xml_id (GdaQuery *query, const gchar *xml_id);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_target_by_alias (a_query, a_alias_or_name: POINTER): POINTER is
			-- GdaQueryTarget* gda_query_get_target_by_alias (GdaQuery *query, const gchar *alias_or_name);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_target_pkfields (a_query, a_target: POINTER): POINTER is
			-- GSList* gda_query_get_target_pkfields (GdaQuery *query, GdaQueryTarget *target);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_joins (a_query: POINTER): POINTER is
			-- GSList* gda_query_get_joins (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_join_by_targets (a_query, a_target1, a_targer2: POINTER): POINTER is
			-- GdaQueryJoin* gda_query_get_join_by_targets (GdaQuery *query, GdaQueryTarget *target1, GdaQueryTarget *target2);
		external "C use <libgda/libgda.h>"
		end

	gda_query_add_join (a_query, a_join: POINTER): INTEGER is
			-- gboolean gda_query_add_join (GdaQuery *query, GdaQueryJoin *join);
		external "C use <libgda/libgda.h>"
		end

	gda_query_del_join (a_query, a_join: POINTER) is
			-- void gda_query_del_join (GdaQuery *query, GdaQueryJoin *join);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_condition (a_query: POINTER): POINTER is
			-- GdaQueryCondition* gda_query_get_condition (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_set_condition (a_query, a_cond: POINTER) is
			-- void gda_query_set_condition (GdaQuery *query, GdaQueryCondition *cond);
		external "C use <libgda/libgda.h>"
		end

	gda_query_add_field_from_sql (a_query, a_field, an_error_ref: POINTER): POINTER is
			-- GdaQueryField* gda_query_add_field_from_sql (GdaQuery *query, const gchar *field, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_query_set_order_by_field (a_query, a_field: POINTER; an_order: INTEGER; an_ascendant_bool: INTEGER) is
			-- void gda_query_set_order_by_field (GdaQuery *query, GdaQueryField *field, gint order, gboolean ascendant);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_order_by_field (a_query, a_field, an_ascendant_bool_ref: POINTER): INTEGER is
			-- gint gda_query_get_order_by_field (GdaQuery *query, GdaQueryField *field, gboolean *ascendant);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_all_fields (a_query: POINTER): POINTER is
			-- GSList* gda_query_get_all_fields (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_field_by_sql_naming (a_query, a_sql_name: POINTER): POINTER is
			-- GdaQueryField* gda_query_get_field_by_sql_naming (GdaQuery *query, const gchar *sql_name);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_field_by_sql_naming_fields (a_query, a_sql_name, a_fields_list: POINTER): POINTER is
			-- GdaQueryField* gda_query_get_field_by_sql_naming_fields (GdaQuery *query, const gchar *sql_name, GSList *fields_list);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_fields_by_target (a_query, a_target: POINTER; a_visible_fields_only_bool: INTEGER): POINTER is
			-- GSList* gda_query_get_fields_by_target (GdaQuery *query, GdaQueryTarget *target, gboolean visible_fields_only);
		external "C use <libgda/libgda.h>"
		end

	gda_query_get_main_conditions (a_query: POINTER): POINTER is
			-- GSList* gda_query_get_main_conditions (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

	gda_query_append_condition (a_query, a_cond: POINTER; an_append_as_and_bool: INTEGER) is
			-- void gda_query_append_condition (GdaQuery *query, GdaQueryCondition *cond, gboolean append_as_and);
		external "C use <libgda/libgda.h>"
		end

	gda_query_expand_all_field (a_query, a_target: POINTER): POINTER is
			-- GSList* gda_query_expand_all_field (GdaQuery *query, GdaQueryTarget *target);
		external "C use <libgda/libgda.h>"
		end

	gda_query_order_fields_using_join_conds (a_query: POINTER) is
			-- void gda_query_order_fields_using_join_conds (GdaQuery *query);
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaQuery)"
		end

end -- class GDA_QUERY
