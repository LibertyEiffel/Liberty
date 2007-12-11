indexing
	description: "GdaServerOperation handles any DDL query in an abstract way"
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

class GDA_SERVER_OPERATION
	-- GdaServerOperation handles any DDL query in an abstract way

	-- Basically this object is just a named data store: it can store
	-- named values, the values being organized hirarchically. A value
	-- can be read from its path (similar to a Unix file path) using
	-- the gda_server_operation_get_value_at() method.
	
	-- See the global introduction about DDL about how to use this
	-- object.

inherit
	G_OBJECT

insert
	GDA_SERVER_OPERATION_EXTERNALS
	GDA_SERVER_OPERATION_TYPE
	GDA_SERVER_OPERATION_NODE_TYPE
	GDA_SERVER_OPERATION_NODE_STATUS
	
creation make, from_external_pointer

feature dummy_gobject: POINTER is do unimplemented end

feature {} -- Creation

	make (an_operation_type: INTEGER; an_xml_file: STRING) is
			-- Creates a new GdaServerOperation object from the
			-- `an_xml_file' specifications
			
			-- The xml file must respect the DTD described in the
			-- "libgda-server-operation.dtd" file: its top node must be a
			-- <serv_op> tag.
		require 
			xml_file_not_void: an_xml_file /= Void
			valid_operation: is_valid_operation_type(an_operation_type)
		do
			from_external_pointer(gda_server_operation_new            
										 (an_operation_type, an_xml_file.to_external))
		end

feature 
	operation_type: INTEGER is
			-- the type of operation
		do
			Result := gda_server_operation_get_op_type (handle)
		ensure is_valid_operation_type(Result)
		end

	operation_name (a_type: INTEGER): CONST_STRING is
			-- The string version of type
		do
			create Result.from_external(gda_server_operation_op_type_to_string(a_type))
		end

	--  gda_server_operation_get_node_info ()
	--
	-- GdaServerOperationNode* gda_server_operation_get_node_info
	--                                                         (GdaServerOperation *op,
	--                                                          const gchar *path_format,
	--                                                          ...);
	--
	--   Get information about the node identified by path. The returned
	--   GdaServerOperationNode structure can be copied but not modified; it may
	--   change or cease to exist if op changes
	--
	--   op :          a GdaServerOperation object
	--   path_format : a complete path to a node (starting with "/")
	--   ... :
	--   Returns :     a GdaServerOperationNode structure, or NULL if the node was
	--                 not found
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_get_value_at ()
	--
	-- const GValue*       gda_server_operation_get_value_at   (GdaServerOperation *op,
	--                                                          const gchar *path_format,
	--                                                          ...);
	--
	--   Get the value for the node at the path formed using path_format and ...
	--   (the rules are the same as for g_strdup_printf())
	--
	--   op :          a GdaServerOperation object
	--   path_format : a complete path to a node (starting with "/")
	--   ... :         arguments to use with path_format to make a complete path
	--   Returns :     a constant GValue if a value has been defined, or NULL if
	--                 the value is undefined or if the path is not defined or path
	--                 does not hold any value.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_set_value_at ()
	--
	-- gboolean            gda_server_operation_set_value_at   (GdaServerOperation *op,
	--                                                          const gchar *value,
	--                                                          GError **error,
	--                                                          const gchar *path_format,
	--                                                          ...);
	--
	--   Set the value for the node at the path formed using path_format and ...
	--   the rules are the same as for g_strdup_printf())
	--
	--   Here are the corner cases:
	--
	--     o If the path corresponds to a GdaParameter, then the parameter is set
	--       to value
	--
	--     o If the path corresponds to a sequence item like for example
	--       "/SEQUENCE_NAME/5/NAME" for the "NAME" value of the 6th item of the
	--       "SEQUENCE_NAME" sequence then:
	--
	--          o if the sequence already has 6 or more items, then the value is
	--            just set to the corresponding value in the 6th item of the
	--            sequence
	--
	--          o if the sequence has less then 6 items, then items are added up to
	--            the 6th one before setting the value to the corresponding in the
	--            6th item of the sequence
	--
	--     o If the path corresponds to a GdaDataModel, like for example
	--       "/ARRAY/COLUMN/5" for the value at the 6th row of the "COLUMN" column
	--       of the "ARRAY" data model, then:
	--
	--          o if the data model already contains 6 or more rows, then the value
	--            is just set
	--
	--          o if the data model has less than 6 rows, then rows are added up to
	--            the 6th one before setting the value
	--
	--   op :          a GdaServerOperation object
	--   value :       a string
	--   error :       a place to store errors or NULL
	--   path_format : a complete path to a node (starting with "/")
	--   ... :         arguments to use with path_format to make a complete path
	--   Returns :     TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_save_data_to_xml ()
	--
	-- xmlNodePtr          gda_server_operation_save_data_to_xml
	--                                                         (GdaServerOperation *op,
	--                                                          GError **error);
	--
	--   Creates a new xmlNodePtr tree which can be used to save the op object.
	--   This XML structure can then be saved to disk if necessary. Use xmlFreeNode
	--   to free the associated memory when not needed anymore.
	--
	--   op :      a GdaServerOperation object
	--   error :   a place to store errors or NULL
	--   Returns : a new xmlNodePtr structure, or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_load_data_from_xml ()
	--
	-- gboolean            gda_server_operation_load_data_from_xml
	--                                                         (GdaServerOperation *op,
	--                                                          xmlNodePtr node,
	--                                                          GError **error);
	--
	--   Loads the contents of node into op. The XML tree passed through the node
	--   argument must correspond to an XML tree saved using
	--   gda_server_operation_save_data_to_xml().
	--
	--   op :      a GdaServerOperation object
	--   node :    a xmlNodePtr
	--   error :   a place to store errors or NULL
	--   Returns : TRUE if no error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_get_root_nodes ()
	--
	-- gchar**             gda_server_operation_get_root_nodes (GdaServerOperation *op);
	--
	--   Get an array of strings containing the paths of nodes situated at the root
	--   of op.
	--
	--   op :      a GdaServerOperation object
	--   Returns : a new array, which must be freed with g_strfreev().
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_get_node_type ()
	--
	-- GdaServerOperationNodeType gda_server_operation_get_node_type
	--                                                         (GdaServerOperation *op,
	--                                                          const gchar *path,
	--                                                          GdaServerOperationNodeStatus *status);
	--
	--   Convenience function to get the type of a node.
	--
	--   op :      a GdaServerOperation object
	--   path :    a complete path to a node (starting with "/")
	--   status :  a place to store the status of the node, or NULL
	--   Returns : the type of node, or GDA_SERVER_OPERATION_NODE_UNKNOWN if the
	--             node was not found
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_get_node_parent ()
	--
	-- gchar*              gda_server_operation_get_node_parent
	--                                                         (GdaServerOperation *op,
	--                                                          const gchar *path);
	--
	--   Get the complete path to the parent of the node defined by path
	--
	--   op :      a GdaServerOperation object
	--   path :    a complete path to a node (starting with "/")
	--   Returns : a new string or NULL if the node does not have any parent or
	--             does not exist.
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_get_node_path_portion ()
	--
	-- gchar*              gda_server_operation_get_node_path_portion
	--                                                         (GdaServerOperation *op,
	--                                                          const gchar *path);
	--
	--   Get the last part of path
	--
	--   op :      a GdaServerOperation object
	--   path :    a complete path to a node (starting with "/")
	--   Returns : a new string, or NULL if an error occurred
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_get_sequence_name ()
	--
	-- const gchar*        gda_server_operation_get_sequence_name
	--                                                         (GdaServerOperation *op,
	--                                                          const gchar *path);
	--
	--   op :      a GdaServerOperation object
	--   path :    a complete path to a sequence node (starting with "/")
	--   Returns : the name of the sequence at path
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_get_sequence_size ()
	--
	-- guint               gda_server_operation_get_sequence_size
	--                                                         (GdaServerOperation *op,
	--                                                          const gchar *path);
	--
	--   op :      a GdaServerOperation object
	--   path :    a complete path to a sequence node (starting with "/")
	--   Returns : the number of items in the sequence at path, or 0 if path is not
	--             a sequence node
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_get_sequence_max_size ()
	--
	-- guint               gda_server_operation_get_sequence_max_size
	--                                                         (GdaServerOperation *op,
	--                                                          const gchar *path);
	--
	--   op :      a GdaServerOperation object
	--   path :    a complete path to a sequence node (starting with "/")
	--   Returns : the maximum number of items in the sequence at path, or 0 if
	--             path is not a sequence node
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_get_sequence_min_size ()
	--
	-- guint               gda_server_operation_get_sequence_min_size
	--                                                         (GdaServerOperation *op,
	--                                                          const gchar *path);
	--
	--   op :      a GdaServerOperation object
	--   path :    a complete path to a sequence node (starting with "/")
	--   Returns : the minimum number of items in the sequence at path, or 0 if
	--             path is not a sequence node
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_get_sequence_item_names ()
	--
	-- gchar**             gda_server_operation_get_sequence_item_names
	--                                                         (GdaServerOperation *op,
	--                                                          const gchar *path);
	--
	--   Fetch the contents of a sequence. path can describe either a sequence (for
	--   example "/SEQNAME") or an item in a sequence (for example "/SEQNAME/3")
	--
	--   op :      a GdaServerOperation object
	--   path :    a complete path to a sequence node (starting with "/")
	--   Returns : a array of strings containing the complete paths of the nodes
	--             contained at path (free with g_strfreev())
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_add_item_to_sequence ()
	--
	-- guint               gda_server_operation_add_item_to_sequence
	--                                                         (GdaServerOperation *op,
	--                                                          const gchar *path);
	--
	--   op :
	--   path :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_del_item_from_sequence ()
	--
	-- gboolean            gda_server_operation_del_item_from_sequence
	--                                                         (GdaServerOperation *op,
	--                                                          const gchar *item_path);
	--
	--   op :
	--   item_path :
	--   Returns :
	--
	--   --------------------------------------------------------------------------
	--
	--  gda_server_operation_is_valid ()
	--
	-- gboolean            gda_server_operation_is_valid       (GdaServerOperation *op,
	--                                                          const gchar *xml_file,
	--                                                          GError **error);
	--
	--   Tells if all the required values in op have been defined.
	--
	--   if xml_file is not NULL, the validity of op is tested against that
	--   specification, and not againts the current op's specification.
	--
	--   op :       a GdaServerOperation widget
	--   xml_file : a XML specification file (see gda_server_operation_new())
	--   error :    a place to store an error, or NULL
	--   Returns :  TRUE if op is valid

feature --Properties
	--
	--
	--   "connection"               GdaConnection         : Write / Construct Only
	--   "dict"                     GdaDict               : Write / Construct Only
	--   "op-type"                  gint                  : Read / Write / Construct Only
	--   "provider-obj"             GdaServerProvider     : Write / Construct Only
	--   "spec-file"                gchararray            : Write / Construct Only
	--Property Details
	--
	--  The "connection" property
	--
	--   "connection"               GdaConnection         : Write / Construct Only
	--
	--   --------------------------------------------------------------------------
	--
	--  The "dict" property
	--
	--   "dict"                     GdaDict               : Write / Construct Only
	--
	--   --------------------------------------------------------------------------
	--
	--  The "op-type" property
	--
	--   "op-type"                  gint                  : Read / Write / Construct Only
	--
	--   Allowed values: [0,8]
	--
	--   Default value: 0
	--
	--   --------------------------------------------------------------------------
	--
	--  The "provider-obj" property
	--
	--   "provider-obj"             GdaServerProvider     : Write / Construct Only
	--
	--   --------------------------------------------------------------------------
	--
	--  The "spec-file" property
	--
	--   "spec-file"                gchararray            : Write / Construct Only
	--
	--   Default value: NULL
	--
feature -- Signals
	--   "sequence-item-added"                            : Run First
	--   "sequence-item-remove"                           : Run First
	--Signal Details
	--
	--  The "sequence-item-added" signal
	--
	-- void                user_function                      (GdaServerOperation *gdaserveroperation,
	--                                                         gchar              *arg1,
	--                                                         gint                arg2,
	--                                                         gpointer            user_data)               : Run First
	--
	--   gdaserveroperation : the object which received the signal.
	--   arg1 :
	--   arg2 :
	--   user_data :          user data set when the signal handler was connected.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "sequence-item-remove" signal
	--
	-- void                user_function                      (GdaServerOperation *gdaserveroperation,
	--                                                         gchar              *arg1,
	--                                                         gint                arg2,
	--                                                         gpointer            user_data)               : Run First
	--
	--   gdaserveroperation : the object which received the signal.
	--   arg1 :
	--   arg2 :
	--   user_data :          user data set when the signal handler was connected.

feature {} -- Unwrapped

	--  GdaServerOperationNode
	--
	-- typedef struct {
	--         GdaServerOperationNodeType    type;
	--         GdaServerOperationNodeStatus  status;
	--
	--         GdaParameterList             *plist;
	--         GdaDataModel                 *model;
	--         GdaColumn                    *column;
	--         GdaParameter                 *param;
	--         gpointer                      priv;
	-- } GdaServerOperationNode;
	--

end -- class GDA_SERVER_OPERATION
