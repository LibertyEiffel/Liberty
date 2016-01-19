-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GFILEUTILS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_basename (a_file_name: POINTER): POINTER 
               -- g_basename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_basename"
               }"
               end

	g_build_filename (a_first_element: POINTER): POINTER 
               -- g_build_filename (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_build_filename"
               }"
               end

	g_build_filenamev (an_args: POINTER): POINTER 
               -- g_build_filenamev
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_build_filenamev"
               }"
               end

	g_build_path (a_separator: POINTER; a_first_element: POINTER): POINTER 
               -- g_build_path (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_build_path"
               }"
               end

	g_build_pathv (a_separator: POINTER; an_args: POINTER): POINTER 
               -- g_build_pathv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_build_pathv"
               }"
               end

	g_dir_make_tmp (a_tmpl: POINTER; an_error: POINTER): POINTER 
               -- g_dir_make_tmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dir_make_tmp"
               }"
               end

	g_file_error_from_errno (an_err_no: INTEGER): INTEGER 
               -- g_file_error_from_errno
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_file_error_from_errno"
               }"
               end

	g_file_error_quark: NATURAL 
               -- g_file_error_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_file_error_quark"
               }"
               end

	g_file_get_contents (a_filename: POINTER; a_contents: POINTER; a_length: POINTER; an_error: POINTER): INTEGER 
               -- g_file_get_contents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_file_get_contents"
               }"
               end

	g_file_open_tmp (a_tmpl: POINTER; a_name_used: POINTER; an_error: POINTER): INTEGER 
               -- g_file_open_tmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_file_open_tmp"
               }"
               end

	g_file_read_link (a_filename: POINTER; an_error: POINTER): POINTER 
               -- g_file_read_link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_file_read_link"
               }"
               end

	g_file_set_contents (a_filename: POINTER; a_contents: POINTER; a_length: like long; an_error: POINTER): INTEGER 
               -- g_file_set_contents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_file_set_contents"
               }"
               end

	g_file_test (a_filename: POINTER; a_test: INTEGER): INTEGER 
               -- g_file_test
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_file_test"
               }"
               end

	g_get_current_dir: POINTER 
               -- g_get_current_dir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_current_dir"
               }"
               end

	g_mkdir_with_parents (a_pathname: POINTER; a_mode: INTEGER): INTEGER 
               -- g_mkdir_with_parents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mkdir_with_parents"
               }"
               end

	g_mkdtemp (a_tmpl: POINTER): POINTER 
               -- g_mkdtemp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mkdtemp"
               }"
               end

	g_mkdtemp_full (a_tmpl: POINTER; a_mode: INTEGER): POINTER 
               -- g_mkdtemp_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mkdtemp_full"
               }"
               end

	g_mkstemp (a_tmpl: POINTER): INTEGER 
               -- g_mkstemp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mkstemp"
               }"
               end

	g_mkstemp_full (a_tmpl: POINTER; a_flags: INTEGER; a_mode: INTEGER): INTEGER 
               -- g_mkstemp_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mkstemp_full"
               }"
               end

	g_path_get_basename (a_file_name: POINTER): POINTER 
               -- g_path_get_basename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_path_get_basename"
               }"
               end

	g_path_get_dirname (a_file_name: POINTER): POINTER 
               -- g_path_get_dirname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_path_get_dirname"
               }"
               end

	g_path_is_absolute (a_file_name: POINTER): INTEGER 
               -- g_path_is_absolute
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_path_is_absolute"
               }"
               end

	g_path_skip_root (a_file_name: POINTER): POINTER 
               -- g_path_skip_root
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_path_skip_root"
               }"
               end


end -- class GFILEUTILS_EXTERNALS
