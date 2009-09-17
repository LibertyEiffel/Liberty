class ARGUMENTS
	--
	-- Insert this class when you need access to command-line arguments.
	--

insert
	ANY

feature {}
	argument_count: INTEGER is
			-- Number of arguments given to command that started system execution (command name does not count).
		do
			Result := command_arguments.upper
		ensure
			Result >= 0
		end

	argument (i: INTEGER): STRING is
			-- `i' th argument of command that started system execution
			-- Gives the command name if `i' is 0.
		require
			i >= 0
			i <= argument_count
		do
			Result := command_arguments.item(i)
		ensure
			Result /= Void
		end

	command_name: STRING is
		do
			Result := command_arguments.item(0)
		end

	frozen command_arguments: FAST_ARRAY[STRING] is
			-- Give acces to arguments command line including the command name at index 0.
			-- This is a once function, so you can modify command-line arguments!
		local
			i: INTEGER; arg: STRING
		once
			from
				i := se_argc
				create Result.make(i)
			until
				i = 0
			loop
				i := i - 1
				arg := se_argv(i)
				Result.put(arg, i)
			end
		ensure
			not Result.is_empty
		end

feature {} -- Implementation of ARGUMENTS (do not use directly):
	se_argc: INTEGER is
			-- To implement `command_arguments'
		external "built_in"
		end

	se_argv (i: INTEGER): STRING is
			-- To implement `command_arguments'
		external "built_in"
		end

end -- class ARGUMENTS
