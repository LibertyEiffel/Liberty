-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GCHECKSUM_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_checksum_copy (a_checksum: POINTER): POINTER 
               -- g_checksum_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_checksum_copy"
               }"
               end

	g_checksum_free (a_checksum: POINTER) 
               -- g_checksum_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_checksum_free"
               }"
               end

	g_checksum_get_digest (a_checksum: POINTER; a_buffer: POINTER; a_digest_len: POINTER) 
               -- g_checksum_get_digest
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_checksum_get_digest"
               }"
               end

	g_checksum_get_string (a_checksum: POINTER): POINTER 
               -- g_checksum_get_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_checksum_get_string"
               }"
               end

	g_checksum_new (a_checksum_type: INTEGER): POINTER 
               -- g_checksum_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_checksum_new"
               }"
               end

	g_checksum_reset (a_checksum: POINTER) 
               -- g_checksum_reset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_checksum_reset"
               }"
               end

	g_checksum_type_get_length (a_checksum_type: INTEGER): like long 
               -- g_checksum_type_get_length
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_checksum_type_get_length"
               }"
               end

	g_checksum_update (a_checksum: POINTER; a_data: POINTER; a_length: like long) 
               -- g_checksum_update
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_checksum_update"
               }"
               end

	g_compute_checksum_for_bytes (a_checksum_type: INTEGER; a_data: POINTER): POINTER 
               -- g_compute_checksum_for_bytes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_compute_checksum_for_bytes"
               }"
               end

	g_compute_checksum_for_data (a_checksum_type: INTEGER; a_data: POINTER; a_length: like long_unsigned): POINTER 
               -- g_compute_checksum_for_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_compute_checksum_for_data"
               }"
               end

	g_compute_checksum_for_string (a_checksum_type: INTEGER; a_str: POINTER; a_length: like long): POINTER 
               -- g_compute_checksum_for_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_compute_checksum_for_string"
               }"
               end


end -- class GCHECKSUM_EXTERNALS
