-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_BEFORE_EXIT2
   -- Test that dispose is actually called just before exit.

insert
   EIFFELTEST_TOOLS
   ARGUMENTS

create {}
   make

feature {}
   file_tools: FILE_TOOLS
   system: SYSTEM

   make
      local
         aux: AUX_BEFORE_EXIT2
      do
         if argument_count = 0 then
            file_tools.delete(once "before_exit.new")
            label_assert("before_exit.ref must exist", file_tools.file_exists(once "before_exit.ref"))
            label_assert("before_exit.new must not exist", not file_tools.file_exists(once "before_exit.new"))
            label_assert("check call must succeed", system.execute_command("#(1) --check" # command_name) = 0)
            label_assert("before_exit.new must exist", file_tools.file_exists(once "before_exit.new"))
            label_assert("before_exit.new and before_exit.ref must be identical", file_tools.same_files(once "before_exit.new", "before_exit.ref"))
         else
            assert(argument_count = 1)
            assert(argument(1).is_equal("--check"))
            create aux.make
         end
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
