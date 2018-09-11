-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class ZMQ_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- `hidden' function __builtin_memcpy skipped.
	zmq_bind (a_s: POINTER; an_addr: POINTER): INTEGER 

		-- function zmq_bind (in `/usr/include/zmq.h')
               -- zmq_bind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_bind"
               }"
               end

	zmq_close (a_s: POINTER): INTEGER 

		-- function zmq_close (in `/usr/include/zmq.h')
               -- zmq_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_close"
               }"
               end

	zmq_connect (a_s: POINTER; an_addr: POINTER): INTEGER 

		-- function zmq_connect (in `/usr/include/zmq.h')
               -- zmq_connect
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_connect"
               }"
               end

	zmq_device (a_device: INTEGER; an_insocket: POINTER; an_outsocket: POINTER): INTEGER 

		-- function zmq_device (in `/usr/include/zmq.h')
               -- zmq_device
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_device"
               }"
               end

	zmq_errno: INTEGER 

		-- function zmq_errno (in `/usr/include/zmq.h')
               -- zmq_errno
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_errno()"
               }"
               end

	zmq_getsockopt (a_s: POINTER; an_option: INTEGER; an_optval: POINTER; an_optvallen: POINTER): INTEGER 

		-- function zmq_getsockopt (in `/usr/include/zmq.h')
               -- zmq_getsockopt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_getsockopt"
               }"
               end

	zmq_init (an_io_threads: INTEGER): POINTER 

		-- function zmq_init (in `/usr/include/zmq.h')
               -- zmq_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_init"
               }"
               end

	zmq_msg_close (a_msg: POINTER): INTEGER 

		-- function zmq_msg_close (in `/usr/include/zmq.h')
               -- zmq_msg_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_msg_close"
               }"
               end

	zmq_msg_copy (a_dest: POINTER; a_src: POINTER): INTEGER 

		-- function zmq_msg_copy (in `/usr/include/zmq.h')
               -- zmq_msg_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_msg_copy"
               }"
               end

	zmq_msg_data (a_msg: POINTER): POINTER 

		-- function zmq_msg_data (in `/usr/include/zmq.h')
               -- zmq_msg_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_msg_data"
               }"
               end

	zmq_msg_init (a_msg: POINTER): INTEGER 

		-- function zmq_msg_init (in `/usr/include/zmq.h')
               -- zmq_msg_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_msg_init"
               }"
               end

	zmq_msg_init_data (a_msg: POINTER; a_data: POINTER; a_size: like size_t; a_ffn: POINTER; a_hint: POINTER): INTEGER 

		-- function zmq_msg_init_data (in `/usr/include/zmq.h')
               -- zmq_msg_init_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_msg_init_data"
               }"
               end

	zmq_msg_init_size (a_msg: POINTER; a_size: like size_t): INTEGER 

		-- function zmq_msg_init_size (in `/usr/include/zmq.h')
               -- zmq_msg_init_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_msg_init_size"
               }"
               end

	zmq_msg_move (a_dest: POINTER; a_src: POINTER): INTEGER 

		-- function zmq_msg_move (in `/usr/include/zmq.h')
               -- zmq_msg_move
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_msg_move"
               }"
               end

	zmq_msg_size (a_msg: POINTER): like size_t 

		-- function zmq_msg_size (in `/usr/include/zmq.h')
               -- zmq_msg_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_msg_size"
               }"
               end

	zmq_poll (an_items: POINTER; a_nitems: INTEGER; a_timeout: like long): INTEGER 

		-- function zmq_poll (in `/usr/include/zmq.h')
               -- zmq_poll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_poll"
               }"
               end

	zmq_recv (a_s: POINTER; a_msg: POINTER; a_flags: INTEGER): INTEGER 

		-- function zmq_recv (in `/usr/include/zmq.h')
               -- zmq_recv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_recv"
               }"
               end

	zmq_send (a_s: POINTER; a_msg: POINTER; a_flags: INTEGER): INTEGER 

		-- function zmq_send (in `/usr/include/zmq.h')
               -- zmq_send
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_send"
               }"
               end

	zmq_setsockopt (a_s: POINTER; an_option: INTEGER; an_optval: POINTER; an_optvallen: like size_t): INTEGER 

		-- function zmq_setsockopt (in `/usr/include/zmq.h')
               -- zmq_setsockopt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_setsockopt"
               }"
               end

	zmq_socket (a_context: POINTER; a_type: INTEGER): POINTER 

		-- function zmq_socket (in `/usr/include/zmq.h')
               -- zmq_socket
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_socket"
               }"
               end

	zmq_strerror (an_errnum: INTEGER): POINTER 

		-- function zmq_strerror (in `/usr/include/zmq.h')
               -- zmq_strerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_strerror"
               }"
               end

	zmq_term (a_context: POINTER): INTEGER 

		-- function zmq_term (in `/usr/include/zmq.h')
               -- zmq_term
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_term"
               }"
               end

	zmq_version (a_major: POINTER; a_minor: POINTER; a_patch: POINTER) 

		-- function zmq_version (in `/usr/include/zmq.h')
               -- zmq_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zmq_version"
               }"
               end


end -- class ZMQ_EXTERNALS
