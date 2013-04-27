-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GHMAC_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_compute_hmac_for_data (a_digest_type: INTEGER; a_key: POINTER; a_key_len: NATURAL; a_data: POINTER; a_length: NATURAL): POINTER is
 		-- g_compute_hmac_for_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_compute_hmac_for_data"
		}"
		end

	g_compute_hmac_for_string (a_digest_type: INTEGER; a_key: POINTER; a_key_len: NATURAL; a_str: POINTER; a_length: INTEGER): POINTER is
 		-- g_compute_hmac_for_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_compute_hmac_for_string"
		}"
		end

	g_hmac_copy (a_hmac: POINTER): POINTER is
 		-- g_hmac_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hmac_copy"
		}"
		end

	g_hmac_get_digest (a_hmac: POINTER; a_buffer: POINTER; a_digest_len: POINTER) is
 		-- g_hmac_get_digest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hmac_get_digest"
		}"
		end

	g_hmac_get_string (a_hmac: POINTER): POINTER is
 		-- g_hmac_get_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hmac_get_string"
		}"
		end

	g_hmac_new (a_digest_type: INTEGER; a_key: POINTER; a_key_len: NATURAL): POINTER is
 		-- g_hmac_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hmac_new"
		}"
		end

	g_hmac_ref (a_hmac: POINTER): POINTER is
 		-- g_hmac_ref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hmac_ref"
		}"
		end

	g_hmac_unref (a_hmac: POINTER) is
 		-- g_hmac_unref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hmac_unref"
		}"
		end

	g_hmac_update (a_hmac: POINTER; a_data: POINTER; a_length: INTEGER) is
 		-- g_hmac_update
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hmac_update"
		}"
		end


end -- class GHMAC_EXTERNALS
