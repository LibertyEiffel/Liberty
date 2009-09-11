deferred class REDIRECTION_TOOLS

feature {STREAM_HANDLER}
	redirection_succeeded: BOOLEAN
			-- Did the last call to redirect succeed?

	restore_default is
			-- Cancel redirection
		do
			flush
			save_default_descriptor
			dup2(default_descriptor, filtered_descriptor)
		end

feature {}
	filtered_descriptor: INTEGER is
		deferred
		end

	flush is
		deferred
		end

	redirect (file_descriptor: INTEGER) is
			-- Redirect to/from `file_descriptor'
		do
			redirection_succeeded := open_descriptor_succeeded (file_descriptor)
			if redirection_succeeded then
				flush
				save_default_descriptor
				dup2(file_descriptor, filtered_descriptor)
				close_descriptor(file_descriptor)
			end
		end

	save_default_descriptor is
			-- Always call this before calling `dup2'(..., `filtered_descriptor')
		once
			default_descriptor := dup(filtered_descriptor)
		end

	default_descriptor: INTEGER
			-- A descriptor that referes to the same file as stdin initially does.

	dup (descriptor_: INTEGER): INTEGER is
			-- Return a new descriptor that refers to the same file as `descriptor_'.
		external "plug_in"
		alias "{
			location: "${sys}/plugins/io"
			module_name: "low_level_redirection"
			feature_name: "dup"
			}"
		end

	dup2 (descriptor_1, descriptor_2: INTEGER) is
			-- Make `descriptor_2' point to the same file as `descriptor_1'.
		external "plug_in"
		alias "{
			location: "${sys}/plugins/io"
			module_name: "low_level_redirection"
			feature_name: "dup2"
			}"
		end

	open_descriptor_for_read (file_name: POINTER): INTEGER is
			-- Open `file_name' for reading, returning a descriptor to it.
		external "plug_in"
		alias "{
			location: "${sys}/plugins/io"
			module_name: "low_level_redirection"
			feature_name: "open_descriptor_for_read"
			}"
		end

	open_descriptor_for_create (file_name: POINTER): INTEGER is
			-- Open `file_name' for writing, returning a descriptor to it. The file is truncated if it already
			-- existed.
		external "plug_in"
		alias "{
			location: "${sys}/plugins/io"
			module_name: "low_level_redirection"
			feature_name: "open_descriptor_for_create"
			}"
		end

	open_descriptor_for_append (file_name: POINTER): INTEGER is
			-- Open `file_name' for writing, returning a descriptor to it. New content is appended to the end of
			-- the file if it already existed.
		external "plug_in"
		alias "{
			location: "${sys}/plugins/io"
			module_name: "low_level_redirection"
			feature_name: "open_descriptor_for_append"
			}"
		end

	open_descriptor_succeeded (descriptor_: INTEGER): BOOLEAN is
			-- Did open returning `descriptor_' succeed ?
		external "plug_in"
		alias "{
			location: "${sys}/plugins/io"
			module_name: "low_level_redirection"
			feature_name: "open_descriptor_succeeded"
			}"
		end

	close_descriptor (descriptor_: INTEGER) is
			-- Close `descriptor_', freeing it for later use.
		external "plug_in"
		alias "{
			location: "${sys}/plugins/io"
			module_name: "low_level_redirection"
			feature_name: "close_descriptor"
			}"
		end

end -- class REDIRECTION_TOOLS
