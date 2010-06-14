-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKDEBUG_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

feature {} -- Variables
	gtk_debug_flags: NATURAL_32 is
 		-- gtk_debug_flags (node at line 75)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_debug_flags"
		}"
		end


end -- class GTKDEBUG_EXTERNALS
