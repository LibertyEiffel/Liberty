indexing
	description: "GdaDict GDA dictionary."
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

			-- Description: This object is a "proxy repository" for all the objects:

			-- * existing within a database such as data types (see the GdaDictType
			-- object), functions (see the GdaDictFunction object), aggregates (see the
			-- GdaDictAggregate object), and the database structure (through the
			-- GdaDictDatabase and associated object)
			
			-- * pre-defined queries as GdaQuery objects

			-- * graphs as GdaGraph objects

			-- Each GdaDict object can be saved to an XML file and loaded back in
			-- an efficient way; any GdaDict object can be assigned a GdaConnection
			-- object which tells it how to use a real connection to a data source.

			-- The GdaDict object is responsible for the life management of all the
			-- objects it handles; see the GdaObject object for more information.
			
class GDA_DICT

inherit G_OBJECT

insert 
	GDA_DICT_EXTERNALS
	SHARED_G_ERROR

creation make, from_external_pointer

feature {} -- Creation
	make is
			-- Create a new GdaDict object.
		do
			from_external_pointer(gda_dict_new)
		end
feature
	extend_with_functions is
			-- Make dict handle functions and aggregates
		do
			gda_dict_extend_with_functions  (handle)
		end

	set_connection (a_connection: GDA_CONNECTION) is
			-- Sets the associated connection to Current. This connection is then
			-- used when the dictionary synchronises itself, and when manipulating
			-- data (the `handler' feature).
		require
			connection_not_void: a_connection /= Void
		do
			gda_dict_set_connection (handle, a_connection.handle)
		end
	
	connection: GDA_CONNECTION is
			-- the GDA_CONNECTION used by Current GDA_DICT.
		do
			create Result.from_external_pointer(gda_dict_get_connection(handle))
		end

	database: GDA_DICT_DATABASE is
			-- the GdaDictDatabase used by the GdaDict object.
		do
			create Result.from_external_pointer(gda_dict_get_database(handle))
		end
	
	-- Note: gda_dict_declare_object_string_id_change not wrapped, since it is an
	-- internal function, not to be used directly.

	object (an_id: STRING): GDA_OBJECT is
			-- the GdaObject which has `an_id' string ID. Note: the current
			-- implementation require that the object that will be retrieved must
			-- be already be wrapped. Otherwise it will be Void *EVEN* if such an
			-- object actually exists.
		local retriever: G_RETRIEVER[GDA_OBJECT]; ptr: POINTER
		do
			ptr := gda_dict_get_object_by_string_id (handle, an_id.to_external)
			Result := (retriever.eiffel_wrapper_from_gobject_pointer(ptr))
			if Result=Void then
				print ("Warning: could not retrieve GdaObject with id `")
				print (an_id) print("': it is a generic object and we do not know its effective type%N")
			end
		end

	update_dbms_data (limit_to_type: INTEGER; limit_object_name: STRING) is
			-- Updates the list of data types, functions, tables, etc from the
			-- database, which means that the dict object uses an opened connection
			-- to the DBMS. Use `GDA_DICT.set_connection' to set a GdaConnection to
			-- dict.

			-- limit_to_type: limit the DBMS update to this type, or 0 for no limit
		
			-- limit_object_name : 	limit the DBMS update to objects of this name, or Void for no limit
		
			-- `is_successful' will be True if no error occurred: otherwise `error' will be updated
		do
			is_successful:= (gda_dict_update_dbms_data (handle, limit_to_type,
																	  limit_object_name.to_external,
																	  address_of (error.handle))).to_boolean
		end

	stop_update_dbms_data is
			-- When the dictionary updates its internal lists of DBMS objects, a
			-- call to this function will stop that update process. It has no
			-- effect when the dictionary is not updating its DBMS data.
		do
			gda_dict_stop_update_dbms_data  (handle)
		end
	
	preferred_xml_filename (a_datasource, an_application_id: STRING): STRING is
			-- the prefered filename which represents the data dictionary
			-- associated to the datasource data source. Using the returned value
			-- in conjunction with `load_xml_file' and `save_xml_file' has the
			-- advantage of letting the library handle file naming onventions.

			-- if `a_datasource' is Void, and a GdaConnection object has been
			-- assigned to Current GDA_DICT, then the returned string will take
			-- into account the data source used by that connection.
		
			-- The `an_application_id' (which can be Void) argument allows to give
			-- an extra identification to the request, when some special features
			-- must be saved but not interfere with the default dictionary.

			-- `error' are updated as necessary.
		local datasource_ptr, app_ptr: POINTER
		do
			if a_datasource /= Void then datasource_ptr := a_datasource.to_external end
			if an_application_id /= Void then app_ptr := an_application_id.to_external end
			create Result.from_external (gda_dict_compute_xml_filename
												  (handle, datasource_ptr, app_ptr,
													address_of (error.handle)))
		end
	
	set_xml_filename (an_xml_file: STRING) is
			-- Sets the filename dict will use when `save_xml' and `load_xml' are
			-- called.
		require xml_file_not_void: an_xml_file /= Void
		do
			gda_dict_set_xml_filename (handle, an_xml_file.to_external)
		end


	xml_filename: STRING is
			-- the filename GDA_DICT will use when `save_xml' and `load_xml' are
			-- called. Void if none have been set.
		local cstr: POINTER
		do
			cstr := gda_dict_get_xml_filename(handle)
			if cstr.is_not_null then 
				create {CONST_STRING} Result.from_external (cstr)
			end
		end
	
	load is
			-- Loads an XML file which respects the Libgda DTD, and creates all the
			-- necessary objects that are defined within the XML file. During the
			-- creation of the other objects, all the normal signals are emitted.

			-- If the GdaDict object already has some contents, then it is first of
			-- all destroyed (to return its state as when it was first created).

			-- If an error occurs during loading then the GdaDict object is left as
			-- empty as when it is first created.
		
			-- The file loaded is the one specified using `set_xml_filename'.
			-- `is_successful' will be True if loading was successfull; otherwise
			-- it will be False and `error' is updated as necessary.
		do
			is_successful:=(gda_dict_load(handle,address_of(error.handle))).to_boolean
		end
	
	save is
			-- Saves the contents of a GdaDict object to a file which is specified
			-- using the `set_xml_filename' method.  `is_successful' will be True
			-- if loading was successfull; otherwise it will be False and `error'
			-- is updated as necessary.
		do
			is_successful:=(gda_dict_save(handle,address_of(error.handle))).to_boolean
		end

	load_xml_file (a_filename: STRING) is
			-- Loads an XML file which respects the Libgda DTD, and creates all the
			-- necessary objects that are defined within the XML file. During the
			-- creation of the other objects, all the normal signals are emitted.

			-- If the GdaDict object already has some contents, then it is first of
			-- all destroyed (to return its state as when it was first created).

			-- If an error occurs during loading then the GdaDict object is left as
			-- empty as when it is first created.

			-- `is_successful' will be True if loading was successfull; otherwise
			-- it will be False and `error' is updated as necessary.
		require filename_not_void: a_filename /= Void
		do
			is_successful:=(gda_dict_load_xml_file(handle,a_filename.to_external,address_of(error.handle))).to_boolean
		end


	-- gda_dict_save_xml_file ()

	-- gboolean    gda_dict_save_xml_file          (GdaDict *dict,
	--                                              const gchar *xmlfile,
	--                                              GError **error);

	-- Saves the contents of a GdaDict object to a file which is given as argument.

	-- dict : 	a GdaDict object
	-- xmlfile : 	the name of the file to which the XML will be written to
	-- error : 	location to store error, or NULL
	-- Returns : 	TRUE if saving was successfull and FALSE otherwise.
	-- gda_dict_get_handler ()

	-- GdaDataHandler* gda_dict_get_handler        (GdaDict *dict,
	--                                              GType for_type);

	-- Obtain a pointer to a GdaDataHandler which can convert GValue values of type for_type.

	-- Unlike the gda_dict_get_default_handler() method, this method asks the provider (for the connection assigned to dict using gda_dict_set_connection()) if there is any.

	-- It fallbacks to the same data handler as gda_dict_get_default_handler() if no connection has been assigned, or if the assigned'd provider offers no data handler for that type.

	-- The returned pointer is NULL if there is no data handler available for the for_type type.

	-- dict : 	a GdaDict object
	-- for_type : 	a GType type
	-- Returns : 	a GdaDataHandler
	-- gda_dict_get_default_handler ()

	-- GdaDataHandler* gda_dict_get_default_handler
	--                                             (GdaDict *dict,
	--                                              GType for_type);

	-- Obtain a pointer to a GdaDataHandler which can manage GValue values of type for_type

	-- The returned pointer is NULL if there is no default data handler available for the for_type data type

	-- dict : 	a GdaDict object
	-- for_type : 	a GType type
	-- Returns : 	a GdaDataHandler
	-- gda_dict_get_queries()

	-- #define gda_dict_get_queries(dict) gda_dict_get_objects((dict), GDA_TYPE_QUERY)

	-- dict : 	
	-- Returns : 	
	-- gda_dict_get_query_by_xml_id()

	-- #define gda_dict_get_query_by_xml_id(dict,xml_id) ((GdaQuery*)gda_dict_get_object_by_xml_id((dict), GDA_TYPE_QUERY, (xml_id)))

	-- dict : 	
	-- xml_id : 	
	-- Returns : 	
	-- gda_dict_get_dict_types()

	-- #define gda_dict_get_dict_types(dict) gda_dict_get_objects((dict), GDA_TYPE_DICT_TYPE)

	-- dict : 	
	-- Returns : 	
	-- gda_dict_get_dict_type_by_name()

	-- #define gda_dict_get_dict_type_by_name(dict,type_name) ((GdaDictType*)gda_dict_get_object_by_name((dict), GDA_TYPE_DICT_TYPE, (type_name)))

	-- dict : 	
	-- type_name : 	
	-- Returns : 	
	-- gda_dict_get_dict_type_by_xml_id()

	-- #define gda_dict_get_dict_type_by_xml_id(dict,xml_id) ((GdaDictType*)gda_dict_get_object_by_xml_id((dict), GDA_TYPE_DICT_TYPE, (xml_id)))

	-- dict : 	
	-- xml_id : 	
	-- Returns : 	
	-- gda_dict_get_functions()

	-- #define gda_dict_get_functions(dict) gda_dict_get_objects ((dict), GDA_TYPE_DICT_FUNCTION)

	-- dict : 	
	-- Returns : 	
	-- gda_dict_get_functions_by_name()

	-- #define gda_dict_get_functions_by_name(dict,funcname) gda_functions_get_by_name ((dict), (funcname))

	-- dict : 	
	-- funcname : 	
	-- Returns : 	
	-- gda_dict_get_function_by_name_arg()

	-- #define gda_dict_get_function_by_name_arg(dict,funcname,argtypes) gda_functions_get_by_name_arg ((dict), (funcname), (argtypes))

	-- dict : 	
	-- funcname : 	
	-- argtypes : 	
	-- Returns : 	
	-- gda_dict_get_function_by_xml_id()

	-- #define gda_dict_get_function_by_xml_id(dict,xml_id) gda_dict_get_object_by_xml_id ((dict), GDA_TYPE_DICT_FUNCTION, (xml_id))

	-- dict : 	
	-- xml_id : 	
	-- Returns : 	
	-- gda_dict_get_function_by_dbms_id()

	-- #define gda_dict_get_function_by_dbms_id(dict,dbms_id) gda_functions_get_by_dbms_id ((dict), (dbms_id))

	-- To find a DBMS functions which is uniquely identified by its name and the type of its argument.

	-- dict : 	a GdaDict object
	-- dbms_id : 	
	-- Returns : 	The function or NULL if not found
	-- gda_dict_get_aggregates()

	-- #define gda_dict_get_aggregates(dict) gda_dict_get_objects((dict), GDA_TYPE_DICT_AGGREGATE)

	-- dict : 	
	-- Returns : 	
	-- gda_dict_get_aggregates_by_name()

	-- #define gda_dict_get_aggregates_by_name(dict,aggname) gda_aggregates_get_by_name((dict), (aggname))

	-- dict : 	
	-- aggname : 	
	-- Returns : 	
	-- gda_dict_get_aggregate_by_name_arg()

	-- #define gda_dict_get_aggregate_by_name_arg(dict,argname,argtype) gda_aggregates_get_by_name_arg ((dict), (argname), (argtype))

	-- dict : 	
	-- argname : 	
	-- argtype : 	
	-- Returns : 	
	-- gda_dict_get_aggregate_by_xml_id()

	-- #define gda_dict_get_aggregate_by_xml_id(dict,xml_id) gda_dict_get_object_by_xml_id((dict), GDA_TYPE_DICT_AGGREGATE, (xml_id))

	-- dict : 	
	-- xml_id : 	
	-- Returns : 	
	-- gda_dict_get_aggregate_by_dbms_id()

	-- #define gda_dict_get_aggregate_by_dbms_id(dict,dbmsid) gda_aggregates_get_by_dbms_id((dict),(dbmsid))

	-- To find a DBMS functions which is uniquely identified by its name and the type of its argument.

	-- dict : 	a GdaDict object
	-- dbmsid : 	
	-- Returns : 	The aggregate or NULL if not found
	-- gda_dict_declare_object ()

	-- void        gda_dict_declare_object         (GdaDict *dict,
	--                                              GdaObject *object);

	-- Declares the existence of a new object to dict: dict knows about object but does not hold any reference to it. If dict must hold such a reference, then use gda_dict_assume_object().

	-- dict : 	a GdaDict object
	-- object : 	a GdaObject object
	-- gda_dict_declare_object_as ()

	-- void        gda_dict_declare_object_as      (GdaDict *dict,
	--                                              GdaObject *object,
	--                                              GType as_type);

	-- Same as gda_dict_declare_object() but forces to use the as_type type instead of object's realtype

	-- dict : 	a GdaDict object
	-- object : 	a GdaObject object
	-- as_type : 	type parent type of object to take into account
	-- gda_dict_assume_object ()

	-- void        gda_dict_assume_object          (GdaDict *dict,
	--                                              GdaObject *object);

	-- Declares the existence of a new object to dict, and force dict to hold a reference to object so it is not destroyed.

	-- dict : 	a GdaDict object
	-- object : 	a GdaObject object
	-- gda_dict_assume_object_as ()

	-- void        gda_dict_assume_object_as       (GdaDict *dict,
	--                                              GdaObject *object,
	--                                              GType as_type);

	-- Same as gda_dict_assume_object() but forces to use the as_type type instead of object's realtype

	-- dict : 	a GdaDict object
	-- object : 	a GdaObject object
	-- as_type : 	parent type of object to take into account
	-- gda_dict_unassume_object ()

	-- void        gda_dict_unassume_object        (GdaDict *dict,
	--                                              GdaObject *object);

	-- Makes dict release its reference on object.

	-- dict : 	a GdaDict object
	-- object : 	a GdaObject object
	-- gda_dict_get_objects ()

	-- GSList*     gda_dict_get_objects            (GdaDict *dict,
	--                                              GType type);

	-- dict : 	a GdaDict object
	-- type : 	a Gtype type of object
	-- Returns : 	a new list of all the objects of type type managed by dict.
	-- gda_dict_get_object_by_name ()

	-- GdaObject*  gda_dict_get_object_by_name     (GdaDict *dict,
	--                                              GType type,
	--                                              const gchar *name);

	-- Tries to find an object from its name, among the objects managed by dict of type type.

	-- dict : 	a GdaDict object
	-- type : 	a Gtype type of object
	-- name : 	
	-- Returns : 	a pointer to the requested object, or NULL if the object was not found
	-- gda_dict_get_object_by_xml_id ()

	-- GdaObject*  gda_dict_get_object_by_xml_id   (GdaDict *dict,
	--                                              GType type,
	--                                              const gchar *xml_id);

	-- For the objects which implement the GdaXmlStorage interface, this function allows to find an object from its XML Id. The object is looked from the managed objects of type type, and also from the list of all declared objects.

	-- dict : 	a GdaDict object
	-- type : 	a Gtype type of object
	-- xml_id : 	
	-- Returns : 	a pointer to the requested object, or NULL if the object was not found
feature 	-- TODO: Properties

	-- The "dsn" property

	--   "dsn"                  gchararray            : Read / Write

	-- Default value: NULL
	-- The "username" property

	--   "username"             gchararray            : Read / Write

	-- Default value: NULL

	--   "dsn"                  gchararray            : Read / Write
	--   "username"             gchararray            : Read / Write

feature 	-- TODO: Signals

	-- "changed"   void        user_function      (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first
	-- "data-update-finished"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first
	-- "data-update-started"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first
	-- "object-act-changed"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first
	-- "object-added"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first
	-- "object-removed"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first
	-- "object-updated"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first
	-- "update-progress"
	--             void        user_function      (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             guint    arg2,
	--                                             guint    arg3,
	--                                             gpointer user_data)      : Run first

	-- The "changed" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first

	-- dbdict : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "data-update-finished" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "data-update-started" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- user_data : 	user data set when the signal handler was connected.
	-- The "object-act-changed" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "object-added" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "object-removed" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "object-updated" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- arg1 : 	
	-- user_data : 	user data set when the signal handler was connected.
	-- The "update-progress" signal

	-- void        user_function                  (GdaDict *gdadict,
	--                                             gpointer arg1,
	--                                             guint    arg2,
	--                                             guint    arg3,
	--                                             gpointer user_data)      : Run first

	-- gdadict : 	the object which received the signal.
	-- arg1 : 	
	-- arg2 : 	
	-- arg3 : 	
	-- user_data : 	user data set when the signal handler was connected.
end -- class GDA_DICT
