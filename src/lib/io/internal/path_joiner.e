-- See the Copyright notice at the end of this file.
--
deferred class PATH_JOINER
	-- A protocol for PATH_NAMEs to describe themselves to other objects.
	--
	-- A typical session goes like this:
	-- # call `start_join' describing you drive (if any) and whether you are absolute or relative
	-- # Repeatedly call the `join_xxx' procedures to desribe yourself, more significant elements first (i.e.
	--   generally left-to-right)
	-- # call `end_join'
	--
	-- Caveat: the only way to make sure that the target is not changed at all is by not starting a session. A
	-- call to `start_join' (even with `drive'=Void and absoluteness=0) immediately followed by a call to
	-- `end_join' can have some benign side-effect on the target (including some amount of normalization being performed).

feature {PATH_JOINER}
	start_join (drive: STRING; absoluteness: INTEGER) is
			-- Start joining an absolute path to `Current'
			--
			-- `drive' is optional
			-- `absoluteness' is, e.g., the number of leading slashes:
			--   0 for relative paths
			--   1 for absolute paths
			--   more for super-absolute paths (for instance, network-wide)
		require
			absoluteness >= 0
		deferred
		end

	join_directory (element: STRING) is
			-- Add a directory to the end of the path
		require
			element /= Void
		do
			join_element(element)
		ensure
			old join_error implies join_error
		end

	join_up is
			-- Go up one directory
		deferred
		ensure
			old join_error implies join_error
		end

	join_file (element: STRING) is
			-- Add a file to the end of the path
		require
			element /= Void
		do
			join_element(element)
		ensure
			old join_error implies join_error
		end

	join_element (element: STRING) is
			-- Add an unspecified element (directory or file) to the end of the path
		require
			element /= Void
		deferred
		ensure
			old join_error implies join_error
		end

	join_extension (an_extension: STRING) is
			-- Add an extension to the last element of the path
		require
			an_extension /= Void
		deferred
		ensure
			old join_error implies join_error
		end

	end_join is
			-- Finish joining the path
		deferred
		ensure
			old join_error implies join_error
		end

	join_error: BOOLEAN is
			-- Did an error occur during joining
		deferred
		end

end -- class PATH_JOINER
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
