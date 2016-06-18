-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_TEST_TRAP_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN
		do
			Result := (some_flags & (g_test_trap_silence_stdout | 
				g_test_trap_silence_stderr | 
				g_test_trap_inherit_stdin)).to_boolean
		end


feature {ANY} -- Setters
	default_create
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_g_test_trap_silence_stdout
		do
			value := value.bit_or(g_test_trap_silence_stdout)
		end

	unset_g_test_trap_silence_stdout
		do
			value := value.bit_xor(g_test_trap_silence_stdout)
		end

	set_g_test_trap_silence_stderr
		do
			value := value.bit_or(g_test_trap_silence_stderr)
		end

	unset_g_test_trap_silence_stderr
		do
			value := value.bit_xor(g_test_trap_silence_stderr)
		end

	set_g_test_trap_inherit_stdin
		do
			value := value.bit_or(g_test_trap_inherit_stdin)
		end

	unset_g_test_trap_inherit_stdin
		do
			value := value.bit_xor(g_test_trap_inherit_stdin)
		end


feature {ANY} -- Queries
	is_g_test_trap_silence_stdout: BOOLEAN
		do
			Result := (value &g_test_trap_silence_stdout).to_boolean
		end

	is_g_test_trap_silence_stderr: BOOLEAN
		do
			Result := (value &g_test_trap_silence_stderr).to_boolean
		end

	is_g_test_trap_inherit_stdin: BOOLEAN
		do
			Result := (value &g_test_trap_inherit_stdin).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_test_trap_silence_stdout: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_TRAP_SILENCE_STDOUT"
		end

	g_test_trap_silence_stderr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_TRAP_SILENCE_STDERR"
		end

	g_test_trap_inherit_stdin: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_TRAP_INHERIT_STDIN"
		end


end

