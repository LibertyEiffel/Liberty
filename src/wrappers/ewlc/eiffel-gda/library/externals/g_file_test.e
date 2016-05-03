-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_FILE_TEST
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_file_test_is_regular | 
				g_file_test_is_symlink | 
				g_file_test_is_dir | 
				g_file_test_is_executable | 
				g_file_test_exists)).to_boolean
		end


feature {ANY} -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_is_regular is
		do
			value := value.bit_or(g_file_test_is_regular)
		end

	unset_is_regular is
		do
			value := value.bit_xor(g_file_test_is_regular)
		end

	set_is_symlink is
		do
			value := value.bit_or(g_file_test_is_symlink)
		end

	unset_is_symlink is
		do
			value := value.bit_xor(g_file_test_is_symlink)
		end

	set_is_dir is
		do
			value := value.bit_or(g_file_test_is_dir)
		end

	unset_is_dir is
		do
			value := value.bit_xor(g_file_test_is_dir)
		end

	set_is_executable is
		do
			value := value.bit_or(g_file_test_is_executable)
		end

	unset_is_executable is
		do
			value := value.bit_xor(g_file_test_is_executable)
		end

	set_exists is
		do
			value := value.bit_or(g_file_test_exists)
		end

	unset_exists is
		do
			value := value.bit_xor(g_file_test_exists)
		end


feature {ANY} -- Queries
	is_is_regular: BOOLEAN is
		do
			Result := (value &g_file_test_is_regular).to_boolean
		end

	is_is_symlink: BOOLEAN is
		do
			Result := (value &g_file_test_is_symlink).to_boolean
		end

	is_is_dir: BOOLEAN is
		do
			Result := (value &g_file_test_is_dir).to_boolean
		end

	is_is_executable: BOOLEAN is
		do
			Result := (value &g_file_test_is_executable).to_boolean
		end

	is_exists: BOOLEAN is
		do
			Result := (value &g_file_test_exists).to_boolean
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_test_is_regular: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_TEST_IS_REGULAR"
		end

	g_file_test_is_symlink: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_TEST_IS_SYMLINK"
		end

	g_file_test_is_dir: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_TEST_IS_DIR"
		end

	g_file_test_is_executable: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_TEST_IS_EXECUTABLE"
		end

	g_file_test_exists: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_TEST_EXISTS"
		end


end

