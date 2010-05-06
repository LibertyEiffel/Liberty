-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GCHECKSUM_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_compute_checksum_for_string (a_checksum_type: INTEGER; a_str: POINTER; a_length: INTEGER_32): POINTER is
 		-- g_compute_checksum_for_string (node at line 1379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_compute_checksum_for_string"
		}"
		end

	g_checksum_get_string (a_checksum: POINTER): POINTER is
 		-- g_checksum_get_string (node at line 1665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_checksum_get_string"
		}"
		end

	g_checksum_type_get_length (a_checksum_type: INTEGER): INTEGER_32 is
 		-- g_checksum_type_get_length (node at line 1895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_checksum_type_get_length"
		}"
		end

	g_checksum_update (a_checksum: POINTER; a_data: POINTER; a_length: INTEGER_32) is
 		-- g_checksum_update (node at line 3269)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_checksum_update"
		}"
		end

	g_checksum_new (a_checksum_type: INTEGER): POINTER is
 		-- g_checksum_new (node at line 3889)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_checksum_new"
		}"
		end

	g_checksum_get_digest (a_checksum: POINTER; a_buffer: POINTER; a_digest_len: POINTER) is
 		-- g_checksum_get_digest (node at line 4069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_checksum_get_digest"
		}"
		end

	g_compute_checksum_for_data (a_checksum_type: INTEGER; a_data: POINTER; a_length: NATURAL_32): POINTER is
 		-- g_compute_checksum_for_data (node at line 5500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_compute_checksum_for_data"
		}"
		end

	g_checksum_reset (a_checksum: POINTER) is
 		-- g_checksum_reset (node at line 5815)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_checksum_reset"
		}"
		end

	g_checksum_free (a_checksum: POINTER) is
 		-- g_checksum_free (node at line 5825)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_checksum_free"
		}"
		end

	g_checksum_copy (a_checksum: POINTER): POINTER is
 		-- g_checksum_copy (node at line 6955)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_checksum_copy"
		}"
		end


end -- class GCHECKSUM_EXTERNALS
