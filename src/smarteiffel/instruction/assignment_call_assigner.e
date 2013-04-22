-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSIGNMENT_CALL_ASSIGNER
   --
   -- For instruction like :
   --                          foo.item := bar
   --                          foo.item := bar + 1
   --
   --

inherit
   INSTRUCTION

create {ANY}
   make

feature {ANY}
   left_side: INSTRUCTION

   right_side: EXPRESSION

   end_mark_comment: BOOLEAN is False

   side_effect_free (type: TYPE): BOOLEAN is
      do
      end

   simplify (type: TYPE): INSTRUCTION is
      do
      end

   use_current (type: TYPE): BOOLEAN is
      do
      end

   start_position: POSITION is
      do
         Result := left_side.start_position
      end

   specialize_in (type: TYPE): like Current is
      do
         not_yet_implemented
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      do
         not_yet_implemented
      end

   specialize_2 (type: TYPE): like Current is
      do
         not_yet_implemented
      end

   has_been_specialized: BOOLEAN is
      do
      end

   safety_check (type: TYPE) is
      do
      end

   pretty (indent_level: INTEGER) is
      do
         not_yet_implemented
      end

   accept (visitor: ASSIGNMENT_CALL_ASSIGNER_VISITOR) is
      do
         visitor.visit_assignment_call_assigner(Current)
      end

   collect (t: TYPE): TYPE is
      do
         not_yet_implemented
      end

   adapt_for (t: TYPE): like Current is
      do
         not_yet_implemented
      end

feature {}
   make (ls: like left_side; rs: like right_side) is
         -- Note: this creation procedure is for example called by the `eiffel_parser' which is in charge
         -- of checking that `ls' is actually a writable entity. (See also `inline_make'.)
      require
         not ls.start_position.is_unknown
         rs /= Void
      do
         left_side := ls
         right_side := rs
      ensure
         left_side = ls
         right_side = rs
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
      end

invariant
   left_side /= Void
   right_side /= Void

end -- class ASSIGNMENT_CALL_ASSIGNER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
