-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GMAPPEDFILE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_mapped_file_get_length (a_file: POINTER): NATURAL_32 is
 		-- g_mapped_file_get_length (node at line 1073)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mapped_file_get_length"
		}"
		end

	g_mapped_file_free (a_file: POINTER) is
 		-- g_mapped_file_free (node at line 1091)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mapped_file_free"
		}"
		end

	g_mapped_file_unref (a_file: POINTER) is
 		-- g_mapped_file_unref (node at line 2740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mapped_file_unref"
		}"
		end

	g_mapped_file_new (a_filename: POINTER; a_writable: INTEGER_32; an_error: POINTER): POINTER is
 		-- g_mapped_file_new (node at line 3178)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mapped_file_new"
		}"
		end

	g_mapped_file_ref (a_file: POINTER): POINTER is
 		-- g_mapped_file_ref (node at line 3917)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mapped_file_ref"
		}"
		end

	g_mapped_file_get_contents (a_file: POINTER): POINTER is
 		-- g_mapped_file_get_contents (node at line 6944)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mapped_file_get_contents"
		}"
		end


end -- class GMAPPEDFILE_EXTERNALS
