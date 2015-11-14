-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSTRINGCHUNK_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_string_chunk_clear (a_chunk: POINTER) 
               -- g_string_chunk_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_chunk_clear"
               }"
               end

	g_string_chunk_free (a_chunk: POINTER) 
               -- g_string_chunk_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_chunk_free"
               }"
               end

	g_string_chunk_insert (a_chunk: POINTER; a_string: POINTER): POINTER 
               -- g_string_chunk_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_chunk_insert"
               }"
               end

	g_string_chunk_insert_const (a_chunk: POINTER; a_string: POINTER): POINTER 
               -- g_string_chunk_insert_const
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_chunk_insert_const"
               }"
               end

	g_string_chunk_insert_len (a_chunk: POINTER; a_string: POINTER; a_len: like long): POINTER 
               -- g_string_chunk_insert_len
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_chunk_insert_len"
               }"
               end

	g_string_chunk_new (a_size: like long_unsigned): POINTER 
               -- g_string_chunk_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_string_chunk_new"
               }"
               end


end -- class GSTRINGCHUNK_EXTERNALS
