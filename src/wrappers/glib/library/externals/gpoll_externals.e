-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPOLL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_poll (a_fds: POINTER; a_nfds: NATURAL; a_timeout: INTEGER): INTEGER is
 		-- g_poll
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_poll"
		}"
		end


end -- class GPOLL_EXTERNALS
