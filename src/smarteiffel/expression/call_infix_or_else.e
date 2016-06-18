-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CALL_INFIX_OR_ELSE
   --
   -- Infix operator : "or else".
   --

inherit
   CALL_INFIX
      redefine
         inline_dynamic_dispatch_
      end

create {EIFFEL_PARSER}
   make

create {AGENT_CREATION}
   with

feature {ANY}
   precedence: INTEGER 4

   left_brackets: BOOLEAN False

   operator: STRING
      do
         Result := as_or_else
      end

   accept (visitor: CALL_INFIX_OR_ELSE_VISITOR)
      do
         visitor.visit_call_infix_or_else(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         left: like target; right: like arg1; compound: INSTRUCTION; ifthenelse: IFTHENELSE
         sp: POSITION; internal_local2: INTERNAL_LOCAL2;
      do
         sp := feature_name.start_position
         target.inline_dynamic_dispatch_(code_accumulator, type)
         left := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         check
            left.resolve_in(type).is_boolean
         end
         create internal_local2.make(sp, Current, feature_name.to_string, True)
         code_accumulator.current_context.add_last(create {ASSIGNMENT}.make(internal_local2, left))
         -- New context for the right-hand side:
         code_accumulator.open_new_context
         arg1.inline_dynamic_dispatch_(code_accumulator, type)
         right := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         check
            right.resolve_in(type).is_boolean
         end
         code_accumulator.current_context.add_last(create {ASSIGNMENT}.make(internal_local2, right))
         compound := code_accumulator.current_context_to_instruction
         code_accumulator.close_current_context
         -- Non inlining the "or else" with an IFTHENELSE:
         create ifthenelse.with_else(sp, internal_local2, Void, compound)
         code_accumulator.current_context.add_last(ifthenelse)
         -- Adding the final result:
         code_accumulator.current_context.add_last(internal_local2)
      end

feature {}
   make (left: like target; operator_position: POSITION; right: like arg1)
      require
         left /= Void
         not operator_position.is_unknown
         right /= Void
      do
         target := left
         create feature_name.infix_name(or_else_name, operator_position)
         create {EFFECTIVE_ARG_LIST_N} arguments.make_1(start_position, right)
      ensure
         target = left
         start_position = operator_position
         arguments.first = right
      end

end -- class CALL_INFIX_OR_ELSE
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
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
