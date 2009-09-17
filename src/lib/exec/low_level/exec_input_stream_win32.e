class EXEC_INPUT_STREAM_WIN32

inherit
	TERMINAL_INPUT_STREAM

insert
	EXEC_STREAM

creation {PROCESS}
	make

feature {ANY}
	can_unread_character: BOOLEAN

	end_of_input: BOOLEAN

	is_connected: BOOLEAN

	disconnect is
		do
			is_connected := False
			basic_exec_close(handle)
		end

feature {}
	has_unread_character: BOOLEAN

	unread_buffer: CHARACTER

	swap_unread_buffer is
		local
			tmp_buffer: CHARACTER
		do
			tmp_buffer := unread_buffer
			unread_buffer := filtered_last_character
			filtered_last_character := tmp_buffer
		ensure
			unread_buffer = old filtered_last_character
			filtered_last_character = old unread_buffer
		end

feature {FILTER}
	filtered_read_character is
		local
			i: INTEGER
		do
			if has_unread_character then
				has_unread_character := False
				swap_unread_buffer
				end_of_input := False
			else
				unread_buffer := filtered_last_character
				i := basic_exec_get_character(handle)
				if i = -1 then
					end_of_input := True
				else
					filtered_last_character := i.to_character
					end_of_input := False
				end
			end
			can_unread_character := not end_of_input
		end

	filtered_unread_character is
		do
			has_unread_character := True
			can_unread_character := False
			swap_unread_buffer
		end

	filtered_last_character: CHARACTER

	filtered_descriptor: INTEGER is
		do
			std_error.put_string("EXEC_INPUT_STREAM_WIN32.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("EXEC_INPUT_STREAM_WIN32.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_stream_pointer: BOOLEAN is False

feature {PROCESS}
	make (a_process: like process) is
		require
			a_process /= Void
			process /= Void implies process = a_process
		do
			can_unread_character := False
			end_of_input := False
			has_unread_character := False
			process := a_process
			create_pipe
			if pipe.is_not_null then
				handle := basic_exec_get_in_handle(pipe)
				is_connected := True
			end
		end

	process: PROCESS

feature {}
	handle: POINTER

	basic_exec_get_in_handle (a_pipe: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_win32_get_in_handle"
			}"
		end

	basic_exec_get_character (handle_: POINTER): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_win32_get_character"
			}"
		end

	basic_exec_close (handle_: POINTER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_win32_close"
			}"
		end

end -- class EXEC_INPUT_STREAM_WIN32
