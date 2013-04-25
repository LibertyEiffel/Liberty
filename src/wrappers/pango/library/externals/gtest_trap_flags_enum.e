-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTEST_TRAP_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (silence_stdout_low_level | 
				inherit_stdin_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_silence_stdout is
		do
			value := value.bit_or(silence_stdout_low_level)
		end

	unset_silence_stdout is
		do
			value := value.bit_xor(silence_stdout_low_level)
		end

	set_inherit_stdin is
		do
			value := value.bit_or(inherit_stdin_low_level)
		end

	unset_inherit_stdin is
		do
			value := value.bit_xor(inherit_stdin_low_level)
		end

feature {ANY} -- Queries
	is_silence_stdout: BOOLEAN is
		do
			Result := (value=silence_stdout_low_level)
		end

	is_inherit_stdin: BOOLEAN is
		do
			Result := (value=inherit_stdin_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	silence_stdout_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TEST_TRAP_SILENCE_STDOUT"
 			}"
 		end

	inherit_stdin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TEST_TRAP_INHERIT_STDIN"
 			}"
 		end


end -- class GTEST_TRAP_FLAGS_ENUM
