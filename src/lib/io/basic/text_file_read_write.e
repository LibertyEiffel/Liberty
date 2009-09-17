class TEXT_FILE_READ_WRITE
	-- This class allow to read and write a named file on the disk.
	-- Note that opening a file in READ and WRITE mode is not very
	-- common case and lead to performance decrease compared to
	-- TEXT_FILE_READ and TEXT_FILE_WRITE performance. Such a file is
	-- both an INPUT_STREAM and an OUTPUT_STREAM.

inherit
	FILE
	TERMINAL_INPUT_OUTPUT_STREAM
		redefine filtered_read_line_in
		end

insert
	STRING_HANDLER

creation {ANY}
	make, connect_to, connect_for_appending_to

feature {ANY}
	connect_to (new_path: STRING) is
			-- Open for reading and writing. The stream is positioned at the
			-- beginning of the file.
		local
			s: POINTER; tfw: TEXT_FILE_WRITE
		do
			if not (create {FILE_TOOLS}).is_readable(new_path) then
				create tfw.connect_to(new_path)
				tfw.disconnect
			end
			check
				(create {FILE_TOOLS}).is_readable(new_path)
			end
			s := text_file_read_write_open(new_path.to_external)
			if s.is_not_null then
				stream := s
				path := new_path
			end
		end

	connect_for_appending_to (new_path: STRING) is
			-- Open for reading and writing. The file is created if it does not
			-- exist. The stream is positioned at the end of the file.
		local
			s: POINTER; tfw: TEXT_FILE_WRITE
		do
			if not (create {FILE_TOOLS}).is_readable(new_path) then
				create tfw.connect_to(new_path)
				tfw.disconnect
			end
			check
				(create {FILE_TOOLS}).is_readable(new_path)
			end
			s := text_file_read_write_append(new_path.to_external)
			if s.is_not_null then
				stream := s
				path := new_path
			end
		end

	disconnect is
		do
			io_fclose(stream)
			path := Void
		end

	can_unread_character: BOOLEAN is
		do
			Result := not unread_character_flag
		end

	end_of_input: BOOLEAN is
		do
			io_flush(stream)
			Result := io_feof(stream)
		end

feature {FILTER_INPUT_STREAM}
	filtered_last_character: CHARACTER

	filtered_read_character is
		local
			c: INTEGER
		do
			io_flush(stream)
			c := io_getc(stream)
			if c >= 0 then
				filtered_last_character := c.to_character
			end
			unread_character_flag := False
		end

	filtered_unread_character is
		local
			p: POINTER; c: CHARACTER
		do
			p := stream
			c := last_character
			io_ungetc(c, p)
			unread_character_flag := True
		end

	filtered_read_line_in (str: STRING) is
		do
			from
				read_character
			until
				end_of_input or else last_character = '%N'
			loop
				str.extend(last_character)
				read_character
			end
		end

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		do
			io_flush(stream)
			io_putc(c, stream)
		end

	filtered_flush is
		do
			io_flush(stream)
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			Result := sequencer_descriptor(stream)
		end

	filtered_has_descriptor: BOOLEAN is True

	filtered_stream_pointer: POINTER is
		do
			Result := stream
		end

	filtered_has_stream_pointer: BOOLEAN is True

feature {}
	unread_character_flag: BOOLEAN

	stream: POINTER

	make is
			-- The new created object is not connected. (See also `connect_to' and
			-- `connect_for_appending_to'.)
		do
		ensure
			not is_connected
		end

	text_file_read_write_open (a_path_pointer: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "io"
			feature_name: "text_file_read_write_open"
			}"
		end

	text_file_read_write_append (a_path_pointer: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "io"
			feature_name: "text_file_read_write_append"
			}"
		end

	io_fclose (a_stream_pointer: POINTER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "io"
			feature_name: "io_fclose"
			}"
		end

	io_feof (a_stream_pointer: POINTER): BOOLEAN is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "io"
			feature_name: "io_feof"
			}"
		end

end -- class TEXT_FILE_READ_WRITE
