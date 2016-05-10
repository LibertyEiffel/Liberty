-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SEM_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	semctl (a_semid: INTEGER; a_semnum: INTEGER; a_cmd: INTEGER): INTEGER 

		-- function semctl (in `/usr/include/x86_64-linux-gnu/sys/sem.h')
               -- semctl (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "semctl"
               }"
               end

	semget (a_key: INTEGER; a_nsems: INTEGER; a_semflg: INTEGER): INTEGER 

		-- function semget (in `/usr/include/x86_64-linux-gnu/sys/sem.h')
               -- semget
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "semget"
               }"
               end

	semop (a_semid: INTEGER; a_sops: POINTER; a_nsops: like size_t): INTEGER 

		-- function semop (in `/usr/include/x86_64-linux-gnu/sys/sem.h')
               -- semop
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "semop"
               }"
               end

	semtimedop (a_semid: INTEGER; a_sops: POINTER; a_nsops: like size_t; a_timeout: POINTER): INTEGER 

		-- function semtimedop (in `/usr/include/x86_64-linux-gnu/sys/sem.h')
               -- semtimedop
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "semtimedop"
               }"
               end


end -- class SEM_EXTERNALS
