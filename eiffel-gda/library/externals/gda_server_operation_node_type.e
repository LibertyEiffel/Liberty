indexing
	description: "Enum "
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"

deferred class GDA_SERVER_OPERATION_NODE_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum
	is_valid_operation_node_type (a_type: INTEGER): BOOLEAN is
		do	
			Result:=((a_type = gda_server_operation_node_paramlist) or else
						(a_type = gda_server_operation_node_data_model) or else
						(a_type = gda_server_operation_node_param) or else
						(a_type = gda_server_operation_node_sequence) or else
						(a_type = gda_server_operation_node_sequence_item) or else
						(a_type = gda_server_operation_node_data_model_column) or else
						(a_type = gda_server_operation_node_unknown))
		end

	gda_server_operation_node_paramlist: INTEGER is
			-- GDA_SERVER_OPERATION_NODE_PARAMLIST
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_NODE_PARAMLIST"
		end

	gda_server_operation_node_data_model: INTEGER is
			-- GDA_SERVER_OPERATION_NODE_DATA_MODEL
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_NODE_DATA_MODEL"
		end

	gda_server_operation_node_param: INTEGER is
			-- GDA_SERVER_OPERATION_NODE_PARAM
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_NODE_PARAM"
		end

	gda_server_operation_node_sequence: INTEGER is
			-- GDA_SERVER_OPERATION_NODE_SEQUENCE
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_NODE_SEQUENCE"
		end

	gda_server_operation_node_sequence_item: INTEGER is
			-- GDA_SERVER_OPERATION_NODE_SEQUENCE_ITEM
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_NODE_SEQUENCE_ITEM"
		end

	gda_server_operation_node_data_model_column: INTEGER is
			-- GDA_SERVER_OPERATION_NODE_DATA_MODEL_COLUMN
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_NODE_DATA_MODEL_COLUMN"
		end

	gda_server_operation_node_unknown: INTEGER is
			-- GDA_SERVER_OPERATION_NODE_UNKNOWN
		external "C macro use <libgda/libgda.h>"
		alias "GDA_SERVER_OPERATION_NODE_UNKNOWN"
		end
end
