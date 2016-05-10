-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SHM_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	shmat (a_shmid: INTEGER; a_shmaddr: POINTER; a_shmflg: INTEGER): POINTER 

		-- function shmat (in `/usr/include/x86_64-linux-gnu/sys/shm.h')
               -- shmat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "shmat"
               }"
               end

	shmctl (a_shmid: INTEGER; a_cmd: INTEGER; a_buf: POINTER): INTEGER 

		-- function shmctl (in `/usr/include/x86_64-linux-gnu/sys/shm.h')
               -- shmctl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "shmctl"
               }"
               end

	shmdt (a_shmaddr: POINTER): INTEGER 

		-- function shmdt (in `/usr/include/x86_64-linux-gnu/sys/shm.h')
               -- shmdt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "shmdt"
               }"
               end

	shmget (a_key: INTEGER; a_size: like size_t; a_shmflg: INTEGER): INTEGER 

		-- function shmget (in `/usr/include/x86_64-linux-gnu/sys/shm.h')
               -- shmget
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "shmget"
               }"
               end


end -- class SHM_EXTERNALS
