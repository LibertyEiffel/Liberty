-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class WAIT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	wait (a_stat_loc: POINTER): INTEGER 

		-- function wait (in `/usr/include/x86_64-linux-gnu/sys/wait.h')
               -- wait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wait"
               }"
               end

	wait3 (a_stat_loc: POINTER; an_options: INTEGER; an_usage: POINTER): INTEGER 

		-- function wait3 (in `/usr/include/x86_64-linux-gnu/sys/wait.h')
               -- wait3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wait3"
               }"
               end

	wait4 (a_pid: INTEGER; a_stat_loc: POINTER; an_options: INTEGER; an_usage: POINTER): INTEGER 

		-- function wait4 (in `/usr/include/x86_64-linux-gnu/sys/wait.h')
               -- wait4
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wait4"
               }"
               end

	waitid (an_idtype: INTEGER; an_id: NATURAL; an_infop: POINTER; an_options: INTEGER): INTEGER 

		-- function waitid (in `/usr/include/x86_64-linux-gnu/sys/wait.h')
               -- waitid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "waitid"
               }"
               end

	waitpid (a_pid: INTEGER; a_stat_loc: POINTER; an_options: INTEGER): INTEGER 

		-- function waitpid (in `/usr/include/x86_64-linux-gnu/sys/wait.h')
               -- waitpid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "waitpid"
               }"
               end


end -- class WAIT_EXTERNALS
