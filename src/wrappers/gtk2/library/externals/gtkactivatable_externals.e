-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACTIVATABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_activatable_get_type: NATURAL_64 is
 		-- gtk_activatable_get_type (node at line 6081)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_get_type()"
		}"
		end

	gtk_activatable_set_use_action_appearance (an_activatable: POINTER; an_use_appearance: INTEGER_32) is
 		-- gtk_activatable_set_use_action_appearance (node at line 13041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_set_use_action_appearance"
		}"
		end

	gtk_activatable_set_related_action (an_activatable: POINTER; an_action: POINTER) is
 		-- gtk_activatable_set_related_action (node at line 18803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_set_related_action"
		}"
		end

	gtk_activatable_get_use_action_appearance (an_activatable: POINTER): INTEGER_32 is
 		-- gtk_activatable_get_use_action_appearance (node at line 23051)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_get_use_action_appearance"
		}"
		end

	gtk_activatable_get_related_action (an_activatable: POINTER): POINTER is
 		-- gtk_activatable_get_related_action (node at line 32790)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_get_related_action"
		}"
		end

	gtk_activatable_do_set_related_action (an_activatable: POINTER; an_action: POINTER) is
 		-- gtk_activatable_do_set_related_action (node at line 39028)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_do_set_related_action"
		}"
		end

	gtk_activatable_sync_action_properties (an_activatable: POINTER; an_action: POINTER) is
 		-- gtk_activatable_sync_action_properties (node at line 39317)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_sync_action_properties"
		}"
		end


end -- class GTKACTIVATABLE_EXTERNALS
