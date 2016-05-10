-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class POLL_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	poll (a_fds: POINTER; a_nfds: like long_unsigned; a_timeout: INTEGER): INTEGER 

		-- function poll (in `/usr/include/x86_64-linux-gnu/sys/poll.h')
               -- poll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "poll"
               }"
               end

	ppoll (a_fds: POINTER; a_nfds: like long_unsigned; a_timeout: POINTER; a_ss: POINTER): INTEGER 

		-- function ppoll (in `/usr/include/x86_64-linux-gnu/sys/poll.h')
               -- ppoll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ppoll"
               }"
               end


end -- class POLL_EXTERNALS
