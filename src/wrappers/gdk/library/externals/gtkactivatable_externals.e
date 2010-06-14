-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACTIVATABLE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_activatable_get_type: NATURAL_32 is
 		-- gtk_activatable_get_type (node at line 5785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_get_type()"
		}"
		end

	gtk_activatable_set_use_action_appearance (an_activatable: POINTER; an_use_appearance: INTEGER_32) is
 		-- gtk_activatable_set_use_action_appearance (node at line 11974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_set_use_action_appearance"
		}"
		end

	gtk_activatable_set_related_action (an_activatable: POINTER; an_action: POINTER) is
 		-- gtk_activatable_set_related_action (node at line 17183)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_set_related_action"
		}"
		end

	gtk_activatable_get_use_action_appearance (an_activatable: POINTER): INTEGER_32 is
 		-- gtk_activatable_get_use_action_appearance (node at line 20931)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_get_use_action_appearance"
		}"
		end

	gtk_activatable_get_related_action (an_activatable: POINTER): POINTER is
 		-- gtk_activatable_get_related_action (node at line 29748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_get_related_action"
		}"
		end

	gtk_activatable_do_set_related_action (an_activatable: POINTER; an_action: POINTER) is
 		-- gtk_activatable_do_set_related_action (node at line 35448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_do_set_related_action"
		}"
		end

	gtk_activatable_sync_action_properties (an_activatable: POINTER; an_action: POINTER) is
 		-- gtk_activatable_sync_action_properties (node at line 35718)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_activatable_sync_action_properties"
		}"
		end


end -- class GTKACTIVATABLE_EXTERNALS
