-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SCHED_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	sched_get_priority_max (an_algorithm: INTEGER): INTEGER 

		-- function sched_get_priority_max (in `/usr/include/sched.h')
               -- sched_get_priority_max
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sched_get_priority_max"
               }"
               end

	sched_get_priority_min (an_algorithm: INTEGER): INTEGER 

		-- function sched_get_priority_min (in `/usr/include/sched.h')
               -- sched_get_priority_min
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sched_get_priority_min"
               }"
               end

	sched_getaffinity (a_pid: INTEGER; a_cpusetsize: like size_t; a_cpuset: POINTER): INTEGER 

		-- function sched_getaffinity (in `/usr/include/sched.h')
               -- sched_getaffinity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sched_getaffinity"
               }"
               end

	sched_getparam (a_pid: INTEGER; a_param: POINTER): INTEGER 

		-- function sched_getparam (in `/usr/include/sched.h')
               -- sched_getparam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sched_getparam"
               }"
               end

	sched_getscheduler (a_pid: INTEGER): INTEGER 

		-- function sched_getscheduler (in `/usr/include/sched.h')
               -- sched_getscheduler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sched_getscheduler"
               }"
               end

	sched_rr_get_interval (a_pid: INTEGER; a_t: POINTER): INTEGER 

		-- function sched_rr_get_interval (in `/usr/include/sched.h')
               -- sched_rr_get_interval
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sched_rr_get_interval"
               }"
               end

	sched_setaffinity (a_pid: INTEGER; a_cpusetsize: like size_t; a_cpuset: POINTER): INTEGER 

		-- function sched_setaffinity (in `/usr/include/sched.h')
               -- sched_setaffinity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sched_setaffinity"
               }"
               end

	sched_setparam (a_pid: INTEGER; a_param: POINTER): INTEGER 

		-- function sched_setparam (in `/usr/include/sched.h')
               -- sched_setparam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sched_setparam"
               }"
               end

	sched_setscheduler (a_pid: INTEGER; a_policy: INTEGER; a_param: POINTER): INTEGER 

		-- function sched_setscheduler (in `/usr/include/sched.h')
               -- sched_setscheduler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sched_setscheduler"
               }"
               end

	sched_yield: INTEGER 

		-- function sched_yield (in `/usr/include/sched.h')
               -- sched_yield
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sched_yield()"
               }"
               end


end -- class SCHED_EXTERNALS
