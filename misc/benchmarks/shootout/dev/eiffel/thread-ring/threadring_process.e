class THREADRING_PROCESS

create {THREADRING}
	make

feature {}
	make (id: INTEGER; read_token: PIPE_OUTPUT; write_token, signal: PIPE_INPUT)
		local
			pf: PROCESS_FACTORY
		do
			process := pf.create_process
			process.set_direct_input(True)
			process.set_direct_output(True)
			process.set_direct_error(True)
			process.duplicate
			if process.is_child then
				run(id, read_token, write_token, signal)
				die_with_code(0)
			end
		end

	run (id: INTEGER; read_token: PIPE_OUTPUT; write_token, signal: PIPE_INPUT)
		local
			done: BOOLEAN
			token: INTEGER
			s: STRING
		do
			from
				read_token.read_line
			until
				done
			loop
				s := read_token.last_string
				inspect
					s
				when "shutdown" then
					done := True
				else
					token := s.to_integer
					if token <= 0 then
						signal.put_integer(id)
						signal.put_new_line
					else
						write_token.put_integer(token - 1)
						write_token.put_new_line
					end
					read_token.read_line
				end
			end
		end

	process: PROCESS

end
