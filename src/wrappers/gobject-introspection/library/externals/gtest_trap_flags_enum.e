-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTEST_TRAP_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (inherit_stdin_low_level | 
				silence_stderr_low_level | 
				silence_stdout_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_inherit_stdin is
		do
			value := value.bit_or(inherit_stdin_low_level)
		end

	unset_inherit_stdin is
		do
			value := value.bit_xor(inherit_stdin_low_level)
		end

	set_silence_stderr is
		do
			value := value.bit_or(silence_stderr_low_level)
		end

	unset_silence_stderr is
		do
			value := value.bit_xor(silence_stderr_low_level)
		end

	set_silence_stdout is
		do
			value := value.bit_or(silence_stdout_low_level)
		end

	unset_silence_stdout is
		do
			value := value.bit_xor(silence_stdout_low_level)
		end

feature {ANY} -- Queries
	is_inherit_stdin: BOOLEAN is
		do
			Result := (value=inherit_stdin_low_level)
		end

	is_silence_stderr: BOOLEAN is
		do
			Result := (value=silence_stderr_low_level)
		end

	is_silence_stdout: BOOLEAN is
		do
			Result := (value=silence_stdout_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	inherit_stdin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TEST_TRAP_INHERIT_STDIN"
 			}"
 		end

	silence_stderr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TEST_TRAP_SILENCE_STDERR"
 			}"
 		end

	silence_stdout_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TEST_TRAP_SILENCE_STDOUT"
 			}"
 		end


end -- class GTEST_TRAP_FLAGS_ENUM
