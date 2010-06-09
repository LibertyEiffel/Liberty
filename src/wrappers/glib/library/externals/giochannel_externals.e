-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GIOCHANNEL_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_io_channel_get_close_on_unref (a_channel: POINTER): INTEGER_32 is
 		-- g_io_channel_get_close_on_unref (node at line 97)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_get_close_on_unref"
		}"
		end

	g_io_channel_get_encoding (a_channel: POINTER): POINTER is
 		-- g_io_channel_get_encoding (node at line 533)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_get_encoding"
		}"
		end

	g_io_create_watch (a_channel: POINTER; a_condition: INTEGER): POINTER is
 		-- g_io_create_watch (node at line 663)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_create_watch"
		}"
		end

	g_io_add_watch_full (a_channel: POINTER; a_priority: INTEGER_32; a_condition: INTEGER; a_func: POINTER; an_user_data: POINTER; a_notify: POINTER): NATURAL_32 is
 		-- g_io_add_watch_full (node at line 968)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_add_watch_full"
		}"
		end

	g_io_channel_get_buffer_condition (a_channel: POINTER): INTEGER is
 		-- g_io_channel_get_buffer_condition (node at line 1029)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_get_buffer_condition"
		}"
		end

	g_io_channel_set_buffered (a_channel: POINTER; a_buffered: INTEGER_32) is
 		-- g_io_channel_set_buffered (node at line 1099)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_set_buffered"
		}"
		end

	g_io_channel_read (a_channel: POINTER; a_buf: POINTER; a_count: NATURAL_32; a_bytes_read: POINTER): INTEGER is
 		-- g_io_channel_read (node at line 1182)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_read"
		}"
		end

	g_io_channel_seek_position (a_channel: POINTER; an_offset: INTEGER_64; a_type: INTEGER; an_error: POINTER): INTEGER is
 		-- g_io_channel_seek_position (node at line 1188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_seek_position"
		}"
		end

	g_io_channel_error_quark: NATURAL_32 is
 		-- g_io_channel_error_quark (node at line 1387)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_error_quark()"
		}"
		end

	g_io_channel_get_line_term (a_channel: POINTER; a_length: POINTER): POINTER is
 		-- g_io_channel_get_line_term (node at line 1399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_get_line_term"
		}"
		end

	g_io_channel_get_buffered (a_channel: POINTER): INTEGER_32 is
 		-- g_io_channel_get_buffered (node at line 1641)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_get_buffered"
		}"
		end

	g_io_channel_read_chars (a_channel: POINTER; a_buf: POINTER; a_count: NATURAL_32; a_bytes_read: POINTER; an_error: POINTER): INTEGER is
 		-- g_io_channel_read_chars (node at line 1863)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_read_chars"
		}"
		end

	g_io_add_watch (a_channel: POINTER; a_condition: INTEGER; a_func: POINTER; an_user_data: POINTER): NATURAL_32 is
 		-- g_io_add_watch (node at line 2112)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_add_watch"
		}"
		end

	g_io_channel_write_unichar (a_channel: POINTER; a_thechar: NATURAL_32; an_error: POINTER): INTEGER is
 		-- g_io_channel_write_unichar (node at line 2197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_write_unichar"
		}"
		end

	g_io_channel_write (a_channel: POINTER; a_buf: POINTER; a_count: NATURAL_32; a_bytes_written: POINTER): INTEGER is
 		-- g_io_channel_write (node at line 2292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_write"
		}"
		end

	g_io_channel_close (a_channel: POINTER) is
 		-- g_io_channel_close (node at line 2654)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_close"
		}"
		end

	g_io_channel_set_encoding (a_channel: POINTER; an_encoding: POINTER; an_error: POINTER): INTEGER is
 		-- g_io_channel_set_encoding (node at line 2771)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_set_encoding"
		}"
		end

	g_io_channel_get_flags (a_channel: POINTER): INTEGER is
 		-- g_io_channel_get_flags (node at line 3135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_get_flags"
		}"
		end

	g_io_channel_unref (a_channel: POINTER) is
 		-- g_io_channel_unref (node at line 3138)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_unref"
		}"
		end

	g_io_channel_init (a_channel: POINTER) is
 		-- g_io_channel_init (node at line 3163)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_init"
		}"
		end

	g_io_channel_unix_get_fd (a_channel: POINTER): INTEGER_32 is
 		-- g_io_channel_unix_get_fd (node at line 3296)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_unix_get_fd"
		}"
		end

	g_io_channel_set_buffer_size (a_channel: POINTER; a_size: NATURAL_32) is
 		-- g_io_channel_set_buffer_size (node at line 3342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_set_buffer_size"
		}"
		end

	g_io_channel_read_line_string (a_channel: POINTER; a_buffer: POINTER; a_terminator_pos: POINTER; an_error: POINTER): INTEGER is
 		-- g_io_channel_read_line_string (node at line 3647)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_read_line_string"
		}"
		end

	g_io_channel_error_from_errno (an_en: INTEGER_32): INTEGER is
 		-- g_io_channel_error_from_errno (node at line 3969)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_error_from_errno"
		}"
		end

	g_io_channel_set_close_on_unref (a_channel: POINTER; a_do_close: INTEGER_32) is
 		-- g_io_channel_set_close_on_unref (node at line 4139)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_set_close_on_unref"
		}"
		end

	g_io_channel_read_line (a_channel: POINTER; a_str_return: POINTER; a_length: POINTER; a_terminator_pos: POINTER; an_error: POINTER): INTEGER is
 		-- g_io_channel_read_line (node at line 4158)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_read_line"
		}"
		end

	g_io_channel_read_to_end (a_channel: POINTER; a_str_return: POINTER; a_length: POINTER; an_error: POINTER): INTEGER is
 		-- g_io_channel_read_to_end (node at line 4330)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_read_to_end"
		}"
		end

	g_io_channel_set_line_term (a_channel: POINTER; a_line_term: POINTER; a_length: INTEGER_32) is
 		-- g_io_channel_set_line_term (node at line 4412)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_set_line_term"
		}"
		end

	g_io_channel_unix_new (a_fd: INTEGER_32): POINTER is
 		-- g_io_channel_unix_new (node at line 4646)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_unix_new"
		}"
		end

	g_io_channel_shutdown (a_channel: POINTER; a_flush: INTEGER_32; an_err: POINTER): INTEGER is
 		-- g_io_channel_shutdown (node at line 4712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_shutdown"
		}"
		end

	g_io_channel_flush (a_channel: POINTER; an_error: POINTER): INTEGER is
 		-- g_io_channel_flush (node at line 4925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_flush"
		}"
		end

	g_io_channel_write_chars (a_channel: POINTER; a_buf: POINTER; a_count: INTEGER_32; a_bytes_written: POINTER; an_error: POINTER): INTEGER is
 		-- g_io_channel_write_chars (node at line 4991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_write_chars"
		}"
		end

	g_io_channel_set_flags (a_channel: POINTER; a_flags: INTEGER; an_error: POINTER): INTEGER is
 		-- g_io_channel_set_flags (node at line 5134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_set_flags"
		}"
		end

	g_io_channel_read_unichar (a_channel: POINTER; a_thechar: POINTER; an_error: POINTER): INTEGER is
 		-- g_io_channel_read_unichar (node at line 5356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_read_unichar"
		}"
		end

	g_io_channel_seek (a_channel: POINTER; an_offset: INTEGER_64; a_type: INTEGER): INTEGER is
 		-- g_io_channel_seek (node at line 6397)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_seek"
		}"
		end

	g_io_channel_ref (a_channel: POINTER): POINTER is
 		-- g_io_channel_ref (node at line 6527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_ref"
		}"
		end

	g_io_channel_new_file (a_filename: POINTER; a_mode: POINTER; an_error: POINTER): POINTER is
 		-- g_io_channel_new_file (node at line 6792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_new_file"
		}"
		end

	g_io_channel_get_buffer_size (a_channel: POINTER): NATURAL_32 is
 		-- g_io_channel_get_buffer_size (node at line 6835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_io_channel_get_buffer_size"
		}"
		end

feature {} -- Variables
	-- Variable g_io_watch_funcs (at line 303 in file /usr/include/glib-2.0/glib/giochannel.h is does not have a wrapper type

end -- class GIOCHANNEL_EXTERNALS
