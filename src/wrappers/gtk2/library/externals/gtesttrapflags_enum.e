-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTESTTRAPFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (g_test_trap_inherit_stdin_low_level | 
				g_test_trap_silence_stdout_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_g_test_trap_inherit_stdin is
		do
			value := value.bit_or(g_test_trap_inherit_stdin_low_level)
		end

	unset_g_test_trap_inherit_stdin is
		do
			value := value.bit_xor(g_test_trap_inherit_stdin_low_level)
		end

	set_g_test_trap_silence_stdout is
		do
			value := value.bit_or(g_test_trap_silence_stdout_low_level)
		end

	unset_g_test_trap_silence_stdout is
		do
			value := value.bit_xor(g_test_trap_silence_stdout_low_level)
		end

feature {ANY} -- Queries
	is_g_test_trap_inherit_stdin: BOOLEAN is
		do
			Result := (value=g_test_trap_inherit_stdin_low_level)
		end

	is_g_test_trap_silence_stdout: BOOLEAN is
		do
			Result := (value=g_test_trap_silence_stdout_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_test_trap_inherit_stdin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TEST_TRAP_INHERIT_STDIN"
 			}"
 		end

	g_test_trap_silence_stdout_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_TEST_TRAP_SILENCE_STDOUT"
 			}"
 		end


end -- class GTESTTRAPFLAGS_ENUM
