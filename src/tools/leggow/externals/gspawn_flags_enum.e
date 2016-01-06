-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GSPAWN_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = child_inherits_stdin_low_level)  or else
				(a_value = cloexec_pipes_low_level)  or else
				(a_value = default_external_low_level)  or else
				(a_value = do_not_reap_child_low_level)  or else
				(a_value = file_and_argv_zero_low_level)  or else
				(a_value = leave_descriptors_open_low_level)  or else
				(a_value = search_path_low_level)  or else
				(a_value = search_path_from_envp_low_level)  or else
				(a_value = stderr_to_dev_null_low_level)  or else
				(a_value = stdout_to_dev_null_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_child_inherits_stdin
               do
                       value := child_inherits_stdin_low_level
               end

	set_cloexec_pipes
               do
                       value := cloexec_pipes_low_level
               end

	set_default_external
               do
                       value := default_external_low_level
               end

	set_do_not_reap_child
               do
                       value := do_not_reap_child_low_level
               end

	set_file_and_argv_zero
               do
                       value := file_and_argv_zero_low_level
               end

	set_leave_descriptors_open
               do
                       value := leave_descriptors_open_low_level
               end

	set_search_path
               do
                       value := search_path_low_level
               end

	set_search_path_from_envp
               do
                       value := search_path_from_envp_low_level
               end

	set_stderr_to_dev_null
               do
                       value := stderr_to_dev_null_low_level
               end

	set_stdout_to_dev_null
               do
                       value := stdout_to_dev_null_low_level
               end

feature {ANY} -- Queries
       is_child_inherits_stdin: BOOLEAN
               do
                       Result := (value=child_inherits_stdin_low_level)
               end

       is_cloexec_pipes: BOOLEAN
               do
                       Result := (value=cloexec_pipes_low_level)
               end

       is_default_external: BOOLEAN
               do
                       Result := (value=default_external_low_level)
               end

       is_do_not_reap_child: BOOLEAN
               do
                       Result := (value=do_not_reap_child_low_level)
               end

       is_file_and_argv_zero: BOOLEAN
               do
                       Result := (value=file_and_argv_zero_low_level)
               end

       is_leave_descriptors_open: BOOLEAN
               do
                       Result := (value=leave_descriptors_open_low_level)
               end

       is_search_path: BOOLEAN
               do
                       Result := (value=search_path_low_level)
               end

       is_search_path_from_envp: BOOLEAN
               do
                       Result := (value=search_path_from_envp_low_level)
               end

       is_stderr_to_dev_null: BOOLEAN
               do
                       Result := (value=stderr_to_dev_null_low_level)
               end

       is_stdout_to_dev_null: BOOLEAN
               do
                       Result := (value=stdout_to_dev_null_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     child_inherits_stdin_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_CHILD_INHERITS_STDIN"
                       }"
               end

     cloexec_pipes_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_CLOEXEC_PIPES"
                       }"
               end

     default_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_DEFAULT"
                       }"
               end

     do_not_reap_child_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_DO_NOT_REAP_CHILD"
                       }"
               end

     file_and_argv_zero_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_FILE_AND_ARGV_ZERO"
                       }"
               end

     leave_descriptors_open_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_LEAVE_DESCRIPTORS_OPEN"
                       }"
               end

     search_path_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_SEARCH_PATH"
                       }"
               end

     search_path_from_envp_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_SEARCH_PATH_FROM_ENVP"
                       }"
               end

     stderr_to_dev_null_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_STDERR_TO_DEV_NULL"
                       }"
               end

     stdout_to_dev_null_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_STDOUT_TO_DEV_NULL"
                       }"
               end


end -- class GSPAWN_FLAGS_ENUM
