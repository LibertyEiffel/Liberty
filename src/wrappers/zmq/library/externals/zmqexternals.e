-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class ZMQEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	zmq_init (an_app_threads: INTEGER_32; an_io_threads: INTEGER_32; a_flags: INTEGER_32): POINTER is
 		-- zmq_init (node at line 5)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_init"
		}"
		end

	zmq_setsockopt (a_s: POINTER; an_option: INTEGER_32; an_optval: POINTER; an_optvallen: NATURAL_32): INTEGER_32 is
 		-- zmq_setsockopt (node at line 10)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_setsockopt"
		}"
		end

	zmq_msg_init_size (a_msg: POINTER; a_size: NATURAL_32): INTEGER_32 is
 		-- zmq_msg_init_size (node at line 43)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_init_size"
		}"
		end

	zmq_send (a_s: POINTER; a_msg: POINTER; a_flags: INTEGER_32): INTEGER_32 is
 		-- zmq_send (node at line 112)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_send"
		}"
		end

	zmq_msg_copy (a_dest: POINTER; a_src: POINTER): INTEGER_32 is
 		-- zmq_msg_copy (node at line 123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_copy"
		}"
		end

	zmq_stopwatch_stop (a_watch: POINTER): NATURAL_32 is
 		-- zmq_stopwatch_stop (node at line 152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_stopwatch_stop"
		}"
		end

	zmq_msg_close (a_msg: POINTER): INTEGER_32 is
 		-- zmq_msg_close (node at line 185)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_close"
		}"
		end

	zmq_msg_size (a_msg: POINTER): NATURAL_32 is
 		-- zmq_msg_size (node at line 188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_size"
		}"
		end

	zmq_socket (a_context: POINTER; a_type: INTEGER_32): POINTER is
 		-- zmq_socket (node at line 198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_socket"
		}"
		end

	zmq_strerror (an_errnum: INTEGER_32): POINTER is
 		-- zmq_strerror (node at line 213)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_strerror"
		}"
		end

	zmq_close (a_s: POINTER): INTEGER_32 is
 		-- zmq_close (node at line 248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_close"
		}"
		end

	zmq_sleep (a_seconds: INTEGER_32) is
 		-- zmq_sleep (node at line 253)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_sleep"
		}"
		end

	zmq_msg_init_data (a_msg: POINTER; a_data: POINTER; a_size: NATURAL_32; a_ffn: POINTER; a_hint: POINTER): INTEGER_32 is
 		-- zmq_msg_init_data (node at line 270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_init_data"
		}"
		end

	zmq_term (a_context: POINTER): INTEGER_32 is
 		-- zmq_term (node at line 283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_term"
		}"
		end

	zmq_flush (a_s: POINTER): INTEGER_32 is
 		-- zmq_flush (node at line 321)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_flush"
		}"
		end

	zmq_connect (a_s: POINTER; an_addr: POINTER): INTEGER_32 is
 		-- zmq_connect (node at line 354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_connect"
		}"
		end

	zmq_msg_data (a_msg: POINTER): POINTER is
 		-- zmq_msg_data (node at line 365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_data"
		}"
		end

	zmq_bind (a_s: POINTER; an_addr: POINTER): INTEGER_32 is
 		-- zmq_bind (node at line 368)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_bind"
		}"
		end

	zmq_recv (a_s: POINTER; a_msg: POINTER; a_flags: INTEGER_32): INTEGER_32 is
 		-- zmq_recv (node at line 372)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_recv"
		}"
		end

	zmq_stopwatch_start: POINTER is
 		-- zmq_stopwatch_start (node at line 377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_stopwatch_start()"
		}"
		end

	zmq_poll (an_items: POINTER; a_nitems: INTEGER_32; a_timeout: INTEGER_32): INTEGER_32 is
 		-- zmq_poll (node at line 389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_poll"
		}"
		end

	zmq_msg_move (a_dest: POINTER; a_src: POINTER): INTEGER_32 is
 		-- zmq_msg_move (node at line 413)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_move"
		}"
		end

	zmq_msg_init (a_msg: POINTER): INTEGER_32 is
 		-- zmq_msg_init (node at line 477)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "zmq_msg_init"
		}"
		end


end -- class ZMQEXTERNALS
