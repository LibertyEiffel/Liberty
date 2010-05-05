-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_BEFORE_EXIT2
	-- Test that dispose is actually called just before exit.

insert
	EIFFELTEST_TOOLS

creation {ANY}
	make

feature {}
	file_tools: FILE_TOOLS

	make is
		local
			aux: AUX_BEFORE_EXIT2
		do
			-- Check first if the previous run was correct:
			assert(file_tools.file_exists(once "before_exit.new"))
			assert(file_tools.file_exists(once "before_exit.ref"))
			assert(file_tools.same_files(once "before_exit.new", "before_exit.ref"))
			-- Now removing:
			file_tools.delete(once "before_exit.new")
			assert(not file_tools.file_exists(once "before_exit.new"))
			create aux.make
		end

end -- class TEST_BEFORE_EXIT2
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
