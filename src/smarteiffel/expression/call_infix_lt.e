-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CALL_INFIX_LT
   --
   --   Infix operator : "<".
   --

inherit
   CALL_INFIX

creation {EIFFEL_PARSER}
   make

creation {AGENT_CREATION}
   with

feature {ANY}
   precedence: INTEGER is 6

   left_brackets: BOOLEAN is False

   operator: STRING is
      do
         Result := as_lt
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
               Result := code_attribute.opcode_ifge
            else
               Result := code_attribute.opcode_if_icmpge
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
               Result := code_attribute.opcode_iflt
            else
               Result := code_attribute.opcode_if_icmplt
            end
         else
            Result := jvm_standard_branch_if_true(type)
         end
      end

feature {ANY}
   accept (visitor: CALL_INFIX_LT_VISITOR) is
      do
         visitor.visit_call_infix_lt(Current)
      end

feature {}
   make (lp: like target; operator_position: POSITION; rp: like arg1) is
      require
         lp /= Void
         not operator_position.is_unknown
         rp /= Void
      do
         target := lp
         create feature_name.infix_name(eiffel_parser.lt_name, operator_position)
         create arguments.make_1(rp)
      ensure
         target = lp
         start_position = operator_position
         arguments.first = rp
      end

end -- class CALL_INFIX_LT
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
