-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CALL_PREFIX_NOT
   --
   --   Prefix operator : "not".
   --

inherit
   CALL_PREFIX
      redefine compile_to_c
      end

creation {ANY}
   make, with

feature {ANY}
   --|*** (PR 21/09/04) not not X should be simplified into X.

   precedence: INTEGER is 11

   operator: STRING is
      do
         Result := as_not
      end

   compile_to_c (type: TYPE) is
      do
         if ace.boost and then target.resolve_in(type).is_boolean then
            cpp.pending_c_function_body.append(once "!(")
            target.compile_to_c(type)
            cpp.pending_c_function_body.extend(')')
         else
            Precursor(type)
         end
      end

   compile_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   jvm_branch_if_false (type: TYPE): INTEGER is
      do
         if resolve_in(type).is_boolean then
            target.compile_to_jvm(type)
            Result := code_attribute.opcode_ifne
         else
            Result := jvm_standard_branch_if_false(type)
         end
      end

   jvm_branch_if_true (type: TYPE): INTEGER is
      do
         if resolve_in(type).is_boolean then
            target.compile_to_jvm(type)
            Result := code_attribute.opcode_ifeq
         else
            Result := jvm_standard_branch_if_true(type)
         end
      end

feature {ANY}
   accept (visitor: CALL_PREFIX_NOT_VISITOR) is
      do
         visitor.visit_call_prefix_not(Current)
      end

feature {}
   make (operator_position: POSITION; rp: like target) is
      require
         not operator_position.is_unknown
         rp /= Void
      do
         create feature_name.prefix_name(eiffel_parser.not_name, operator_position)
         target := rp
      ensure
         start_position = operator_position
         target = rp
      end

end -- class CALL_PREFIX_NOT
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
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
