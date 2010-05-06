-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSPAWN_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (leave__descriptors__open_low_level | 
				search__path_low_level | 
				stdout__to__dev__null_low_level | 
				stderr__to__dev__null_low_level | 
				child__inherits__stdin_low_level | 
				file__and__argv__zero_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_leave__descriptors__open is
		do
			value := value.bit_or(leave__descriptors__open_low_level)
		end

	unset_leave__descriptors__open is
		do
			value := value.bit_xor(leave__descriptors__open_low_level)
		end

	set_search__path is
		do
			value := value.bit_or(search__path_low_level)
		end

	unset_search__path is
		do
			value := value.bit_xor(search__path_low_level)
		end

	set_stdout__to__dev__null is
		do
			value := value.bit_or(stdout__to__dev__null_low_level)
		end

	unset_stdout__to__dev__null is
		do
			value := value.bit_xor(stdout__to__dev__null_low_level)
		end

	set_stderr__to__dev__null is
		do
			value := value.bit_or(stderr__to__dev__null_low_level)
		end

	unset_stderr__to__dev__null is
		do
			value := value.bit_xor(stderr__to__dev__null_low_level)
		end

	set_child__inherits__stdin is
		do
			value := value.bit_or(child__inherits__stdin_low_level)
		end

	unset_child__inherits__stdin is
		do
			value := value.bit_xor(child__inherits__stdin_low_level)
		end

	set_file__and__argv__zero is
		do
			value := value.bit_or(file__and__argv__zero_low_level)
		end

	unset_file__and__argv__zero is
		do
			value := value.bit_xor(file__and__argv__zero_low_level)
		end

feature -- Queries
	is_leave__descriptors__open: BOOLEAN is
		do
			Result := (value=leave__descriptors__open_low_level)
		end

	is_search__path: BOOLEAN is
		do
			Result := (value=search__path_low_level)
		end

	is_stdout__to__dev__null: BOOLEAN is
		do
			Result := (value=stdout__to__dev__null_low_level)
		end

	is_stderr__to__dev__null: BOOLEAN is
		do
			Result := (value=stderr__to__dev__null_low_level)
		end

	is_child__inherits__stdin: BOOLEAN is
		do
			Result := (value=child__inherits__stdin_low_level)
		end

	is_file__and__argv__zero: BOOLEAN is
		do
			Result := (value=file__and__argv__zero_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	leave__descriptors__open_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_LEAVE_DESCRIPTORS_OPEN"
 			}"
 		end

	search__path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_SEARCH_PATH"
 			}"
 		end

	stdout__to__dev__null_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_STDOUT_TO_DEV_NULL"
 			}"
 		end

	stderr__to__dev__null_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_STDERR_TO_DEV_NULL"
 			}"
 		end

	child__inherits__stdin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_CHILD_INHERITS_STDIN"
 			}"
 		end

	file__and__argv__zero_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SPAWN_FILE_AND_ARGV_ZERO"
 			}"
 		end


end -- class GSPAWN_FLAGS_ENUM
