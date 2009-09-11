-- See the Copyright notice at the end of this file.
--
class UNIX_DIRECTORY_NOTATION
	-- The Unix like file path notation looks like:
	--   /SmartEiffel/sys/system.se

inherit
	PATH_NAME_NOTATION

feature {ANY}
	is_current_directory (path: STRING): BOOLEAN is
		do
			if path.compare(once ".") = 0 or else path.compare(once "./") = 0 then
				Result := True
			elseif path.is_empty then
			elseif path.first /= '/' then
				Result := path.occurrences('.') + path.occurrences('/') = path.count and not path.has_substring(once "..")
			end
		end

	is_parent_directory (path: STRING): BOOLEAN is
		local
			pos: INTEGER
		do
			if path.compare(once "..") = 0 or else path.compare(once "../") = 0 then
				Result := True
			elseif path.is_empty then
			elseif path.first /= '/' then
				Result := path.occurrences('.') + path.occurrences('/') = path.count and path.has_substring(once "..")
				if Result then
					pos := path.first_substring_index(once "..")
					Result := Result and path.substring_index(once "..", pos + 2) = 0
				end
			end
		end

	to_directory_path (path: STRING) is
		do
			path.extend_unless('/')
		end

feature {ANY}
	is_case_sensitive: BOOLEAN is True

feature {}
	tmp1: POSIX_PATH_NAME is
		once
			create Result.make_empty
		end

	tmp2: POSIX_PATH_NAME is
		once
			create Result.make_empty
		end

end -- class UNIX_DIRECTORY_NOTATION
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
