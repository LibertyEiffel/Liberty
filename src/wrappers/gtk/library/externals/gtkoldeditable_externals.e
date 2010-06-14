-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKOLDEDITABLE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_old_editable_get_type: NATURAL_32 is
 		-- gtk_old_editable_get_type (node at line 5150)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_old_editable_get_type()"
		}"
		end

	gtk_old_editable_changed (an_old_editable: POINTER) is
 		-- gtk_old_editable_changed (node at line 9747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_old_editable_changed"
		}"
		end

	gtk_old_editable_claim_selection (an_old_editable: POINTER; a_claim: INTEGER_32; a_time: NATURAL_32) is
 		-- gtk_old_editable_claim_selection (node at line 32082)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_old_editable_claim_selection"
		}"
		end


end -- class GTKOLDEDITABLE_EXTERNALS
