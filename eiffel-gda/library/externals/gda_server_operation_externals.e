indexing
	description: "External calls for "
	copyright: "Copyright (C) 2007 $EWLC_developer, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_SERVER_OPERATION_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gda_server_operation_new (an_op_type: INTEGER; an_xml_file: POINTER): POINTER is
			--  GdaServerOperation* gda_server_operation_new
			--  (GdaServerOperationType op_type, const gchar *xml_file)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_get_op_type (an_op: POINTER): INTEGER is
			--  GdaServerOperationType gda_server_operation_get_op_type (GdaServerOperation *op)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_op_type_to_string (a_type: INTEGER): POINTER is
			--  const gchar* gda_server_operation_op_type_to_string (GdaServerOperationType type)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_get_node_info (an_op, a_path_format: POINTER): POINTER is
			--  GdaServerOperationNode* gda_server_operation_get_node_info (GdaServerOperation *op, const gchar *path_format, ...)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_get_value_at (an_op, a_path_format: POINTER): POINTER is
			--  const GValue* gda_server_operation_get_value_at (GdaServerOperation *op, const gchar *path_format, ...)
		external "C use <libgda/libgda.h>"
		end
	
	gda_server_operation_set_value_at (an_op, a_value, an_error_ref, a_path_format: POINTER): INTEGER is
			--  gboolean gda_server_operation_set_value_at (GdaServerOperation *op, const gchar *value, GError **error, const gchar *path_format, ...)
		external "C use <libgda/libgda.h>"
		end

	--  xmlNodePtr gda_server_operation_save_data_to_xml (GdaServerOperation *op, GError **error)
	
	gda_server_operation_load_data_from_xml (an_op, an_xmlnodeptr, an_error_ref: POINTER): INTEGER is
			--  gboolean gda_server_operation_load_data_from_xml (GdaServerOperation *op, xmlNodePtr node, GError **error)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_get_root_nodes (an_op: POINTER): POINTER is
			--  gchar** gda_server_operation_get_root_nodes (GdaServerOperation *op)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_get_node_type (an_op, a_path, a_status: POINTER): INTEGER is
			--  GdaServerOperationNodeType gda_server_operation_get_node_type (GdaServerOperation *op, const gchar *path, GdaServerOperationNodeStatus *status)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_get_node_parent (an_op, a_path: POINTER): POINTER is
			--  gchar* gda_server_operation_get_node_parent (GdaServerOperation *op, const gchar *path)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_get_node_path_portion (an_op, a_path: POINTER): POINTER is
			--  gchar* gda_server_operation_get_node_path_portion (GdaServerOperation *op, const gchar *path)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_get_sequence_name (an_op, a_path: POINTER): POINTER is
			--  const gchar* gda_server_operation_get_sequence_name (GdaServerOperation *op, const gchar *path)
		external "C use <libgda/libgda.h>"
		end
	
	gda_server_operation_get_sequence_size (an_op, a_path: POINTER): INTEGER is
			--  guint gda_server_operation_get_sequence_size (GdaServerOperation *op, const gchar *path)
		external "C use <libgda/libgda.h>"
		end
	
	gda_server_operation_get_sequence_max_size (an_op, a_path: POINTER): INTEGER is
			--  guint gda_server_operation_get_sequence_max_size (GdaServerOperation *op, const gchar *path)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_get_sequence_min_size (an_op, a_path: POINTER): INTEGER is
			--  guint gda_server_operation_get_sequence_min_size (GdaServerOperation *op, const gchar *path)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_get_sequence_item_names (an_op, a_path: POINTER): POINTER is
			--  gchar** gda_server_operation_get_sequence_item_names (GdaServerOperation *op, const gchar *path)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_add_item_to_sequence (an_op, a_path: POINTER): INTEGER is
			--  guint gda_server_operation_add_item_to_sequence (GdaServerOperation *op, const gchar *path)
		external "C use <libgda/libgda.h>"
		end

	gda_server_operation_del_item_from_sequence (an_op, an_item_path: POINTER): INTEGER is
			--  gboolean gda_server_operation_del_item_from_sequence (GdaServerOperation *op, const gchar *item_path)
		external "C use <libgda/libgda.h>"
		end
	
	gda_server_operation_is_valid (an_op, an_xml_file, an_error_ref: POINTER): INTEGER is
			--  gboolean gda_server_operation_is_valid (GdaServerOperation *op, const gchar *xml_file, GError **error)
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaServerOperation)"
		end
end
