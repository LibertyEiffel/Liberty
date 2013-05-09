-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class ZMQ_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	zmq_bind (a_s: POINTER; an_addr: POINTER): INTEGER is
 		-- zmq_bind
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_bind"
		}"
		end

	zmq_close (a_s: POINTER): INTEGER is
 		-- zmq_close
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_close"
		}"
		end

	zmq_connect (a_s: POINTER; an_addr: POINTER): INTEGER is
 		-- zmq_connect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_connect"
		}"
		end

	zmq_device (a_device: INTEGER; an_insocket: POINTER; an_outsocket: POINTER): INTEGER is
 		-- zmq_device
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_device"
		}"
		end

	zmq_errno: INTEGER is
 		-- zmq_errno
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_errno()"
		}"
		end

	zmq_getsockopt (a_s: POINTER; an_option: INTEGER; an_optval: POINTER; an_optvallen: POINTER): INTEGER is
 		-- zmq_getsockopt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_getsockopt"
		}"
		end

	zmq_init (an_io_threads: INTEGER): POINTER is
 		-- zmq_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_init"
		}"
		end

	zmq_msg_close (a_msg: POINTER): INTEGER is
 		-- zmq_msg_close
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_close"
		}"
		end

	zmq_msg_copy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- zmq_msg_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_copy"
		}"
		end

	zmq_msg_data (a_msg: POINTER): POINTER is
 		-- zmq_msg_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_data"
		}"
		end

	zmq_msg_init (a_msg: POINTER): INTEGER is
 		-- zmq_msg_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_init"
		}"
		end

	zmq_msg_init_data (a_msg: POINTER; a_data: POINTER; a_size: like size_t; a_ffn: POINTER; a_hint: POINTER): INTEGER is
 		-- zmq_msg_init_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_init_data"
		}"
		end

	zmq_msg_init_size (a_msg: POINTER; a_size: like size_t): INTEGER is
 		-- zmq_msg_init_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_init_size"
		}"
		end

	zmq_msg_move (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- zmq_msg_move
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_move"
		}"
		end

	zmq_msg_size (a_msg: POINTER): like size_t is
 		-- zmq_msg_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_size"
		}"
		end

	zmq_poll (an_items: POINTER; a_nitems: INTEGER; a_timeout: like long): INTEGER is
 		-- zmq_poll
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_poll"
		}"
		end

	zmq_recv (a_s: POINTER; a_msg: POINTER; a_flags: INTEGER): INTEGER is
 		-- zmq_recv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_recv"
		}"
		end

	zmq_send (a_s: POINTER; a_msg: POINTER; a_flags: INTEGER): INTEGER is
 		-- zmq_send
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_send"
		}"
		end

	zmq_setsockopt (a_s: POINTER; an_option: INTEGER; an_optval: POINTER; an_optvallen: like size_t): INTEGER is
 		-- zmq_setsockopt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_setsockopt"
		}"
		end

	zmq_socket (a_context: POINTER; a_type: INTEGER): POINTER is
 		-- zmq_socket
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_socket"
		}"
		end

	zmq_strerror (an_errnum: INTEGER): POINTER is
 		-- zmq_strerror
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_strerror"
		}"
		end

	zmq_term (a_context: POINTER): INTEGER is
 		-- zmq_term
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_term"
		}"
		end

	zmq_version (a_major: POINTER; a_minor: POINTER; a_patch: POINTER) is
 		-- zmq_version
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_version"
		}"
		end


end -- class ZMQ_EXTERNALS
