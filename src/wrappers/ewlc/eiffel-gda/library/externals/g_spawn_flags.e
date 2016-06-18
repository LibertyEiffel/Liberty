-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_SPAWN_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN
		do
			Result := (some_flags & (g_spawn_leave_descriptors_open | 
				g_spawn_do_not_reap_child | 
				g_spawn_search_path | 
				g_spawn_stdout_to_dev_null | 
				g_spawn_stderr_to_dev_null | 
				g_spawn_child_inherits_stdin | 
				g_spawn_file_and_argv_zero)).to_boolean
		end


feature {ANY} -- Setters
	default_create
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_leave_descriptors_open
		do
			value := value.bit_or(g_spawn_leave_descriptors_open)
		end

	unset_leave_descriptors_open
		do
			value := value.bit_xor(g_spawn_leave_descriptors_open)
		end

	set_do_not_reap_child
		do
			value := value.bit_or(g_spawn_do_not_reap_child)
		end

	unset_do_not_reap_child
		do
			value := value.bit_xor(g_spawn_do_not_reap_child)
		end

	set_search_path
		do
			value := value.bit_or(g_spawn_search_path)
		end

	unset_search_path
		do
			value := value.bit_xor(g_spawn_search_path)
		end

	set_stdout_to_dev_null
		do
			value := value.bit_or(g_spawn_stdout_to_dev_null)
		end

	unset_stdout_to_dev_null
		do
			value := value.bit_xor(g_spawn_stdout_to_dev_null)
		end

	set_stderr_to_dev_null
		do
			value := value.bit_or(g_spawn_stderr_to_dev_null)
		end

	unset_stderr_to_dev_null
		do
			value := value.bit_xor(g_spawn_stderr_to_dev_null)
		end

	set_child_inherits_stdin
		do
			value := value.bit_or(g_spawn_child_inherits_stdin)
		end

	unset_child_inherits_stdin
		do
			value := value.bit_xor(g_spawn_child_inherits_stdin)
		end

	set_file_and_argv_zero
		do
			value := value.bit_or(g_spawn_file_and_argv_zero)
		end

	unset_file_and_argv_zero
		do
			value := value.bit_xor(g_spawn_file_and_argv_zero)
		end


feature {ANY} -- Queries
	is_leave_descriptors_open: BOOLEAN
		do
			Result := (value &g_spawn_leave_descriptors_open).to_boolean
		end

	is_do_not_reap_child: BOOLEAN
		do
			Result := (value &g_spawn_do_not_reap_child).to_boolean
		end

	is_search_path: BOOLEAN
		do
			Result := (value &g_spawn_search_path).to_boolean
		end

	is_stdout_to_dev_null: BOOLEAN
		do
			Result := (value &g_spawn_stdout_to_dev_null).to_boolean
		end

	is_stderr_to_dev_null: BOOLEAN
		do
			Result := (value &g_spawn_stderr_to_dev_null).to_boolean
		end

	is_child_inherits_stdin: BOOLEAN
		do
			Result := (value &g_spawn_child_inherits_stdin).to_boolean
		end

	is_file_and_argv_zero: BOOLEAN
		do
			Result := (value &g_spawn_file_and_argv_zero).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_spawn_leave_descriptors_open: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_LEAVE_DESCRIPTORS_OPEN"
		end

	g_spawn_do_not_reap_child: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_DO_NOT_REAP_CHILD"
		end

	g_spawn_search_path: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_SEARCH_PATH"
		end

	g_spawn_stdout_to_dev_null: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_STDOUT_TO_DEV_NULL"
		end

	g_spawn_stderr_to_dev_null: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_STDERR_TO_DEV_NULL"
		end

	g_spawn_child_inherits_stdin: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_CHILD_INHERITS_STDIN"
		end

	g_spawn_file_and_argv_zero: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_FILE_AND_ARGV_ZERO"
		end


end

