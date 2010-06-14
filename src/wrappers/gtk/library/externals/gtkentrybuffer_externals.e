-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKENTRYBUFFER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_entry_buffer_get_length (a_buffer: POINTER): NATURAL_32 is
 		-- gtk_entry_buffer_get_length (node at line 6371)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_get_length"
		}"
		end

	gtk_entry_buffer_set_max_length (a_buffer: POINTER; a_max_length: INTEGER_32) is
 		-- gtk_entry_buffer_set_max_length (node at line 7658)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_set_max_length"
		}"
		end

	gtk_entry_buffer_new (an_initial_chars: POINTER; a_n_initial_chars: INTEGER_32): POINTER is
 		-- gtk_entry_buffer_new (node at line 10189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_new"
		}"
		end

	gtk_entry_buffer_get_text (a_buffer: POINTER): POINTER is
 		-- gtk_entry_buffer_get_text (node at line 13934)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_get_text"
		}"
		end

	gtk_entry_buffer_emit_inserted_text (a_buffer: POINTER; a_position: NATURAL_32; a_chars: POINTER; a_n_chars: NATURAL_32) is
 		-- gtk_entry_buffer_emit_inserted_text (node at line 20112)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_emit_inserted_text"
		}"
		end

	gtk_entry_buffer_get_type: NATURAL_32 is
 		-- gtk_entry_buffer_get_type (node at line 22584)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_get_type()"
		}"
		end

	gtk_entry_buffer_emit_deleted_text (a_buffer: POINTER; a_position: NATURAL_32; a_n_chars: NATURAL_32) is
 		-- gtk_entry_buffer_emit_deleted_text (node at line 26368)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_emit_deleted_text"
		}"
		end

	gtk_entry_buffer_get_bytes (a_buffer: POINTER): NATURAL_32 is
 		-- gtk_entry_buffer_get_bytes (node at line 28771)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_get_bytes"
		}"
		end

	gtk_entry_buffer_get_max_length (a_buffer: POINTER): INTEGER_32 is
 		-- gtk_entry_buffer_get_max_length (node at line 28940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_get_max_length"
		}"
		end

	gtk_entry_buffer_set_text (a_buffer: POINTER; a_chars: POINTER; a_n_chars: INTEGER_32) is
 		-- gtk_entry_buffer_set_text (node at line 30545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_set_text"
		}"
		end

	gtk_entry_buffer_delete_text (a_buffer: POINTER; a_position: NATURAL_32; a_n_chars: INTEGER_32): NATURAL_32 is
 		-- gtk_entry_buffer_delete_text (node at line 32074)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_delete_text"
		}"
		end

	gtk_entry_buffer_insert_text (a_buffer: POINTER; a_position: NATURAL_32; a_chars: POINTER; a_n_chars: INTEGER_32): NATURAL_32 is
 		-- gtk_entry_buffer_insert_text (node at line 32456)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_insert_text"
		}"
		end


end -- class GTKENTRYBUFFER_EXTERNALS
