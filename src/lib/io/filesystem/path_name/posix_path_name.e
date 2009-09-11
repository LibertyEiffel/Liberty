-- See the Copyright notice at the end of this file.
--
class POSIX_PATH_NAME
	-- Operating system path name, posix notation

inherit
	UNIXISH_PATH_NAME
		rename
			path as to_string
		export {ANY}
			to_string
		redefine copy, is_equal
		end

creation {ANY}
	make_empty, make_root, make_current, make_from_string

feature {ANY} -- Creation
	make_empty is
		do
			if to_string = Void then
				to_string := ""
			else
				to_string.clear_count
			end
		end

	make_root is
		do
			make_empty
			to_string.extend('/')
		ensure then
			to_string.is_equal(once "/")
		end

	make_current is
		do
			make_empty
			to_string.extend('.')
		ensure then
			to_string.is_equal(once ".")
		end

	make_from_string (s: STRING) is
		do
			if to_string = Void then
				to_string := s.twin
			elseif to_string /= s then
				to_string.copy(s)
			end
		end

feature {ANY} -- Constants
	extension_separator: CHARACTER is '.'

	directory_separator: CHARACTER is '/'

	up_directory: STRING is ".."

	this_directory: STRING is "."

feature {ANY} -- Access
	drive_specification: STRING is
		do
		ensure then
			Result = Void
		end

	count: INTEGER is
		local
			p: INTEGER; sep: BOOLEAN
		do
			from
				p := 1
				sep := True
			until
				p > to_string.count
			loop
				if not sep and to_string.item(p) = '/' then
					sep := True
				elseif sep and to_string.item(p) /= '/' then
					sep := False
					Result := Result + 1
				end
				p := p + 1
			end
			if sep and Result > 0 then
				-- trailing /
				Result := Result + 1
			end
		end

	last: STRING is
		local
			p: INTEGER
		do
			p := to_string.reverse_index_of('/', to_string.count) + 1
			Result := to_string.substring(p, to_string.count)
		ensure then
			to_string.has_suffix(Result)
		end

	extension: STRING is
		local
			p: INTEGER
		do
			Result := once ""
			p := to_string.reverse_index_of(extension_separator, to_string.count)
			if p /= 0 then
				if to_string.index_of('/', p) = 0 then
					Result := to_string.substring(p, to_string.count)
				end
			end
		end

	is_absolute: BOOLEAN is
		do
			Result := not to_string.is_empty and then to_string.first = '/'
		ensure
			definition: Result = (not to_string.is_empty and then to_string.first = '/')
		end

	is_normalized: BOOLEAN is
		local
			elem: STRING; scan: STRING
		do
			elem := once "path_element"
			scan := once ""
			scan.copy(to_string)
			-- Check for emptiness or too many slashes
			Result := not scan.is_empty and then not scan.has_prefix(once "///")
			-- zero, one or two slashes allowed by posix
			-- Remove initial slashes
			from
			until
				scan.is_empty or else scan.first /= '/'
			loop
				scan.remove_head(1)
			end
			-- Check for trailing slashes, double slashes
			Result := Result and then (scan.is_empty or else scan.last /= '/') and then not scan.has_substring(double_slash)
			-- Remove initial sequences of ".."
			if not is_absolute and Result then
				from
				until
					scan.is_empty or else not scan.has_prefix(up_directory)
				loop
					if scan.count >= 3 and then scan.item(3) = '/' then
						scan.remove_head(3)
					else
						scan.remove_head(2)
					end
				end
			else
				Result := Result and then not scan.has_prefix(once "../") and then not scan.is_equal(up_directory)
			end
			-- Make sure that there is no '..' remaining
			Result := Result and then not scan.has_substring(once "/../") and then not scan.has_suffix(once "/..")
			-- Make sure that there is no '.' remaining except alones
			Result := Result and then not scan.has_substring(once "/./") and then not scan.has_suffix(once "/.") and then not scan.has_prefix(once "./")
			Result := Result and then (is_absolute implies not scan.is_equal(this_directory))
		ensure
			Result implies not to_string.has_substring(once "/./")
			Result implies not to_string.has_suffix(once "/.")
			Result implies not to_string.is_empty
			Result implies to_string.last /= '/' or else to_string.is_equal(once "/") or else to_string.is_equal(once "//")
		end

	is_valid_path (path: STRING): BOOLEAN is
		do
			--|*** Not nearly strict enough <FM-24/03/2003>
			Result := not path.is_empty
		end

feature {ANY} -- Operations
	to_absolute is
		local
			bd: BASIC_DIRECTORY
		do
			if not is_absolute then
				tmp.copy(Current)
				to_string := bd.current_working_directory.twin
				join(tmp)
				tmp.to_string.make_empty
			end
			normalize
		end

	normalize is
		do
			tmp.copy(Current)
			make_from_path_name(tmp)
			if to_string.is_empty then
				make_current
			end
		end

	normalize_case is
		do
			-- POSIX filesystem is case-sensitive
			-- There are no secondary separators
		ensure
			to_string.is_equal(old to_string.twin)
		end

	remove_last is
		local
			p: INTEGER
		do
			-- Find last separator
			p := to_string.reverse_index_of('/', to_string.count)
			-- Remove all trailing slashes, leaving one if it is root
			from
			until
				p <= 1 or else to_string.item(p) /= '/'
			loop
				p := p - 1
			end
			to_string.keep_head(p)
		ensure then
			(old to_string.twin).has_prefix(to_string)
		end

	add_last (elem: STRING) is
		do
			if not is_empty then
				to_string.extend_unless('/')
			end
			to_string.append(elem)
		end

	expand_user is
		local
			user_home: STRING; sys: SYSTEM; p: INTEGER
		do
			if not is_empty and then to_string.first = '~' then
				if to_string.count = 1 or else to_string.has_prefix(once "~/") then
					user_home := sys.get_environment_variable(once "HOME")
				else
					-- FIXME: Expansion of some other user's home: not done yet
					not_yet_implemented
				end
				if user_home /= Void then
					p := to_string.first_index_of('/')
					if p = 0 then
						p := to_string.count + 1
					end
					to_string.remove_head(p - 1)
					to_string.prepend(user_home)
				end
			end
		end

	expand_shellouts is
		do
			not_yet_implemented
		end

feature {ANY} -- Copying, comparison
	copy (other: like Current) is
		do
			if Current /= other then
				if to_string = Void then
					to_string := other.to_string.twin
				else
					to_string.copy(other.to_string)
				end
			end
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := to_string.is_equal(other.to_string)
		end

feature {PATH_JOINER}
	start_join (drive: STRING; absoluteness: INTEGER) is
		do
			inspect absoluteness
			when 0 then
			when 1 then
				make_root
			else
				make_from_string(double_slash)
			end
		end

feature {} -- Auxiliar constants/onces
	tmp: POSIX_PATH_NAME is
		once
			create Result.make_empty
		end

	double_slash: STRING is "//"

	start_join_to (other: PATH_JOINER): INTEGER is
		local
			slash_count: INTEGER
		do
			from
				Result := to_string.lower
			until
				Result > to_string.upper or else not is_separator(to_string.item(Result))
			loop
				Result := Result + 1
			end
			slash_count := Result - to_string.lower
			if slash_count > 2 then
				slash_count := 1
			end
			if Result <= to_string.upper then
				other.start_join(drive_specification, slash_count)
			elseif slash_count > 0 then
				other.start_join(drive_specification, slash_count)
				other.end_join
			end
		end

end -- class POSIX_PATH_NAME
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
