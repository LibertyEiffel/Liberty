-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class SELECTEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pselect (a_nfds: INTEGER_32; a_readfds: POINTER; a_writefds: POINTER; an_exceptfds: POINTER; a_timeout: POINTER; a_sigmask: POINTER): INTEGER_32 is
 		-- pselect (node at line 937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pselect"
		}"
		end

	select_external (a_nfds: INTEGER_32; a_readfds: POINTER; a_writefds: POINTER; an_exceptfds: POINTER; a_timeout: POINTER): INTEGER_32 is
 		-- select (node at line 1804)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "select"
		}"
		end


end -- class SELECTEXTERNALS
