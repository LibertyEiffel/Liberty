-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GMAPPEDFILE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_mapped_file_free (a_file: POINTER) 
               -- g_mapped_file_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mapped_file_free"
               }"
               end

	g_mapped_file_get_bytes (a_file: POINTER): POINTER 
               -- g_mapped_file_get_bytes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mapped_file_get_bytes"
               }"
               end

	g_mapped_file_get_contents (a_file: POINTER): POINTER 
               -- g_mapped_file_get_contents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mapped_file_get_contents"
               }"
               end

	g_mapped_file_get_length (a_file: POINTER): like long_unsigned 
               -- g_mapped_file_get_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mapped_file_get_length"
               }"
               end

	g_mapped_file_new (a_filename: POINTER; a_writable: INTEGER; an_error: POINTER): POINTER 
               -- g_mapped_file_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mapped_file_new"
               }"
               end

	g_mapped_file_new_from_fd (a_fd: INTEGER; a_writable: INTEGER; an_error: POINTER): POINTER 
               -- g_mapped_file_new_from_fd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mapped_file_new_from_fd"
               }"
               end

	g_mapped_file_ref (a_file: POINTER): POINTER 
               -- g_mapped_file_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mapped_file_ref"
               }"
               end

	g_mapped_file_unref (a_file: POINTER) 
               -- g_mapped_file_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_mapped_file_unref"
               }"
               end


end -- class GMAPPEDFILE_EXTERNALS
