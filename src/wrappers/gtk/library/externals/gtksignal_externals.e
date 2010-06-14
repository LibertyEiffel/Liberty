-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSIGNAL_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_signal_newv (a_name: POINTER; a_signal_flags: INTEGER; an_object_type: NATURAL_32; a_function_offset: NATURAL_32; a_marshaller: POINTER; a_return_val: NATURAL_32; a_n_args: NATURAL_32; an_args: POINTER): NATURAL_32 is
 		-- gtk_signal_newv (node at line 2688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_signal_newv"
		}"
		end

	gtk_signal_emit_by_name (an_object: POINTER; a_name: POINTER) is
 		-- gtk_signal_emit_by_name (variadic call)  (node at line 7286)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_signal_emit_by_name"
		}"
		end

	gtk_signal_emit (an_object: POINTER; a_signal_id: NATURAL_32) is
 		-- gtk_signal_emit (variadic call)  (node at line 11947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_signal_emit"
		}"
		end

	gtk_signal_connect_while_alive (an_object: POINTER; a_name: POINTER; a_func: POINTER; a_func_data: POINTER; an_alive_object: POINTER) is
 		-- gtk_signal_connect_while_alive (node at line 12155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_signal_connect_while_alive"
		}"
		end

	gtk_signal_emit_stop_by_name (an_object: POINTER; a_name: POINTER) is
 		-- gtk_signal_emit_stop_by_name (node at line 14551)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_signal_emit_stop_by_name"
		}"
		end

	gtk_signal_emitv (an_object: POINTER; a_signal_id: NATURAL_32; an_args: POINTER) is
 		-- gtk_signal_emitv (node at line 15060)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_signal_emitv"
		}"
		end

	gtk_signal_connect_full (an_object: POINTER; a_name: POINTER; a_func: POINTER; an_unsupported: POINTER; a_data: POINTER; a_destroy_func: POINTER; an_object_signal: INTEGER_32; an_after: INTEGER_32): NATURAL_32 is
 		-- gtk_signal_connect_full (node at line 27695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_signal_connect_full"
		}"
		end

	gtk_signal_connect_object_while_alive (an_object: POINTER; a_name: POINTER; a_func: POINTER; an_alive_object: POINTER) is
 		-- gtk_signal_connect_object_while_alive (node at line 30775)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_signal_connect_object_while_alive"
		}"
		end

	gtk_signal_new (a_name: POINTER; a_signal_flags: INTEGER; an_object_type: NATURAL_32; a_function_offset: NATURAL_32; a_marshaller: POINTER; a_return_val: NATURAL_32; a_n_args: NATURAL_32): NATURAL_32 is
 		-- gtk_signal_new (variadic call)  (node at line 32117)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_signal_new"
		}"
		end

	gtk_signal_compat_matched (an_object: POINTER; a_func: POINTER; a_data: POINTER; a_match: INTEGER; an_action: NATURAL_32) is
 		-- gtk_signal_compat_matched (node at line 33478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_signal_compat_matched"
		}"
		end

	gtk_signal_emitv_by_name (an_object: POINTER; a_name: POINTER; an_args: POINTER) is
 		-- gtk_signal_emitv_by_name (node at line 34625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_signal_emitv_by_name"
		}"
		end


end -- class GTKSIGNAL_EXTERNALS
