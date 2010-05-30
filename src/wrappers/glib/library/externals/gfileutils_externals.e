-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GFILEUTILS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_build_filenamev (an_args: POINTER): POINTER is
 		-- g_build_filenamev (node at line 106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_build_filenamev"
		}"
		end

	g_file_read_link (a_filename: POINTER; an_error: POINTER): POINTER is
 		-- g_file_read_link (node at line 244)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_file_read_link"
		}"
		end

	g_file_test (a_filename: POINTER; a_test: INTEGER): INTEGER_32 is
 		-- g_file_test (node at line 370)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_file_test"
		}"
		end

	g_build_filename (a_first_element: POINTER): POINTER is
 		-- g_build_filename (variadic call)  (node at line 738)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_build_filename"
		}"
		end

	g_build_path (a_separator: POINTER; a_first_element: POINTER): POINTER is
 		-- g_build_path (variadic call)  (node at line 1166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_build_path"
		}"
		end

	g_file_error_from_errno (an_err_no: INTEGER_32): INTEGER is
 		-- g_file_error_from_errno (node at line 2941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_file_error_from_errno"
		}"
		end

	g_file_error_quark: NATURAL_32 is
 		-- g_file_error_quark (node at line 3280)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_file_error_quark()"
		}"
		end

	g_file_open_tmp (a_tmpl: POINTER; a_name_used: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_file_open_tmp (node at line 4243)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_file_open_tmp"
		}"
		end

	g_file_set_contents (a_filename: POINTER; a_contents: POINTER; a_length: INTEGER_32; an_error: POINTER): INTEGER_32 is
 		-- g_file_set_contents (node at line 4495)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_file_set_contents"
		}"
		end

	g_file_get_contents (a_filename: POINTER; a_contents: POINTER; a_length: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_file_get_contents (node at line 5167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_file_get_contents"
		}"
		end

	g_build_pathv (a_separator: POINTER; an_args: POINTER): POINTER is
 		-- g_build_pathv (node at line 5263)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_build_pathv"
		}"
		end

	g_mkdir_with_parents (a_pathname: POINTER; a_mode: INTEGER_32): INTEGER_32 is
 		-- g_mkdir_with_parents (node at line 5320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mkdir_with_parents"
		}"
		end

	g_format_size_for_display (a_size: INTEGER_64): POINTER is
 		-- g_format_size_for_display (node at line 5350)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_format_size_for_display"
		}"
		end

	g_mkstemp_full (a_tmpl: POINTER; a_flags: INTEGER_32; a_mode: INTEGER_32): INTEGER_32 is
 		-- g_mkstemp_full (node at line 5625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mkstemp_full"
		}"
		end

	g_mkstemp (a_tmpl: POINTER): INTEGER_32 is
 		-- g_mkstemp (node at line 6501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mkstemp"
		}"
		end


end -- class GFILEUTILS_EXTERNALS
