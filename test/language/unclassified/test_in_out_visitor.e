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

creation {ANY}
   make

feature {}
   class_text: CLASS_TEXT

   done: SET[STRING]

   make is
      local
         cn: CLASS_NAME
      do
         bootstrap
         create {HASHED_SET[STRING]} done.make
         create cn.unknown_position(ace.root_class_name)
         class_text := smart_eiffel.class_text(cn, True)
         assert(class_text /= Void)
         class_text.accept(Current)
         assert(done.fast_has(class_text.name.to_string))
      end

   enter_class_text (visited: CLASS_TEXT): BOOLEAN is
      local
         cn: STRING
      do
         cn := visited.name.to_string
         Result := not done.has(cn)
         if Result then
            done.add(cn)
         end
      end

   exit_class_text (visited: CLASS_TEXT) is
      do
         -- std_output.put_string(visited.name.to_string)
         -- std_output.put_new_line
      end

   parse_arguments is
      do
         root_class_name := "STRING"
         root_procedure_name := "make_empty"
      end

   use_short_mode: BOOLEAN is False

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN is
      do
      end

   usage: STRING is ""

   valid_argument_for_ace_mode: STRING is ""

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
