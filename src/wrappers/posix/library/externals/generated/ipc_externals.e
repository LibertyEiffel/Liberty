-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IPC_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	ftok (a_pathname: POINTER; a_proj_id: INTEGER): INTEGER 

		-- function ftok (in `/usr/include/x86_64-linux-gnu/sys/ipc.h')
               -- ftok
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftok"
               }"
               end


end -- class IPC_EXTERNALS
