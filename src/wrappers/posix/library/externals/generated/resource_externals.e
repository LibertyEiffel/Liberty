-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class RESOURCE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	getpriority (a_which: INTEGER; a_who: NATURAL): INTEGER 

		-- function getpriority (in `/usr/include/x86_64-linux-gnu/sys/resource.h')
               -- getpriority
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpriority"
               }"
               end

	getrlimit (a_resource: INTEGER; a_rlimits: POINTER): INTEGER 

		-- function getrlimit (in `/usr/include/x86_64-linux-gnu/sys/resource.h')
               -- getrlimit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getrlimit"
               }"
               end

	getrlimit64 (a_resource: INTEGER; a_rlimits: POINTER): INTEGER 

		-- function getrlimit64 (in `/usr/include/x86_64-linux-gnu/sys/resource.h')
               -- getrlimit64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getrlimit64"
               }"
               end

	getrusage (a_who: INTEGER; an_usage: POINTER): INTEGER 

		-- function getrusage (in `/usr/include/x86_64-linux-gnu/sys/resource.h')
               -- getrusage
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getrusage"
               }"
               end

	setpriority (a_which: INTEGER; a_who: NATURAL; a_prio: INTEGER): INTEGER 

		-- function setpriority (in `/usr/include/x86_64-linux-gnu/sys/resource.h')
               -- setpriority
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setpriority"
               }"
               end

	setrlimit (a_resource: INTEGER; a_rlimits: POINTER): INTEGER 

		-- function setrlimit (in `/usr/include/x86_64-linux-gnu/sys/resource.h')
               -- setrlimit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setrlimit"
               }"
               end

	setrlimit64 (a_resource: INTEGER; a_rlimits: POINTER): INTEGER 

		-- function setrlimit64 (in `/usr/include/x86_64-linux-gnu/sys/resource.h')
               -- setrlimit64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setrlimit64"
               }"
               end


end -- class RESOURCE_EXTERNALS
