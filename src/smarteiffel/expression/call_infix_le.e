-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CALL_INFIX_LE
   --
   --   Infix operator : "<=".
   --

inherit
   CALL_INFIX
      redefine
         compile_to_c
      end

creation {EIFFEL_PARSER}
   make

creation {AGENT_CREATION}
   with

feature {ANY}
   precedence: INTEGER is 6

   left_brackets: BOOLEAN is False

   operator: STRING is
      do
         Result := as_le
      end
      --|*** simplify_1_: EXPRESSION is
      --|*** local
      --|*** ic1, ic2: INTEGER_CONSTANT
      --|*** do
      --|*** target := target.simplify_1
      --|*** arguments.simplify_1
      --|*** ic1 ?= target
      --|*** if ic1 = Void then
      --|*** Result := Current
      --|*** else
      --|*** ic2 ?= arg1
      --|*** if ic2 = Void then
      --|*** Result := Current
      --|*** else
      --|*** if ic1.value_memory <= ic2.value_memory then
      --|*** create {E_TRUE} Result.make(feature_name.start_position)
      --|*** else
      --|*** create {E_FALSE} Result.make(feature_name.start_position)
      --|*** end
      --|*** end
      --|*** end
      --|*** end

   compile_to_c (type: TYPE) is
      do
         if ace.boost and then target.resolve_in(type).is_character then
            c2c_cast_op(type, once "unsigned", as_le)
         else
            Precursor(type)
         end
      end

   compile_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   jvm_branch_if_false (type: TYPE): INTEGER is
      local
         target_type: TYPE
      do
         target_type := target.resolve_in(type)
         if target_type.is_integer then
            check
               arg1.resolve_in(type).is_integer
            end
            target.compile_to_jvm(type)
            arg1.compile_to_jvm(type)
            if target_type.jvm_stack_space = 2 then
               code_attribute.opcode_lcmp
               Result := code_attribute.opcode_ifgt
            else
               Result := code_attribute.opcode_if_icmpgt
            end
         else
            Result := jvm_standard_branch_if_false(type)
         end
      end

   jvm_branch_if_true (type: TYPE): INTEGER is
      local
         target_type: TYPE
      do
         target_type := target.resolve_in(type)
         if target_type.is_integer then
            check
               arg1.resolve_in(type).is_integer
            end
            target.compile_to_jvm(type)
            arg1.compile_to_jvm(type)
            if target_type.jvm_stack_space = 2 then
               code_attribute.opcode_lcmp
               Result := code_attribute.opcode_ifle
            else
               Result := code_attribute.opcode_if_icmple
            end
         else
            Result := jvm_standard_branch_if_true(type)
         end
      end

feature {ANY}
   accept (visitor: CALL_INFIX_LE_VISITOR) is
      do
         visitor.visit_call_infix_le(Current)
      end

feature {}
   make (lp: like target; operator_position: POSITION; rp: like arg1) is
      require
         lp /= Void
         not operator_position.is_unknown
         rp /= Void
      do
         target := lp
         create feature_name.infix_name(eiffel_parser.le_name, operator_position)
         create arguments.make_1(rp)
      ensure
         target = lp
         start_position = operator_position
         arguments.first = rp
      end

end -- class CALL_INFIX_LE
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
