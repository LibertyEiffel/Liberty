-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class FILE_RESOURCE_LOCATOR
	--
	-- A "file:" URL
	--

inherit
	RESOURCE_LOCATOR

creation {FILE_PROTOCOL}
	set_uri

feature {FILE_PROTOCOL}
	path: STRING is
		local
			bd: BASIC_DIRECTORY; u, p: STRING
		do
			bd.ensure_system_notation

			Result := once ""
			u := normalized_uri(uri)
			if notation.is_absolute_path(u) then
				Result.copy(u)
				bd.system_notation.from_notation(notation, Result)
			else
				Result.copy(bd.current_working_directory)
				p := once ""
				p.copy(u)
				bd.system_notation.from_notation(notation, p)
				bd.system_notation.to_subpath_with(Result, p)
			end
		end

	set_uri (a_uri: STRING) is
		do
			if uri = Void then
				uri := string_pool.new_twin(a_uri)
			else
				uri.copy(a_uri)
			end
		end

feature {}
	normalized_uri (a_uri: STRING): STRING is
		do
			if a_uri.has_prefix(once "//") then
				Result := once ""
				if a_uri.count > 2 then
					Result.copy_substring(a_uri, 3, a_uri.upper)
				else
					Result.clear_count
				end
			else
				Result := a_uri
			end
		end

feature {ANY}
	uri: STRING

feature {URL_VALIDITY}
	valid_uri (a_uri: STRING): BOOLEAN is
		do
			Result := notation.is_valid_path(normalized_uri(a_uri))
		end

feature {URL} -- URL data:
	absolute_uri (a_uri: STRING): BOOLEAN is
		do
			Result := a_uri.has_prefix(once "//") or else notation.is_absolute_path(a_uri)
		end

	set_relative (a_uri: STRING) is
		do
			notation.to_parent_directory(uri)
			if uri.is_empty then
				uri.extend('/')
			end
			notation.to_subpath_with(uri, a_uri)
		end

feature {}
	string_pool: STRING_RECYCLING_POOL is
		once
			create Result.make
		end

	notation: UNIX_DIRECTORY_NOTATION is
		once
			create Result
		end

feature {RECYCLING_POOL}
	recycle is
		do
			if uri /= Void then
				string_pool.recycle(uri)
				uri := Void
			end
		end

end -- class FILE_RESOURCE_LOCATOR
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
