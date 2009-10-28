-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class FILE
	--
	-- Common parent class to all the file-related streams. Provides a common
	-- connection interface to the "real" files of the operating system.
	--

insert
	ANY

feature {ANY}
	path: STRING
			-- Not Void when connected to the corresponding file on the disk.

	is_connected: BOOLEAN is
			-- Is this file connected to some file of the operating system?
		do
			Result := path /= Void
		ensure
			definition: Result = (path /= Void)
		end

	connect_to (new_path: STRING) is
			-- Try to connect to an existing file of the operating system.
		require
			not is_connected
			not_malformed_path: not new_path.is_empty
		deferred
		ensure
			is_connected implies path.same_as(new_path)
		end

	disconnect is
			-- Disconnect from any file.
		require
			is_connected
		deferred
		ensure
			not is_connected
		end

end -- class FILE
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
