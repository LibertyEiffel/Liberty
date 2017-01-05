-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CALL_INFIX_IMPLIES
   --
   -- Infix operator : "implies".
   --

inherit
   CALL_INFIX
      redefine inline_dynamic_dispatch_
      end

create {EIFFEL_PARSER}
   make

create {AGENT_CREATION}
   with

feature {ANY}
   precedence: INTEGER 3

   left_brackets: BOOLEAN False

   operator: STRING
      do
         Result := as_implies
      end

feature {ANY}
   accept (visitor: CALL_INFIX_IMPLIES_VISITOR)
      do
         visitor.visit_call_infix_implies(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         lp: like target; rp: like arg1; then_compound, else_compound: INSTRUCTION; ifthenelse: IFTHENELSE
         internal_local2: INTERNAL_LOCAL2; sp: POSITION
      do
         if not target.resolve_in(type).is_boolean then
            Precursor(code_accumulator, type)
         else
            sp := feature_name.start_position
            target.inline_dynamic_dispatch_(code_accumulator, type)
            lp := code_accumulator.current_context.last.to_expression
            code_accumulator.current_context.remove_last
            check
               lp.resolve_in(type).is_boolean
            end
            create internal_local2.make(sp, Current, feature_name.to_string, True)
            code_accumulator.current_context.add_last(create {ASSIGNMENT}.make(internal_local2, lp))
            -- New context for the right-hand side:
            code_accumulator.open_new_context
            arg1.inline_dynamic_dispatch_(code_accumulator, type)
            rp := code_accumulator.current_context.last.to_expression
            code_accumulator.current_context.remove_last
            check
               rp.resolve_in(type).is_boolean
            end
            code_accumulator.current_context.add_last(create {ASSIGNMENT}.make(internal_local2, rp))
            then_compound := code_accumulator.current_context_to_instruction
            code_accumulator.close_current_context
            create {ASSIGNMENT} else_compound.make(internal_local2, create {E_TRUE}.make(sp))
            -- Non inlining the "or else" with an IFTHENELSE:
            create ifthenelse.with_else(sp, internal_local2, then_compound, else_compound)
            code_accumulator.current_context.add_last(ifthenelse)
            -- Adding the final result:
            code_accumulator.current_context.add_last(internal_local2)
         end
      end

feature {}
   make (lp: like target; operator_position: POSITION; rp: like arg1)
      require
         lp /= Void
         not operator_position.is_unknown
         rp /= Void
      do
         target := lp
         create feature_name.infix_name(eiffel_parser.implies_name, operator_position)
         create {EFFECTIVE_ARG_LIST_N} arguments.make_1(start_position, rp)
      ensure
         target = lp
         start_position = operator_position
         arguments.first = rp
      end

end -- class CALL_INFIX_IMPLIES
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
