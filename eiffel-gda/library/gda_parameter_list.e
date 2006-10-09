indexing
	description: "GdaParameterList manages a list of GdaParameter objects which contain individual values."
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

			-- Description: A GdaParameterList is in a way only a better
			-- than GList list of GdaParameter objects: it handles a list
			-- of GdaParameter objects (accessible directly using
			-- paramlist->parameters) but also creates other lists such
			-- as:
			
			-- * a list of GdaParameterListNode structures (the
			-- nodes_list attribute): for each parameter a such structure
			-- is created to show in a signle place all the information
			-- about each parameter: the GdaDataModel which may restrict
			-- the list of values along with the column number in it, and
			-- any hint for the parameter (a value made of
			-- GdaParameterListParamHint flags)

			-- * a list of GdaParameterListSource structures (the
			-- sources_list attribute): each GdaParameterListSource
			-- structure is complementary to the GdaParameterListNode
			-- structures listed in its "nodes" attribute: there is one
			-- such structure for each GdaDataModel which may restrict
			-- values of one or more parameters.

			-- * a list of GdaParameterListGroup structures (the
			-- groups_list attribute): there is one such structure for
			-- each _independant_ parameter (parameters which are
			-- constrained by the same data model all appear in the same
			-- GdaParameterListGroup structure)

			-- Some queries require arguments before they can be
			-- executed. For such queries, the arguments are passed using
			-- GdaParameter objects (the list of parameters can be
			-- obtained using gda_query_get_parameters() or
			-- gda_query_get_parameters_boxed()).

class GDA_PARAMETER_LIST

inherit 
	GDA_OBJECT
		undefine
			struct_size
		end
	-- TODO: LINKED_LIST [GDA_PARAMETER]

insert
	GDA_PARAMETER_LIST_EXTERNALS
		-- GDA_PARAMETER_LIST_GROUP_STRUCT rename struct_size as
		-- gda_parameter_list_group_struct_size end

		--	GDA_PARAMETER_LIST_SOURCE_STRUCT
		-- rename struct_size as gda_parameter_list_source_struct_size end
	SHARED_G_ERROR
		
creation make, from_external_pointer

