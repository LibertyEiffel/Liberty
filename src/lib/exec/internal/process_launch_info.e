class PROCESS_LAUNCH_INFO

creation {ANY}
	execute, execute_command_line

feature {ANY}
	program: STRING
	arguments: TRAVERSABLE[STRING]
	keep_environment: BOOLEAN
	command_line: STRING

	execute (program_: like program; arguments_: like arguments; keep_environment_: like keep_environment) is
		require
			program_ /= Void
			arguments_ /= Void
		do
			--|*** Memory leak
			program := program_.twin
			arguments := arguments_.deep_twin
			keep_environment := keep_environment_
			command_line := Void
		ensure
			program.is_equal(program_)
			keep_environment = keep_environment_
		end

	execute_command_line (command_line_: like command_line; keep_environment_: like keep_environment) is
		require
			command_line_ /= Void
		do
			--|*** Memory leak
			program := Void
			arguments := Void
			keep_environment := keep_environment_
			command_line := command_line_.twin
		ensure
			command_line.is_equal(command_line_)
			keep_environment = keep_environment_
		end

invariant
	command_line = Void xor program = Void
	command_line = Void xor arguments = Void

end -- class PROCESS_LAUNCH_INFO
