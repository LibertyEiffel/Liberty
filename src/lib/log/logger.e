-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOGGER
	--
	-- A simple logger.
	--

create {LOG_INTERNAL_CONF}
	make

feature {ANY}
	tag: FIXED_STRING

feature {ANY} -- Logging streams
	trace: OUTPUT_STREAM is
		do
			Result := levels.trace.stream(level, output, tag)
		ensure
			Result /= Void
		end

	info: OUTPUT_STREAM is
		do
			Result := levels.info.stream(level, output, tag)
		ensure
			Result /= Void
		end

	warning: OUTPUT_STREAM is
		do
			Result := levels.warning.stream(level, output, tag)
		ensure
			Result /= Void
		end

	error: OUTPUT_STREAM is
		do
			Result := levels.error.stream(level, output, tag)
		ensure
			Result /= Void
		end

feature {ANY} -- Logging checks
	is_trace: BOOLEAN is
		do
			Result := levels.trace.does_log(level)
		end

	is_info: BOOLEAN is
		do
			Result := levels.info.does_log(level)
		end

	is_warning: BOOLEAN is
		do
			Result := levels.warning.does_log(level)
		end

	is_error: BOOLEAN is
		do
			Result := levels.error.does_log(level)
		end

feature {ANY} -- Log level
	set_level (a_level: like level) is
		require
			a_level /= Void
		do
			level := a_level
		ensure
			level = a_level
		end

	level: LOG_LEVEL

feature {LOG_INTERNAL_CONF} -- Parent logger
	parent: LOGGER

	set_parent (a_parent: like parent) is
		require
			a_parent /= Void
		do
			parent := a_parent
			set_level(a_parent.level)
		ensure
			parent = a_parent
		end

	output: LOG_OUTPUT

feature {}
	make (a_output: LOG_OUTPUT; a_tag: like tag) is
		require
			a_output /= Void
		do
			output := a_output
			tag := a_tag
			set_level(levels.trace)
		ensure
			output = a_output
			tag = a_tag
		end

	levels: LOG_LEVELS

invariant
	tag /= Void
	level /= Void

end -- class LOGGER
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
