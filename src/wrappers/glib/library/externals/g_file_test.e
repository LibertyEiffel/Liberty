-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class G_FILE_TEST

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (g_file_test_is_regular | 
				g_file_test_is_symlink | 
				g_file_test_is_dir | 
				g_file_test_is_executable | 
				g_file_test_exists)).to_boolean
		end

feature -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_regular is
		
	do
		value := value.bit_or(g_file_test_is_regular)
	end

	unset_regular is
		
	do
		value := value.bit_xor(g_file_test_is_regular)
	end

	set_symlink is
		
	do
		value := value.bit_or(g_file_test_is_symlink)
	end

	unset_symlink is
		
	do
		value := value.bit_xor(g_file_test_is_symlink)
	end

	set_dir is
		
	do
		value := value.bit_or(g_file_test_is_dir)
	end

	unset_dir is
		
	do
		value := value.bit_xor(g_file_test_is_dir)
	end

	set_executable is
		
	do
		value := value.bit_or(g_file_test_is_executable)
	end

	unset_executable is
		
	do
		value := value.bit_xor(g_file_test_is_executable)
	end

	set_sts is
		
	do
		value := value.bit_or(g_file_test_exists)
	end

	unset_sts is
		
	do
		value := value.bit_xor(g_file_test_exists)
	end

feature -- Queries
	is_regular: BOOLEAN is
		
	do
		Result := (value & g_file_test_is_regular).to_boolean
	end

	is_symlink: BOOLEAN is
		
	do
		Result := (value & g_file_test_is_symlink).to_boolean
	end

	is_dir: BOOLEAN is
		
	do
		Result := (value & g_file_test_is_dir).to_boolean
	end

	is_executable: BOOLEAN is
		
	do
		Result := (value & g_file_test_is_executable).to_boolean
	end

	is_sts: BOOLEAN is
		
	do
		Result := (value & g_file_test_exists).to_boolean
	end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_test_is_regular: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_FILE_TEST_IS_REGULAR"
 			}"
 		end

	g_file_test_is_symlink: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_FILE_TEST_IS_SYMLINK"
 			}"
 		end

	g_file_test_is_dir: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_FILE_TEST_IS_DIR"
 			}"
 		end

	g_file_test_is_executable: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_FILE_TEST_IS_EXECUTABLE"
 			}"
 		end

	g_file_test_exists: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_FILE_TEST_EXISTS"
 			}"
 		end

end

