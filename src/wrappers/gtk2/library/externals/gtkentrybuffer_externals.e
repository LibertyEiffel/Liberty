-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKENTRYBUFFER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_entry_buffer_delete_text (a_buffer: POINTER; a_position: NATURAL; a_n_chars: INTEGER): NATURAL is
 		-- gtk_entry_buffer_delete_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_delete_text"
		}"
		end

	gtk_entry_buffer_emit_deleted_text (a_buffer: POINTER; a_position: NATURAL; a_n_chars: NATURAL) is
 		-- gtk_entry_buffer_emit_deleted_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_emit_deleted_text"
		}"
		end

	gtk_entry_buffer_emit_inserted_text (a_buffer: POINTER; a_position: NATURAL; a_chars: POINTER; a_n_chars: NATURAL) is
 		-- gtk_entry_buffer_emit_inserted_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_emit_inserted_text"
		}"
		end

	gtk_entry_buffer_get_bytes (a_buffer: POINTER): NATURAL is
 		-- gtk_entry_buffer_get_bytes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_get_bytes"
		}"
		end

	gtk_entry_buffer_get_length (a_buffer: POINTER): NATURAL is
 		-- gtk_entry_buffer_get_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_get_length"
		}"
		end

	gtk_entry_buffer_get_max_length (a_buffer: POINTER): INTEGER is
 		-- gtk_entry_buffer_get_max_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_get_max_length"
		}"
		end

	gtk_entry_buffer_get_text (a_buffer: POINTER): POINTER is
 		-- gtk_entry_buffer_get_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_get_text"
		}"
		end

	gtk_entry_buffer_get_type: like long_unsigned is
 		-- gtk_entry_buffer_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_get_type()"
		}"
		end

	gtk_entry_buffer_insert_text (a_buffer: POINTER; a_position: NATURAL; a_chars: POINTER; a_n_chars: INTEGER): NATURAL is
 		-- gtk_entry_buffer_insert_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_insert_text"
		}"
		end

	gtk_entry_buffer_new (an_initial_chars: POINTER; a_n_initial_chars: INTEGER): POINTER is
 		-- gtk_entry_buffer_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_new"
		}"
		end

	gtk_entry_buffer_set_max_length (a_buffer: POINTER; a_max_length: INTEGER) is
 		-- gtk_entry_buffer_set_max_length
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_set_max_length"
		}"
		end

	gtk_entry_buffer_set_text (a_buffer: POINTER; a_chars: POINTER; a_n_chars: INTEGER) is
 		-- gtk_entry_buffer_set_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_buffer_set_text"
		}"
		end


end -- class GTKENTRYBUFFER_EXTERNALS
