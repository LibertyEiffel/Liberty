class STD_ERROR
	--
	-- To write on the standard error output. As for UNIX, the default standard error file is the screen.
	--
	-- Note: only one instance of this class should be necessary.  Access it through ANY.std_error.
	--
	-- See also STANDARD_STREAMS
	--

inherit
	TERMINAL_OUTPUT_STREAM
		redefine
			dispose
		end
	
insert
	REDIRECTION_TOOLS
		rename
			restore_default as restore_default_error
		redefine
			restore_default_error
		end

creation {ANY}
	make

feature {ANY}
	is_connected: BOOLEAN is True

	disconnect is
		do
			filter := Void
		end

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		do
			io_putc(c, stderr)
		end

	filtered_flush is
		do
			std_output.flush
			io_flush(stderr)
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			Result := sequencer_descriptor(stderr)
		end

	filtered_has_descriptor: BOOLEAN is True

	filtered_stream_pointer: POINTER is
		do
			Result := stderr
		end

	filtered_has_stream_pointer: BOOLEAN is True

feature {STREAM_HANDLER}
	redirect_to (file_name: STRING) is
			-- Redirect standard error to `file_name' instead of the default standard error.  If `file_name'
			-- does not exist, it is created.  If it exists, its previous content is erased.
			--
			-- See also `redirection_succeeded'
		do
			redirect(open_descriptor_for_create(file_name.to_external))
		end

	redirect_append_to (file_name: STRING) is
			-- Redirect standard error to `file_name' instead of the default standard error.  If `file_name'
			-- does not exist, it is created.  If it exists, the new error stream is appended to it.
			--
			-- See also `redirection_succeeded'
		do
			redirect(open_descriptor_for_append(file_name.to_external))
		end

	restore_default_error is
			-- Restore standard error to go to the default standard error.
		do
			Precursor
		end

feature {}
	make is
		do
		end

	stderr: POINTER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "io"
			feature_name: "stderr"
			}"
		end

	dispose is
		do
			check
				std_error = Current
			end
			-- Nothing to dispode for `std_error'.
		end
	
end -- class STD_ERROR