feature {} -- Creation
	from_parameters (some_parameters: G_SLIST [GDA_PARAMETER]) is
			-- Creates a new GdaParameterList object, and populates it with 
			-- `some_paramaters'. 
		do
			-- Note: The list given as argument can be freed by the caller
			-- later on as it gets copied. All the parameters in params
			-- are referenced counted and modified, so they should not be
			-- used anymore afterwards, and the params list gets copied
			-- (so it should be freed by the caller).
			if some_parameters = Void then
				from_external_pointer (gda_parameter_list_new (default_pointer))
			else
				from_external_pointer (gda_parameter_list_new (some_parameters.handle))
			end
		end
			
	-- TODO: from_spec_string ()

	-- GdaParameterList* gda_parameter_list_new_from_spec_string
	-- (GdaDict *dict, const gchar *xml_spec, GError **error);
	
	-- Creates a new GdaParameterList object from the xml_spec
	-- specifications
	
	-- dict : 	a GdaDict object, or NULL
	-- xml_spec : 	a string
	-- error : 	a place to store the error, or NULL
	-- Returns : 	a new object, or NULL if an error occurred

feature 
	count: INTEGER is
			-- the number of GdaParameter objects in paramlist
		do
			Result := gda_parameter_list_get_length (handle)
		ensure 
			positive: Result >= 0
		end


	spec: STRING is
			-- the specification as an XML string. See `from_spec_string'
			-- feature for more information about the XML specification
			-- string format.
		do
			create Result.from_external_copy
			(gda_parameter_list_get_spec (handle))
		ensure not_void: Result /= Void
		end

	add (a_parameter: GDA_PARAMETER) is
			-- Adds `a_parameter' to the list of parameters managed
			-- within paramlist. WARNING: the parameter list may decide
			-- not to use `a_parameter', but to modify another parameter
			-- already present within the parameter list. The publicly
			-- available lists from the paramlist object may also be
			-- changed in the process.
		require parameter_not_void: a_parameter /= Void
		do
			gda_parameter_list_add_param (handle, a_parameter.handle)
		end

	-- Shall "add_from_string (a_name, a_string: STRING; a_type:
	-- INTEGER)" wrapping gda_parameter_list_add_param_from_string
	-- (GdaParameterList *paramlist, const gchar *name, GType type,
	-- const gchar *str); be implemented?

	-- It is by far not the Eiffel style.... 
	-- Creates and adds a new GdaParameter to paramlist. The ID and name of the new parameter are set as name. The parameter's value is set from str.

	-- paramlist : 	a GdaParameterList object
	-- name : 	the name to give to the new parameter
	-- type : 	the type of parameter to add
	-- str : 	the string representation of the parameter
	-- Returns : 	the new GdaParameter for information, or NULL if an error occurred

	last_added_parameter: GDA_PARAMETER
	
	add_param_from_value (a_name: STRING; a_value: G_VALUE) is
			-- Creates and adds a new GdaParameter to paramlist. The ID
			-- and name of the new parameter are set as `a_name'. The
			-- parameter's value is a copy of
			-- `a_value'. `last_added_parameter' will contains the newly
			-- created parameter; it will be Void on errors.
		require
			name_not_void: a_name /= Void
			value_not_void: a_value /= Void
			value_not_null: -- TODO: not a_value.is_null 
		local ptr: POINTER
		do
			ptr:=gda_parameter_list_add_param_from_value (handle,
																		 a_name.to_external,
																		 a_value.handle)
			--value : the value to give to the new parameter, must not be
			--NULL or of type null

			--Returns : the new GdaParameter for information, or NULL if
			--an error occurred
			if ptr.is_null then last_added_parameter:=Void
			else
				create last_added_parameter.from_external_pointer(ptr)
			end
		end

	is_coherent: BOOLEAN is
			-- Has the parameter list a coherent public data structure?
			-- `error' will be updated as necessary.
		do
			Result := (gda_parameter_list_is_coherent
						  (handle,
							address_of(error.handle))).to_boolean
		end

	is_valid: BOOLEAN is
			-- Do all the paramlist's parameters have valid data?
		do
			Result := (gda_parameter_list_is_valid(handle)).to_boolean
		end

	
	-- gda_parameter_list_find_param ()

	-- GdaParameter* gda_parameter_list_find_param (GdaParameterList *paramlist,
	--                                              const gchar *param_name);

	-- Finds a GdaParameter using its name

	-- paramlist : 	a GdaParameterList object
	-- param_name : 	the name of the requested parameter
	-- Returns : 	a GdaParameter or NULL
	-- gda_parameter_list_find_param_for_user ()

	-- GdaParameter* gda_parameter_list_find_param_for_user
	--                                             (GdaParameterList *paramlist,
	--                                              GdaObject *user);

	-- Finds a GdaParameter which is to be used by user

	-- paramlist : 	a GdaParameterList object
	-- user : 	a GdaObject object
	-- Returns : 	a GdaParameter or NULL
	-- gda_parameter_list_find_node_for_param ()

	-- GdaParameterListNode* gda_parameter_list_find_node_for_param
	--                                             (GdaParameterList *paramlist,
	--                                              GdaParameter *param);

	-- Finds a GdaParameterListNode holding information for param, don't modify the returned structure

	-- paramlist : 	a GdaParameterList object
	-- param : 	a GdaParameter object
	-- Returns : 	a GdaParameterListNode or NULL
	-- gda_parameter_list_find_source_for_param ()

	-- GdaParameterListSource* gda_parameter_list_find_source_for_param
	--                                             (GdaParameterList *paramlist,
	--                                              GdaParameter *param);

	-- Finds a GdaParameterListSource which contains the GdaDataModel restricting the possible values of param, don't modify the returned structure.

	-- paramlist : 	a GdaParameterList object
	-- param : 	a GdaParameter object
	-- Returns : 	a GdaParameterListSource or NULL
	-- gda_parameter_list_find_source ()

	-- GdaParameterListSource* gda_parameter_list_find_source
	--                                             (GdaParameterList *paramlist,
	--                                              GdaDataModel *model);

	-- Finds the GdaParameterListSource structure used in paramlist for which model is a the data model, don't modify the returned structure

	-- paramlist : 	a GdaParameterList object
	-- model : 	a GdaDataModel object
	-- Returns : 	a GdaParameterListSource pointer or NULL.
	-- gda_parameter_list_set_param_default_value ()

	-- void        gda_parameter_list_set_param_default_value
	--                                             (GdaParameterList *paramlist,
	--                                              GdaParameter *param,
	--                                              const GValue *value);

	-- Stores value in paramlist to make it possible for paramlist's users to find a default value for param when one is required, instead of NULL.

	-- paramlist only provides a storage functionnality, the way the value obtained with gda_parameter_list_get_param_default_value() is used is up to paramlist's user.

	-- paramlist : 	a GdaParameterList object
	-- param : 	a GdaParameter object, managed by paramlist
	-- value : 	a GValue, of the same type as param, or NULL
	-- gda_parameter_list_set_param_default_alias ()

	-- void        gda_parameter_list_set_param_default_alias
	--                                             (GdaParameterList *paramlist,
	--                                              GdaParameter *param,
	--                                              GdaParameter *alias);

	-- paramlist : 	
	-- param : 	
	-- alias : 	
	-- gda_parameter_list_get_param_default_value ()

	-- const GValue* gda_parameter_list_get_param_default_value
	--                                             (GdaParameterList *paramlist,
	--                                              GdaParameter *param);

	-- Retreives a prefered default value to be used by paramlist's users when necessary. The usage of such values is decided by paramlist's users.

	-- paramlist only offers to store the value using gda_parameter_list_set_param_default_value() or to store a GdaParameter reference from which to get a value using gda_parameter_list_set_param_default_alias().

	-- paramlist : 	a GdaParameterList object
	-- param : 	a GdaParameter object, managed by paramlist
	-- Returns : 	a GValue, or NULL.
	-- Signals

	-- "param-changed"
	--             void        user_function      (GdaParameterList *gdaparameterlist,
	--                                             GObject          *arg1,
	--                                             gpointer          user_data)             : Run first
	-- "public-data-changed"
	--             void        user_function      (GdaParameterList *gdaparameterlist,
	--                                             gpointer          user_data)             : Run first

	-- 															Signal Details
	-- The "param-changed" signal

	-- void        user_function                  (GdaParameterList *gdaparameterlist,
	--                                             GObject          *arg1,
	--                                             gpointer          user_data)             : Run first

	-- dbdataset : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "public-data-changed" signal

	-- void        user_function                  (GdaParameterList *gdaparameterlist,
	--                                             gpointer          user_data)             : Run first

	-- gdaparameterlist : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
end
