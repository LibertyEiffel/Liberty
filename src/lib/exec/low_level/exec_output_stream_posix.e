-- See the Copyright notice at the end of this file.
--
class EXEC_OUTPUT_STREAM_POSIX

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
			basic_exec_close(filtered_descriptor)
		end

feature {FILTER}
	filtered_put_character (c: CHARACTER) is
		do
			basic_exec_put_character(descriptor, c)
			if c = '%N' then
				filtered_flush
			end
		end

	filtered_flush is
		do
			basic_exec_flush(descriptor)
		end

	filtered_descriptor: INTEGER

	filtered_has_descriptor: BOOLEAN is True

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("EXEC_OUTPUT_STREAM_POSIX.filtered_stream_pointer has been called!%N")
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
				filtered_descriptor := basic_exec_get_out_descriptor(pipe)
			end
		end

	process: PROCESS

feature {}
	basic_exec_get_out_descriptor (a_pipe: POINTER): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_posix_get_out_descriptor"
			}"
		end

	basic_exec_put_character (fd: INTEGER; c: CHARACTER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_posix_put_character"
			}"
		end

	basic_exec_flush (fd: INTEGER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_posix_flush"
			}"
		end

	basic_exec_close (a_fd: INTEGER) is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "exec"
			feature_name: "basic_exec_posix_close"
			}"
		end

end -- class EXEC_OUTPUT_STREAM_POSIX
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
