-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPOLL_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_poll (a_fds: POINTER; a_nfds: NATURAL_32; a_timeout: INTEGER_32): INTEGER_32 is
 		-- g_poll (node at line 2885)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_poll"
		}"
		end


end -- class GPOLL_EXTERNALS
