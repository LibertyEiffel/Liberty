-- See the Copyright notice at the end of this file.
--
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
