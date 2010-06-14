-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBINDINGS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_bindings_activate (an_object: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER): INTEGER_32 is
 		-- gtk_bindings_activate (node at line 1711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_bindings_activate"
		}"
		end

	-- `hidden' function _gtk_binding_reset_parsed skipped.
	gtk_binding_set_activate (a_binding_set: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER; an_object: POINTER): INTEGER_32 is
 		-- gtk_binding_set_activate (node at line 7966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_activate"
		}"
		end

	gtk_binding_entry_skip (a_binding_set: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER) is
 		-- gtk_binding_entry_skip (node at line 8127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_skip"
		}"
		end

	gtk_binding_entry_add_signall (a_binding_set: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER; a_signal_name: POINTER; a_binding_args: POINTER) is
 		-- gtk_binding_entry_add_signall (node at line 9782)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_add_signall"
		}"
		end

	gtk_binding_set_new (a_set_name: POINTER): POINTER is
 		-- gtk_binding_set_new (node at line 11595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_new"
		}"
		end

	gtk_binding_set_by_class (an_object_class: POINTER): POINTER is
 		-- gtk_binding_set_by_class (node at line 15695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_by_class"
		}"
		end

	gtk_binding_set_find (a_set_name: POINTER): POINTER is
 		-- gtk_binding_set_find (node at line 16068)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_find"
		}"
		end

	gtk_binding_entry_add_signal (a_binding_set: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER; a_signal_name: POINTER; a_n_args: NATURAL_32) is
 		-- gtk_binding_entry_add_signal (variadic call)  (node at line 19627)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_add_signal"
		}"
		end

	-- `hidden' function _gtk_binding_parse_binding skipped.
	gtk_binding_entry_remove (a_binding_set: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER) is
 		-- gtk_binding_entry_remove (node at line 24085)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_remove"
		}"
		end

	-- `hidden' function _gtk_binding_entry_add_signall skipped.
	gtk_bindings_activate_event (an_object: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_bindings_activate_event (node at line 29781)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_bindings_activate_event"
		}"
		end

	gtk_binding_entry_clear (a_binding_set: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER) is
 		-- gtk_binding_entry_clear (node at line 31042)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_clear"
		}"
		end

	gtk_binding_set_add_path (a_binding_set: POINTER; a_path_type: INTEGER; a_path_pattern: POINTER; a_priority: INTEGER) is
 		-- gtk_binding_set_add_path (node at line 31717)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_add_path"
		}"
		end

	gtk_binding_parse_binding (a_scanner: POINTER): NATURAL_32 is
 		-- gtk_binding_parse_binding (node at line 34981)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_parse_binding"
		}"
		end


end -- class GTKBINDINGS_EXTERNALS
