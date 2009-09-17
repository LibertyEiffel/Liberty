class EXEC_OUTPUT_STREAM_WIN32

inherit
	TERMINAL_OUTPUT_STREAM
		redefine
			can_put_character
		end

insert
	EXEC_STREAM

creation {PROCESS}
	make

feature {ANY}
	is_connected: BOOLEAN

	can_put_character (c: CHARACTER): BOOLEAN is
		do
			Result := not process.is_finished
		end

	disconnect is
		do
			is_connected := False
			basic_exec_close(handle)
		end

feature {FILTER}
	filtered_put_character (c: CHARACTER) is
		do
			basic_exec_put_character(handle, c)
			if c = '%N' then
				filtered_flush
			end
		end

	filtered_flush is
		do
			basic_exec_flush(handle)
		end

	filtered_descriptor: INTEGER is
		do
			std_error.put_string("EXEC_OUTPUT_STREAM_WIN32.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("EXEC_OUTPUT_STREAM_WIN32.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_stream_pointer: BOOLEAN is False

feature {PROCESS}
	make (a_process: like process) is
		require
			a_process /= Void
			process /= Void implies process = a_process
		do
			process := a_process
			create_pipe
			is_connected := pipe.is_not_null
			if is_connected then
				handle := basic_exec_get_out_handle(pipe)
			end
		end

	process: PROCESS

feature {}
	handle: POINTER

	basic_exec_get_out_handle (a_pipe: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_win32_get_out_handle"
			}"
		end

	basic_exec_put_character (handle_: POINTER; c: CHARACTER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_win32_put_character"
			}"
		end

	basic_exec_flush (handle_: POINTER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_win32_flush"
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

end -- class EXEC_OUTPUT_STREAM_WIN32
