-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKDEBUG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_debug_flags: NATURAL is
 		-- gtk_debug_flags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_debug_flags"
		}"
		end

	address_of_gtk_debug_flags: POINTER is
 		-- Address of gtk_debug_flags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gtk_debug_flags"
		}"
		end

	set_gtk_debug_flags (a_value: NATURAL) is
		-- Set variable gtk_debug_flags value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gtk_debug_flags"
		}"
		end


end -- class GTKDEBUG_EXTERNALS
