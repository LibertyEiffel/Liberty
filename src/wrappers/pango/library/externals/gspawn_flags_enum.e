-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSPAWN_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (leave_descriptors_open_low_level | 
				search_path_low_level | 
				stdout_to_dev_null_low_level | 
				stderr_to_dev_null_low_level | 
				child_inherits_stdin_low_level | 
				file_and_argv_zero_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_leave_descriptors_open is
		do
			value := value.bit_or(leave_descriptors_open_low_level)
		end

	unset_leave_descriptors_open is
		do
			value := value.bit_xor(leave_descriptors_open_low_level)
		end

	set_search_path is
		do
			value := value.bit_or(search_path_low_level)
		end

	unset_search_path is
		do
			value := value.bit_xor(search_path_low_level)
		end

	set_stdout_to_dev_null is
		do
			value := value.bit_or(stdout_to_dev_null_low_level)
		end

	unset_stdout_to_dev_null is
		do
			value := value.bit_xor(stdout_to_dev_null_low_level)
		end

	set_stderr_to_dev_null is
		do
			value := value.bit_or(stderr_to_dev_null_low_level)
		end

	unset_stderr_to_dev_null is
		do
			value := value.bit_xor(stderr_to_dev_null_low_level)
		end

	set_child_inherits_stdin is
		do
			value := value.bit_or(child_inherits_stdin_low_level)
		end

	unset_child_inherits_stdin is
		do
			value := value.bit_xor(child_inherits_stdin_low_level)
		end

	set_file_and_argv_zero is
		do
			value := value.bit_or(file_and_argv_zero_low_level)
		end

	unset_file_and_argv_zero is
		do
			value := value.bit_xor(file_and_argv_zero_low_level)
		end

feature {ANY} -- Queries
	is_leave_descriptors_open: BOOLEAN is
		do
			Result := (value=leave_descriptors_open_low_level)
		end

	is_search_path: BOOLEAN is
		do
			Result := (value=search_path_low_level)
		end

	is_stdout_to_dev_null: BOOLEAN is
		do
			Result := (value=stdout_to_dev_null_low_level)
		end

	is_stderr_to_dev_null: BOOLEAN is
		do
			Result := (value=stderr_to_dev_null_low_level)
		end

	is_child_inherits_stdin: BOOLEAN is
		do
			Result := (value=child_inherits_stdin_low_level)
		end

	is_file_and_argv_zero: BOOLEAN is
		do
			Result := (value=file_and_argv_zero_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	leave_descriptors_open_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_LEAVE_DESCRIPTORS_OPEN"
 			}"
 		end

	search_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_SEARCH_PATH"
 			}"
 		end

	stdout_to_dev_null_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_STDOUT_TO_DEV_NULL"
 			}"
 		end

	stderr_to_dev_null_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_STDERR_TO_DEV_NULL"
 			}"
 		end

	child_inherits_stdin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_CHILD_INHERITS_STDIN"
 			}"
 		end

	file_and_argv_zero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_FILE_AND_ARGV_ZERO"
 			}"
 		end


end -- class GSPAWN_FLAGS_ENUM
