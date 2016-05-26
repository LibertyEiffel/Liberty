-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SELECT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	pselect (a_nfds: INTEGER; a_readfds: POINTER; a_writefds: POINTER; an_exceptfds: POINTER; a_timeout: POINTER; a_sigmask: POINTER): INTEGER 

		-- function pselect (in `/usr/include/x86_64-linux-gnu/sys/select.h')
               -- pselect
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pselect"
               }"
               end

	select_external (a_nfds: INTEGER; a_readfds: POINTER; a_writefds: POINTER; an_exceptfds: POINTER; a_timeout: POINTER): INTEGER 

		-- function select (in `/usr/include/x86_64-linux-gnu/sys/select.h')
               -- select
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "select"
               }"
               end


end -- class SELECT_EXTERNALS
