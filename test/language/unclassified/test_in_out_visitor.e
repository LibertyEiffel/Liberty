-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_IN_OUT_VISITOR

inherit
   IN_OUT_VISITOR
      redefine enter_class_text, exit_class_text
      end

insert
   EXTERNAL_TOOL
   GLOBALS
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   class_text: CLASS_TEXT

   done: SET[STRING]

   make
      local
         cn: CLASS_NAME
      do
         bootstrap
         create {HASHED_SET[STRING]} done.make
         create cn.unknown_position(ace.root_class_name, False)
         class_text := smart_eiffel.class_text(cn)
         assert(class_text /= Void)
         class_text.accept(Current)
         assert(done.fast_has(class_text.name.to_string))
      end

   enter_class_text (visited: CLASS_TEXT): BOOLEAN
      local
         cn: STRING
      do
         cn := visited.name.to_string
         Result := not done.has(cn)
         if Result then
            done.add(cn)
         end
      end

   exit_class_text (visited: CLASS_TEXT)
      do
         -- std_output.put_string(visited.name.to_string)
         -- std_output.put_new_line
      end

   parse_arguments
      do
         root_class_name := "STRING"
         root_procedure_name := "make_empty"
      end

   use_short_mode: BOOLEAN False

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
      end

   usage: STRING ""

   valid_argument_for_ace_mode: STRING ""

end -- class TEST_IN_OUT_VISITOR
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
