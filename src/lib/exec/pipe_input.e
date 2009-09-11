-- See the Copyright notice at the end of this file.
--
class PIPE_INPUT
	--
	-- The "input" side of a pipe. That's an OUTPUT_STREAM ;-)
	--

inherit
	TERMINAL_OUTPUT_STREAM

insert
	PIPE_FUNCTIONS

creation {ANY}
	make, connect_to, named

feature {ANY}
	connect_to (a_output: like output) is
		require
			a_output.is_new
		do
			output := a_output
			a_output.handshake(Current)
			data := a_output.data
			is_connected := data /= default_pointer
		end

	is_connected: BOOLEAN

	disconnect is
		do
			basic_exec_pipe_out_disconnect(data)
			is_connected := False
		end

	output: PIPE_OUTPUT

	is_new: BOOLEAN is
		do
			Result := data = default_pointer
		end

	has_error: BOOLEAN is
		require
			is_connected
		local
			s: POINTER
		do
			s := basic_exec_pipe_error(data)
			Result := s /= default_pointer
		end

	error: STRING is
		require
			is_connected
			has_error
		do
			Result := once ""
			Result.from_external_copy(basic_exec_pipe_error(data))
		end

	set_write_failure_controler (a_controler: like write_failure_controler) is
		require
			not is_connected
		do
			write_failure_controler := a_controler
		ensure
			write_failure_controler = a_controler
		end

feature {PIPE_OUTPUT, PROCESS}
	data: POINTER

feature {PIPE_OUTPUT}
	handshake (a_output: like output) is
		require
			a_output.is_new
		do
			output := a_output
			data := basic_exec_pipe_create
			is_connected := data /= default_pointer
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			Result := basic_exec_pipe_out_fd(data)
		end

	filtered_has_descriptor: BOOLEAN is True

	filtered_stream_pointer: POINTER is
		do
			check False end
		end

	filtered_has_stream_pointer: BOOLEAN is False

	filtered_put_character (c: CHARACTER) is
		local
			ok: BOOLEAN; n: INTEGER
		do
			if write_failure_controler /= Void then
				from
				until
					ok
				loop
					n := basic_exec_pipe_write(data, c, False)
					if n > 0 then
						ok := True
					elseif n = 0 then
						ok := write_failure_controler.item([False])
					else
						if basic_exec_pipe_again(data) then
							ok := write_failure_controler.item([True])
						else
							ok := True
						end
					end
				end
			else
				n := basic_exec_pipe_write(data, c, True)
			end
		end

	filtered_flush is
		do
			basic_exec_pipe_flush(data)
		end

feature {}
	make is
		do
		end

	named (path: STRING; a_controler: like write_failure_controler) is
		require
			path /= Void
		do
			write_failure_controler := a_controler
			data := basic_exec_pipe_out_named(path.to_external)
			is_connected := data /= default_pointer
		end

	write_failure_controler: PREDICATE[TUPLE[BOOLEAN]]

end -- class PIPE_INPUT
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
