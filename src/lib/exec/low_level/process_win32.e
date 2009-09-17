class PROCESS_WIN32
	--
	-- This class allows one to spawn an external process and make it execute some file.
	--
	-- The standard streams of the process are available: `input', `output' and `error'.
	--
	-- '''Note:''' This class is in a beta stage, there may be resource leaks or other bugs left.
	--

inherit
	PROCESS
		redefine
			group
		end
	DISPOSABLE

creation {ANY}
	execute, execute_command_line, make

feature {ANY}
	id: INTEGER is
		do
			Result := basic_exec_id(data)
		end

	is_child: BOOLEAN is False

	is_connected: BOOLEAN

	is_finished: BOOLEAN is
		do
			Result := basic_exec_is_finished(data)
			if Result then
				do_cleanup
			end
		end

	status: INTEGER is
		do
			Result := basic_exec_status(data)
		end

	wait is
		do
			basic_exec_wait(data)
			do_cleanup
		end

	input: OUTPUT_STREAM

	output: INPUT_STREAM

	error: INPUT_STREAM

	execute (program: STRING; arguments: TRAVERSABLE[STRING]; keep_environment: BOOLEAN) is
		local
			i: INTEGER; st_prog_args: STRING; prog_args: POINTER
		do
			make
			if arguments /= Void then
				from
					st_prog_args := program.twin
					i := arguments.lower
				until
					i > arguments.upper
				loop
					st_prog_args.extend(' ')
					st_prog_args.append(arguments.item(i))
					i := i + 1
				end
			else
				st_prog_args := program
			end
			prog_args := st_prog_args.to_external
			do_execute(prog_args, keep_environment)
		end

	execute_command_line (command_line: STRING; keep_environment: BOOLEAN) is
		local
			prog_args: POINTER
		do
			make
			prog_args := command_line.to_external
			do_execute(prog_args, keep_environment)
		end

	duplicate is
		do
			-- fork(2) on Windows??
			not_yet_implemented
		end

	group: PROCESS_GROUP_WIN32

feature {PROCESS_GROUP}
	cleanup (stat: INTEGER) is
		do
			basic_exec_cleanup(data, stat)
			do_cleanup
		end

	handle: INTEGER is
		do
			Result := basic_exec_win32_handle(data)
		end

feature {}
	dispose is
		do
			-- Call is_finished to get a last opportunity to clean up
			if not (is_connected implies is_finished) then
				sedb_breakpoint
			end
			basic_exec_free_data(data)
		end

	do_cleanup is
		do
			group.unregister(Current)
			cleanup_streams
		end

	make is
		local
			process_factory: PROCESS_FACTORY
		do
			if group = Void then
				data := basic_exec_alloc_data
				group ::= process_factory.default_group
			end
		end

	instream: EXEC_OUTPUT_STREAM_WIN32

	outstream, errstream: EXEC_INPUT_STREAM_WIN32

	do_execute (program_arguments: POINTER; keep_environment: BOOLEAN) is
		require
			not program_arguments.is_null
			is_connected implies is_finished
			input /= Void implies not input.is_connected
			output /= Void implies not output.is_connected
			error /= Void implies not error.is_connected
		local
			inpipe, outpipe, errpipe: POINTER
		do
			if not direct_input then
				if instream = Void then
					create instream.make(Current)
				else
					instream.make(Current)
				end
				inpipe := instream.pipe
				input := instream
			else
				input := Void
			end

			if not direct_output then
				if outstream = Void then
					create outstream.make(Current)
				else
					outstream.make(Current)
				end
				outpipe := outstream.pipe
				output := outstream
			else
				output := Void
			end

			if not direct_error then
				if errstream = Void then
					create errstream.make(Current)
				else
					errstream.make(Current)
				end
				errpipe := errstream.pipe
				error := errstream
			else
				error := Void
			end

			is_connected := basic_exec_win32_execute(data, program_arguments, keep_environment, default_pointer, inpipe, outpipe, errpipe)
			if is_connected then
				check
					id > 0
				end
				group.register(Current)
			else
				input := Void
				output := Void
				error := Void
			end
		end

feature {EXEC_INPUT_STREAM_WIN32, EXEC_OUTPUT_STREAM_WIN32} -- plugin lowlevel data
	data: POINTER

feature {} -- plugin features
	basic_exec_win32_execute (dat, arguments: POINTER; keep_environment: BOOLEAN; add_environment: POINTER; in_fd, out_fd, err_fd: POINTER): BOOLEAN is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_win32_execute"
			}"
		end

	basic_exec_id (dat: like data): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_id"
			}"
		end

	basic_exec_alloc_data: like data is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_alloc_data()"
			}"
		end

	basic_exec_free_data (dat: like data) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_free_data"
			}"
		end

	basic_exec_win32_handle (dat: like data): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_win32_handle"
			}"
		end

	basic_exec_is_finished (dat: like data): BOOLEAN is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_is_finished"
			}"
		end

	basic_exec_status (dat: like data): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_status"
			}"
		end

	basic_exec_wait (dat: like data) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_wait"
			}"
		end

	basic_exec_cleanup (dat: like data; stat: INTEGER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_cleanup"
			}"
		end

invariant
	data.is_not_null

end -- class PROCESS_WIN32
