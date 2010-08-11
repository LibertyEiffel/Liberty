-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOG_FILE_OPTIONS

creation {LOG_INTERNAL_CONF}
	make

feature {LOG_INTERNAL_CONF}
	retriever: FUNCTION[TUPLE, OUTPUT_STREAM] is
		do
			Result := agent retrieve
		end

	rotated (condition: PREDICATE[TUPLE[FILE_STREAM]]; retention: INTEGER_64) is
		require
			condition /= Void
		do
			create {LOG_FILE_ROTATED} option.make(option, condition, retention)
		end

	zipped (command: FIXED_STRING) is
		require
			command /= Void
		do
			create {LOG_FILE_ZIPPED} option.make(option, command)
		end

	is_connected: BOOLEAN is
		do
			Result := stream.is_connected
		end

feature {}
	make (a_file_path: like file_path) is
		require
			a_file_path /= Void
		do
			file_path := a_file_path
			create {TEXT_FILE_WRITE} stream.connect_for_appending_to(a_file_path)
			create {LOG_FILE_PASS_THROUGH} option.make
		ensure
			stream.is_connected implies stream.path = a_file_path
		end

	retrieve: OUTPUT_STREAM is
		local
			s: STREAM
		do
			-- because FILE_STREAM and OUTPUT_STREAM are in parallel hierarchies
			-- (they don't inherit from each other)
			-- ... but we know the stream is always an output one, don't we :-)
			s := option.retrieve(stream)
			stream ::= s
			Result ::= s
		end

	option: LOG_FILE_OPTION
	stream: FILE_STREAM
	file_path: STRING

invariant
	stream /= Void
	option /= Void

end -- class LOG_FILE_OPTIONS
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
