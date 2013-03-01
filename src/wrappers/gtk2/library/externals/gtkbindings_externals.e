-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBINDINGS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_bindings_activate (an_object: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER): INTEGER_32 is
 		-- gtk_bindings_activate (node at line 1648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_bindings_activate"
		}"
		end

	-- `hidden' function _gtk_binding_reset_parsed skipped.
	gtk_binding_set_activate (a_binding_set: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER; an_object: POINTER): INTEGER_32 is
 		-- gtk_binding_set_activate (node at line 8681)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_activate"
		}"
		end

	gtk_binding_entry_skip (a_binding_set: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER) is
 		-- gtk_binding_entry_skip (node at line 8807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_skip"
		}"
		end

	gtk_binding_entry_add_signall (a_binding_set: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER; a_signal_name: POINTER; a_binding_args: POINTER) is
 		-- gtk_binding_entry_add_signall (node at line 10570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_add_signall"
		}"
		end

	gtk_binding_entry_add_signal (a_binding_set: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER; a_signal_name: POINTER; a_n_args: NATURAL_32) is
 		-- gtk_binding_entry_add_signal (variadic call)  (node at line 10967)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_add_signal"
		}"
		end

	gtk_binding_set_new (a_set_name: POINTER): POINTER is
 		-- gtk_binding_set_new (node at line 12642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_new"
		}"
		end

	gtk_binding_set_find (a_set_name: POINTER): POINTER is
 		-- gtk_binding_set_find (node at line 17460)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_find"
		}"
		end

	-- `hidden' function _gtk_binding_parse_binding skipped.
	gtk_binding_entry_remove (a_binding_set: POINTER; a_keyval: NATURAL_32; a_modifiers: INTEGER) is
 		-- gtk_binding_entry_remove (node at line 26599)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_remove"
		}"
		end

	-- `hidden' function _gtk_binding_entry_add_signall skipped.
	gtk_bindings_activate_event (an_object: POINTER; an_event: POINTER): INTEGER_32 is
 		-- gtk_bindings_activate_event (node at line 32834)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_bindings_activate_event"
		}"
		end

	gtk_binding_set_add_path (a_binding_set: POINTER; a_path_type: INTEGER; a_path_pattern: POINTER; a_priority: INTEGER) is
 		-- gtk_binding_set_add_path (node at line 35096)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_add_path"
		}"
		end

	gtk_binding_set_by_class (an_object_class: POINTER): POINTER is
 		-- gtk_binding_set_by_class (node at line 40414)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_by_class"
		}"
		end


end -- class GTKBINDINGS_EXTERNALS
