-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_INLINE_AGENT

inherit
   LIBERTY_EXPRESSION
      redefine
         is_agent_call
      end

create {LIBERTY_BUILDER_TOOLS, LIBERTY_INLINE_AGENT}
   make

feature {ANY}
   result_type: LIBERTY_TYPE is
      do
         Result := context.result_type
      end

   is_agent_call: BOOLEAN is True

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
      local
         ins: like instruction
         act: like actuals
         ctx: like context
         exp: LIBERTY_EXPRESSION
         i: INTEGER
      do
         ins := instruction.specialized_in(a_type)
         ctx := context.specialized_in(a_type)
         from
            act := actuals
            i := act.lower
         until
            i > act.upper
         loop
            exp := act.item(i).specialized_in(a_type)
            if exp /= act.item(i) then
               if act = actuals then
                  act := act.twin
               end
               act.put(exp, i)
            end
            i := i + 1
         end
         if ins = instruction and then act = actuals and then ctx = context then
            Result := Current
         else
            create Result.make(ins, act, ctx)
         end
      end

feature {ANY}
   accept (v: VISITOR) is
      local
         v0: LIBERTY_INLINE_AGENT_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_inline_agent(Current)
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER) is
      do
         instruction.mark_reachable_code(mark)
         expressions_marker.mark_reachable_code(mark, actuals)
      end

feature {}
   make (a_instruction: like instruction; a_actuals: like actuals; a_context: like context) is
      require
         a_instruction /= Void
         a_actuals /= Void
         a_context /= Void
      do
         instruction := a_instruction
         actuals := a_actuals
         context := a_context
      ensure
         instruction = a_instruction
         actuals = a_actuals
         context = a_context
      end

   instruction: LIBERTY_INSTRUCTION
   actuals: COLLECTION[LIBERTY_EXPRESSION]
   context: LIBERTY_INLINE_AGENT_CONTEXT

invariant
   instruction /= Void
   actuals /= Void
   context /= Void

end
