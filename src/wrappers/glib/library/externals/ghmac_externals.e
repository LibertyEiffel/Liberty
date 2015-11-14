-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GHMAC_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_compute_hmac_for_data (a_digest_type: INTEGER; a_key: POINTER; a_key_len: like long_unsigned; a_data: POINTER; a_length: like long_unsigned): POINTER 
               -- g_compute_hmac_for_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_compute_hmac_for_data"
               }"
               end

	g_compute_hmac_for_string (a_digest_type: INTEGER; a_key: POINTER; a_key_len: like long_unsigned; a_str: POINTER; a_length: like long): POINTER 
               -- g_compute_hmac_for_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_compute_hmac_for_string"
               }"
               end

	g_hmac_copy (a_hmac: POINTER): POINTER 
               -- g_hmac_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hmac_copy"
               }"
               end

	g_hmac_get_digest (a_hmac: POINTER; a_buffer: POINTER; a_digest_len: POINTER) 
               -- g_hmac_get_digest
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hmac_get_digest"
               }"
               end

	g_hmac_get_string (a_hmac: POINTER): POINTER 
               -- g_hmac_get_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hmac_get_string"
               }"
               end

	g_hmac_new (a_digest_type: INTEGER; a_key: POINTER; a_key_len: like long_unsigned): POINTER 
               -- g_hmac_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hmac_new"
               }"
               end

	g_hmac_ref (a_hmac: POINTER): POINTER 
               -- g_hmac_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hmac_ref"
               }"
               end

	g_hmac_unref (a_hmac: POINTER) 
               -- g_hmac_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hmac_unref"
               }"
               end

	g_hmac_update (a_hmac: POINTER; a_data: POINTER; a_length: like long) 
               -- g_hmac_update
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hmac_update"
               }"
               end


end -- class GHMAC_EXTERNALS
