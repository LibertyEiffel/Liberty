deferred class PROCESS_RUNNER

feature {ANY}
	execute (program: STRING; arguments: TRAVERSABLE[STRING]; keep_environment: BOOLEAN) is
			-- Execute the given `program' (how the program is discovered is os-dependant), passing to it the
			-- `arguments'. The environment is cleared if `keep_environment' is False.
		require
			program /= Void
			is_ready
		deferred
		end

	execute_command_line (command_line: STRING; keep_environment: BOOLEAN) is
			-- Execute the `command_line' through the operating system's basic shell. The environment is cleared
			-- if `keep_environment' is False.
			--
			-- See also: SYSTEM.execute_command
		require
			command_line /= Void
			not command_line.is_empty
			is_ready
		deferred
		end

	is_ready: BOOLEAN is
		deferred
		end

end -- class PROCESS_RUNNER
