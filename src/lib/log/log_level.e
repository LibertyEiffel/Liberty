-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOG_LEVEL

creation {LOG_LEVELS}
	make

feature {LOGGER}
	stream (a_level: like Current; a_log_output: LOG_OUTPUT; a_logger_tag: FIXED_STRING): OUTPUT_STREAM is
		require
			a_level /= Void
			a_logger_tag /= Void
		do
			if does_log(a_level) then
				a_log_output.set(tag, a_logger_tag)
				Result := a_log_output
			else
				Result := bottomless_pit
			end
		ensure
			Result /= Void
		end

	does_log (a_level: like Current): BOOLEAN is
		require
			a_level /= Void
		do
			Result := a_level.level >= level
		end

feature {LOG_LEVEL}
	level: INTEGER
	tag: FIXED_STRING

feature {}
	make (a_level: like level; a_tag: like tag) is
		require
			a_tag /= Void
		do
			level := a_level
			tag := a_tag
		ensure
			level = a_level
			tag = a_tag
		end

	bottomless_pit: OUTPUT_STREAM is
		once
			create {NULL_OUTPUT_STREAM} Result
		end

invariant
	level /= Void
	tag /= Void

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
