-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class LOGGING
--
-- Logging infrastructure. Keep it simple.
--

feature {ANY}
	trace: OUTPUT_STREAM is
		do
			Result := level.stream(level_trace)
		ensure
			Result /= Void
		end

	info: OUTPUT_STREAM is
		do
			Result := level.stream(level_info)
		ensure
			Result /= Void
		end

	warning: OUTPUT_STREAM is
		do
			Result := level.stream(level_warning)
		ensure
			Result /= Void
		end

	error: OUTPUT_STREAM is
		do
			Result := level.stream(level_error)
		ensure
			Result /= Void
		end

	is_trace: BOOLEAN is
		do
			Result := level.does_log(level_trace)
		end

	is_info: BOOLEAN is
		do
			Result := level.does_log(level_info)
		end

	is_warning: BOOLEAN is
		do
			Result := level.does_log(level_warning)
		end

	is_error: BOOLEAN is
		do
			Result := level.does_log(level_error)
		end

feature {ANY}
	set_level (a_level: like level) is
		require
			a_level /= Void
		do
			level_memory.set_item(a_level)
		ensure
			level = a_level
		end

	level: LOG_LEVEL is
		do
			Result := level_memory.item
		end

	level_trace: LOG_LEVEL is
		once
			create Result.make(2)
		end

	level_info: LOG_LEVEL is
		once
			create Result.make(1)
		end

	level_warning: LOG_LEVEL is
		once
			create Result.make(0)
		end

	level_error: LOG_LEVEL is
		once
			create Result.make(-1)
		end

feature {}
	level_memory: REFERENCE[LOG_LEVEL] is
		once
			create Result.set_item(level_warning)
		end

end -- class LOGGING
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
