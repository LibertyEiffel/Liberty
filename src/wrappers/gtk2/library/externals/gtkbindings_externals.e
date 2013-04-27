-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBINDINGS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_binding_entry_add_signal (a_binding_set: POINTER; a_keyval: NATURAL; a_modifiers: INTEGER; a_signal_name: POINTER; a_n_args: NATURAL) is
 		-- gtk_binding_entry_add_signal (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_add_signal"
		}"
		end

	gtk_binding_entry_add_signall (a_binding_set: POINTER; a_keyval: NATURAL; a_modifiers: INTEGER; a_signal_name: POINTER; a_binding_args: POINTER) is
 		-- gtk_binding_entry_add_signall
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_add_signall"
		}"
		end

	-- `hidden' function _gtk_binding_entry_add_signall skipped.
	gtk_binding_entry_remove (a_binding_set: POINTER; a_keyval: NATURAL; a_modifiers: INTEGER) is
 		-- gtk_binding_entry_remove
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_remove"
		}"
		end

	gtk_binding_entry_skip (a_binding_set: POINTER; a_keyval: NATURAL; a_modifiers: INTEGER) is
 		-- gtk_binding_entry_skip
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_entry_skip"
		}"
		end

	-- `hidden' function _gtk_binding_parse_binding skipped.
	-- `hidden' function _gtk_binding_reset_parsed skipped.
	gtk_binding_set_activate (a_binding_set: POINTER; a_keyval: NATURAL; a_modifiers: INTEGER; an_object: POINTER): INTEGER is
 		-- gtk_binding_set_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_activate"
		}"
		end

	gtk_binding_set_add_path (a_binding_set: POINTER; a_path_type: INTEGER; a_path_pattern: POINTER; a_priority: INTEGER) is
 		-- gtk_binding_set_add_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_add_path"
		}"
		end

	gtk_binding_set_by_class (an_object_class: POINTER): POINTER is
 		-- gtk_binding_set_by_class
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_by_class"
		}"
		end

	gtk_binding_set_find (a_set_name: POINTER): POINTER is
 		-- gtk_binding_set_find
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_find"
		}"
		end

	gtk_binding_set_new (a_set_name: POINTER): POINTER is
 		-- gtk_binding_set_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_set_new"
		}"
		end

	gtk_bindings_activate (an_object: POINTER; a_keyval: NATURAL; a_modifiers: INTEGER): INTEGER is
 		-- gtk_bindings_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_bindings_activate"
		}"
		end

	gtk_bindings_activate_event (an_object: POINTER; an_event: POINTER): INTEGER is
 		-- gtk_bindings_activate_event
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_bindings_activate_event"
		}"
		end


end -- class GTKBINDINGS_EXTERNALS
