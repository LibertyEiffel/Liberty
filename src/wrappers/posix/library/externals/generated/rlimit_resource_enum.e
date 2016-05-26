-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class RLIMIT_RESOURCE_ENUM

-- Wrapper of enum __rlimit_resource defined in file /usr/include/x86_64-linux-gnu/bits/resource.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = rlim_nlimits_low_level)  or else
				(a_value = rlimit_as_low_level)  or else
				(a_value = rlimit_core_low_level)  or else
				(a_value = rlimit_cpu_low_level)  or else
				(a_value = rlimit_data_low_level)  or else
				(a_value = rlimit_fsize_low_level)  or else
				(a_value = rlimit_locks_low_level)  or else
				(a_value = rlimit_memlock_low_level)  or else
				(a_value = rlimit_msgqueue_low_level)  or else
				(a_value = rlimit_nice_low_level)  or else
				(a_value = rlimit_nlimits_low_level)  or else
				(a_value = rlimit_nofile_low_level)  or else
				(a_value = rlimit_nproc_low_level)  or else
				(a_value = rlimit_ofile_low_level)  or else
				(a_value = rlimit_rss_low_level)  or else
				(a_value = rlimit_rtprio_low_level)  or else
				(a_value = rlimit_rttime_low_level)  or else
				(a_value = rlimit_sigpending_low_level)  or else
				(a_value = rlimit_stack_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_rlim_nlimits
               do
                       value := rlim_nlimits_low_level
               end

	set_rlimit_as
               do
                       value := rlimit_as_low_level
               end

	set_rlimit_core
               do
                       value := rlimit_core_low_level
               end

	set_rlimit_cpu
               do
                       value := rlimit_cpu_low_level
               end

	set_rlimit_data
               do
                       value := rlimit_data_low_level
               end

	set_rlimit_fsize
               do
                       value := rlimit_fsize_low_level
               end

	set_rlimit_locks
               do
                       value := rlimit_locks_low_level
               end

	set_rlimit_memlock
               do
                       value := rlimit_memlock_low_level
               end

	set_rlimit_msgqueue
               do
                       value := rlimit_msgqueue_low_level
               end

	set_rlimit_nice
               do
                       value := rlimit_nice_low_level
               end

	set_rlimit_nlimits
               do
                       value := rlimit_nlimits_low_level
               end

	set_rlimit_nofile
               do
                       value := rlimit_nofile_low_level
               end

	set_rlimit_nproc
               do
                       value := rlimit_nproc_low_level
               end

	set_rlimit_ofile
               do
                       value := rlimit_ofile_low_level
               end

	set_rlimit_rss
               do
                       value := rlimit_rss_low_level
               end

	set_rlimit_rtprio
               do
                       value := rlimit_rtprio_low_level
               end

	set_rlimit_rttime
               do
                       value := rlimit_rttime_low_level
               end

	set_rlimit_sigpending
               do
                       value := rlimit_sigpending_low_level
               end

	set_rlimit_stack
               do
                       value := rlimit_stack_low_level
               end

feature {ANY} -- Queries
       is_rlim_nlimits: BOOLEAN
               do
                       Result := (value=rlim_nlimits_low_level)
               end

       is_rlimit_as: BOOLEAN
               do
                       Result := (value=rlimit_as_low_level)
               end

       is_rlimit_core: BOOLEAN
               do
                       Result := (value=rlimit_core_low_level)
               end

       is_rlimit_cpu: BOOLEAN
               do
                       Result := (value=rlimit_cpu_low_level)
               end

       is_rlimit_data: BOOLEAN
               do
                       Result := (value=rlimit_data_low_level)
               end

       is_rlimit_fsize: BOOLEAN
               do
                       Result := (value=rlimit_fsize_low_level)
               end

       is_rlimit_locks: BOOLEAN
               do
                       Result := (value=rlimit_locks_low_level)
               end

       is_rlimit_memlock: BOOLEAN
               do
                       Result := (value=rlimit_memlock_low_level)
               end

       is_rlimit_msgqueue: BOOLEAN
               do
                       Result := (value=rlimit_msgqueue_low_level)
               end

       is_rlimit_nice: BOOLEAN
               do
                       Result := (value=rlimit_nice_low_level)
               end

       is_rlimit_nlimits: BOOLEAN
               do
                       Result := (value=rlimit_nlimits_low_level)
               end

       is_rlimit_nofile: BOOLEAN
               do
                       Result := (value=rlimit_nofile_low_level)
               end

       is_rlimit_nproc: BOOLEAN
               do
                       Result := (value=rlimit_nproc_low_level)
               end

       is_rlimit_ofile: BOOLEAN
               do
                       Result := (value=rlimit_ofile_low_level)
               end

       is_rlimit_rss: BOOLEAN
               do
                       Result := (value=rlimit_rss_low_level)
               end

       is_rlimit_rtprio: BOOLEAN
               do
                       Result := (value=rlimit_rtprio_low_level)
               end

       is_rlimit_rttime: BOOLEAN
               do
                       Result := (value=rlimit_rttime_low_level)
               end

       is_rlimit_sigpending: BOOLEAN
               do
                       Result := (value=rlimit_sigpending_low_level)
               end

       is_rlimit_stack: BOOLEAN
               do
                       Result := (value=rlimit_stack_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     rlim_nlimits_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIM_NLIMITS"
                       }"
               end

     rlimit_as_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "RLIMIT_AS"
                       }"
               end

     rlimit_core_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "RLIMIT_CORE"
                       }"
               end

     rlimit_cpu_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "RLIMIT_CPU"
                       }"
               end

     rlimit_data_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "RLIMIT_DATA"
                       }"
               end

     rlimit_fsize_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "RLIMIT_FSIZE"
                       }"
               end

     rlimit_locks_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIMIT_LOCKS"
                       }"
               end

     rlimit_memlock_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIMIT_MEMLOCK"
                       }"
               end

     rlimit_msgqueue_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIMIT_MSGQUEUE"
                       }"
               end

     rlimit_nice_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIMIT_NICE"
                       }"
               end

     rlimit_nlimits_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIMIT_NLIMITS"
                       }"
               end

     rlimit_nofile_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "RLIMIT_NOFILE"
                       }"
               end

     rlimit_nproc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIMIT_NPROC"
                       }"
               end

     rlimit_ofile_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIMIT_OFILE"
                       }"
               end

     rlimit_rss_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIMIT_RSS"
                       }"
               end

     rlimit_rtprio_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIMIT_RTPRIO"
                       }"
               end

     rlimit_rttime_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIMIT_RTTIME"
                       }"
               end

     rlimit_sigpending_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "__RLIMIT_SIGPENDING"
                       }"
               end

     rlimit_stack_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "RLIMIT_STACK"
                       }"
               end


end -- class RLIMIT_RESOURCE_ENUM
