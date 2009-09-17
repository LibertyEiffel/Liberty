class PROCESS_NONE
	--
	-- This class allows one to spawn an external process and make it execute some file.
	--
	-- The standard streams of the process are available: `input', `output' and `error'.
	--
	-- '''Note:''' This class is in a beta stage. POSIX and Windows versions are available but there may be 
	-- resource leaks or other bugs left.
	--

inherit
	PROCESS
		redefine
			group
		end

creation {ANY}
	execute, execute_command_line, make

feature {ANY}
	id: INTEGER is
		do
			check
				False
			end
		end

	is_child: BOOLEAN is False

	is_connected: BOOLEAN is False

	is_finished: BOOLEAN is
		do
			check
				False
			end
		end

	status: INTEGER is
		do
			check
				False
			end
		end

	wait is
		do
			check
				False
			end
		end

	input: OUTPUT_STREAM is
		do
		end

	output: INPUT_STREAM is
		do
		end

	error: INPUT_STREAM is
		do
		end

	execute (program: STRING; arguments: TRAVERSABLE[STRING]; keep_environment: BOOLEAN) is
		do
			make
		end

	execute_command_line (command_line: STRING; keep_environment: BOOLEAN) is
		do
			make
		end

	duplicate is
		do
			make
		end

	group: PROCESS_GROUP_NONE

feature {}
	make is
		local
			process_factory: PROCESS_FACTORY
		do
			if group = Void then
				group ::= process_factory.default_group
			end
		end

end -- class PROCESS_NONE
