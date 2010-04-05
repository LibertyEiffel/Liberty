-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOG_LEVEL

creation {LOGGING}
	make

feature {ANY}
	set_output (a_output: like output) is
		require
			a_output /= Void
		do
			output := a_output
		ensure
			output = a_output
		end

feature {LOGGING}
	stream (a_level: like Current): like output is
		require
			a_level /= Void
		do
			if does_log(a_level) then
				Result := output
			else
				Result := sink
			end
		ensure
			Result /= Void
		end

	does_log (a_level: like Current): BOOLEAN is
		require
			a_level /= Void
		do
			Result := a_level.level <= level
		end

feature {LOG_LEVEL}
	level: INTEGER

feature {}
	make (a_level: like level) is
		do
			level := a_level
			output := std_output
		ensure
			level = a_level
		end

	output: OUTPUT_STREAM

	sink: NULL_OUTPUT_STREAM is
		once
			create Result
		end

invariant
	output /= Void

end -- class LOG_LEVEL
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
