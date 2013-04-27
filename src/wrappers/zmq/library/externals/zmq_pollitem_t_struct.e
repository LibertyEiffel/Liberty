-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class ZMQ_POLLITEM_T_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	ZMQ_TYPES
feature {} -- Low-level setters

	zmq_pollitem_t_struct_set_socket (a_structure: POINTER; a_value: POINTER) is
			-- Setter for socket field of ZMQ_POLLITEM_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_pollitem_t_struct_set_socket"
		}"
		end

	zmq_pollitem_t_struct_set_fd (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for fd field of ZMQ_POLLITEM_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_pollitem_t_struct_set_fd"
		}"
		end

	zmq_pollitem_t_struct_set_events (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for events field of ZMQ_POLLITEM_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_pollitem_t_struct_set_events"
		}"
		end

	zmq_pollitem_t_struct_set_revents (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for revents field of ZMQ_POLLITEM_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_pollitem_t_struct_set_revents"
		}"
		end

feature {} -- Low-level queries

	zmq_pollitem_t_struct_get_socket (a_structure: POINTER): POINTER is
			-- Query for socket field of ZMQ_POLLITEM_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_pollitem_t_struct_get_socket"
		}"
		end

	zmq_pollitem_t_struct_get_fd (a_structure: POINTER): INTEGER is
			-- Query for fd field of ZMQ_POLLITEM_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_pollitem_t_struct_get_fd"
		}"
		end

	zmq_pollitem_t_struct_get_events (a_structure: POINTER): INTEGER_16 is
			-- Query for events field of ZMQ_POLLITEM_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_pollitem_t_struct_get_events"
		}"
		end

	zmq_pollitem_t_struct_get_revents (a_structure: POINTER): INTEGER_16 is
			-- Query for revents field of ZMQ_POLLITEM_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_pollitem_t_struct_get_revents"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_zmq_pollitem_t"
		}"
		end

end -- class ZMQ_POLLITEM_T_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

