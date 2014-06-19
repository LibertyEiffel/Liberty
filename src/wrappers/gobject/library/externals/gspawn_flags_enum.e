-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSPAWN_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value & (g_spawn_child_inherits_stdin_low_level | 
				g_spawn_file_and_argv_zero_low_level | 
				g_spawn_leave_descriptors_open_low_level | 
				g_spawn_search_path_low_level | 
				g_spawn_search_path_from_envp_low_level | 
				g_spawn_stderr_to_dev_null_low_level | 
				g_spawn_stdout_to_dev_null_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_g_spawn_child_inherits_stdin
		do
			value := value.bit_or(g_spawn_child_inherits_stdin_low_level)
		end

	unset_g_spawn_child_inherits_stdin
		do
			value := value.bit_xor(g_spawn_child_inherits_stdin_low_level)
		end

	set_g_spawn_file_and_argv_zero
		do
			value := value.bit_or(g_spawn_file_and_argv_zero_low_level)
		end

	unset_g_spawn_file_and_argv_zero
		do
			value := value.bit_xor(g_spawn_file_and_argv_zero_low_level)
		end

	set_g_spawn_leave_descriptors_open
		do
			value := value.bit_or(g_spawn_leave_descriptors_open_low_level)
		end

	unset_g_spawn_leave_descriptors_open
		do
			value := value.bit_xor(g_spawn_leave_descriptors_open_low_level)
		end

	set_g_spawn_search_path
		do
			value := value.bit_or(g_spawn_search_path_low_level)
		end

	unset_g_spawn_search_path
		do
			value := value.bit_xor(g_spawn_search_path_low_level)
		end

	set_g_spawn_search_path_from_envp
		do
			value := value.bit_or(g_spawn_search_path_from_envp_low_level)
		end

	unset_g_spawn_search_path_from_envp
		do
			value := value.bit_xor(g_spawn_search_path_from_envp_low_level)
		end

	set_g_spawn_stderr_to_dev_null
		do
			value := value.bit_or(g_spawn_stderr_to_dev_null_low_level)
		end

	unset_g_spawn_stderr_to_dev_null
		do
			value := value.bit_xor(g_spawn_stderr_to_dev_null_low_level)
		end

	set_g_spawn_stdout_to_dev_null
		do
			value := value.bit_or(g_spawn_stdout_to_dev_null_low_level)
		end

	unset_g_spawn_stdout_to_dev_null
		do
			value := value.bit_xor(g_spawn_stdout_to_dev_null_low_level)
		end

feature {ANY} -- Queries
	is_g_spawn_child_inherits_stdin: BOOLEAN
		do
			Result := (value=g_spawn_child_inherits_stdin_low_level)
		end

	is_g_spawn_file_and_argv_zero: BOOLEAN
		do
			Result := (value=g_spawn_file_and_argv_zero_low_level)
		end

	is_g_spawn_leave_descriptors_open: BOOLEAN
		do
			Result := (value=g_spawn_leave_descriptors_open_low_level)
		end

	is_g_spawn_search_path: BOOLEAN
		do
			Result := (value=g_spawn_search_path_low_level)
		end

	is_g_spawn_search_path_from_envp: BOOLEAN
		do
			Result := (value=g_spawn_search_path_from_envp_low_level)
		end

	is_g_spawn_stderr_to_dev_null: BOOLEAN
		do
			Result := (value=g_spawn_stderr_to_dev_null_low_level)
		end

	is_g_spawn_stdout_to_dev_null: BOOLEAN
		do
			Result := (value=g_spawn_stdout_to_dev_null_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_spawn_child_inherits_stdin_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_CHILD_INHERITS_STDIN"
 			}"
 		end

	g_spawn_file_and_argv_zero_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_FILE_AND_ARGV_ZERO"
 			}"
 		end

	g_spawn_leave_descriptors_open_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_LEAVE_DESCRIPTORS_OPEN"
 			}"
 		end

	g_spawn_search_path_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_SEARCH_PATH"
 			}"
 		end

	g_spawn_search_path_from_envp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_SEARCH_PATH_FROM_ENVP"
 			}"
 		end

	g_spawn_stderr_to_dev_null_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_STDERR_TO_DEV_NULL"
 			}"
 		end

	g_spawn_stdout_to_dev_null_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_STDOUT_TO_DEV_NULL"
 			}"
 		end


end -- class GSPAWN_FLAGS_ENUM
