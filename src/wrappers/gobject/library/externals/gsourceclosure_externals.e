-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSOURCECLOSURE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_io_condition_get_type: NATURAL_32 is
 		-- g_io_condition_get_type (node at line 1126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_condition_get_type()"
		}"
		end

	g_io_channel_get_type: NATURAL_32 is
 		-- g_io_channel_get_type (node at line 2379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_get_type()"
		}"
		end

	g_source_set_closure (a_source: POINTER; a_closure: POINTER) is
 		-- g_source_set_closure (node at line 6474)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_source_set_closure"
		}"
		end


end -- class GSOURCECLOSURE_EXTERNALS
