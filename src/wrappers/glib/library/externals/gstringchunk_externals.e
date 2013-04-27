-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSTRINGCHUNK_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_string_chunk_clear (a_chunk: POINTER) is
 		-- g_string_chunk_clear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_clear"
		}"
		end

	g_string_chunk_free (a_chunk: POINTER) is
 		-- g_string_chunk_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_free"
		}"
		end

	g_string_chunk_insert (a_chunk: POINTER; a_string: POINTER): POINTER is
 		-- g_string_chunk_insert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_insert"
		}"
		end

	g_string_chunk_insert_const (a_chunk: POINTER; a_string: POINTER): POINTER is
 		-- g_string_chunk_insert_const
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_insert_const"
		}"
		end

	g_string_chunk_insert_len (a_chunk: POINTER; a_string: POINTER; a_len: INTEGER): POINTER is
 		-- g_string_chunk_insert_len
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_insert_len"
		}"
		end

	g_string_chunk_new (a_size: NATURAL): POINTER is
 		-- g_string_chunk_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_string_chunk_new"
		}"
		end


end -- class GSTRINGCHUNK_EXTERNALS
