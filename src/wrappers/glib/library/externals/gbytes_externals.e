-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GBYTES_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_bytes_compare (a_bytes1: POINTER; a_bytes2: POINTER): INTEGER is
 		-- g_bytes_compare
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_compare"
		}"
		end

	g_bytes_equal (a_bytes1: POINTER; a_bytes2: POINTER): INTEGER is
 		-- g_bytes_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_equal"
		}"
		end

	g_bytes_get_data (a_bytes: POINTER; a_size: POINTER): POINTER is
 		-- g_bytes_get_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_get_data"
		}"
		end

	g_bytes_get_size (a_bytes: POINTER): NATURAL is
 		-- g_bytes_get_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_get_size"
		}"
		end

	g_bytes_hash (a_bytes: POINTER): NATURAL is
 		-- g_bytes_hash
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_hash"
		}"
		end

	g_bytes_new (a_data: POINTER; a_size: NATURAL): POINTER is
 		-- g_bytes_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_new"
		}"
		end

	g_bytes_new_from_bytes (a_bytes: POINTER; an_offset: NATURAL; a_length: NATURAL): POINTER is
 		-- g_bytes_new_from_bytes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_new_from_bytes"
		}"
		end

	g_bytes_new_static (a_data: POINTER; a_size: NATURAL): POINTER is
 		-- g_bytes_new_static
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_new_static"
		}"
		end

	g_bytes_new_take (a_data: POINTER; a_size: NATURAL): POINTER is
 		-- g_bytes_new_take
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_new_take"
		}"
		end

	g_bytes_new_with_free_func (a_data: POINTER; a_size: NATURAL; a_free_func: POINTER; an_user_data: POINTER): POINTER is
 		-- g_bytes_new_with_free_func
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_new_with_free_func"
		}"
		end

	g_bytes_ref (a_bytes: POINTER): POINTER is
 		-- g_bytes_ref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_ref"
		}"
		end

	g_bytes_unref (a_bytes: POINTER) is
 		-- g_bytes_unref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_unref"
		}"
		end

	g_bytes_unref_to_array (a_bytes: POINTER): POINTER is
 		-- g_bytes_unref_to_array
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_unref_to_array"
		}"
		end

	g_bytes_unref_to_data (a_bytes: POINTER; a_size: POINTER): POINTER is
 		-- g_bytes_unref_to_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bytes_unref_to_data"
		}"
		end


end -- class GBYTES_EXTERNALS
