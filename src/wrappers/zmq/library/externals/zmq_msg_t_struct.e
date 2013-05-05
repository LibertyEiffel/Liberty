-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class ZMQ_MSG_T_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	ZMQ_TYPES
feature {} -- Low-level setters

	zmq_msg_t_struct_set_content (a_structure: POINTER; a_value: POINTER) is
			-- Setter for content field of ZMQ_MSG_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_t_struct_set_content"
		}"
		end

	zmq_msg_t_struct_set_flags (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for flags field of ZMQ_MSG_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_t_struct_set_flags"
		}"
		end

	zmq_msg_t_struct_set_vsm_size (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for vsm_size field of ZMQ_MSG_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_t_struct_set_vsm_size"
		}"
		end

	zmq_msg_t_struct_set_vsm_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for vsm_data field of ZMQ_MSG_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_t_struct_set_vsm_data"
		}"
		end

feature {} -- Low-level queries

	zmq_msg_t_struct_get_content (a_structure: POINTER): POINTER is
			-- Query for content field of ZMQ_MSG_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_t_struct_get_content"
		}"
		end

	zmq_msg_t_struct_get_flags (a_structure: POINTER): CHARACTER is
			-- Query for flags field of ZMQ_MSG_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_t_struct_get_flags"
		}"
		end

	zmq_msg_t_struct_get_vsm_size (a_structure: POINTER): CHARACTER is
			-- Query for vsm_size field of ZMQ_MSG_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_t_struct_get_vsm_size"
		}"
		end

	zmq_msg_t_struct_get_vsm_data (a_structure: POINTER): POINTER is
			-- Query for vsm_data field of ZMQ_MSG_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_t_struct_get_vsm_data"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_zmq_msg_t"
		}"
		end

end -- class ZMQ_MSG_T_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

