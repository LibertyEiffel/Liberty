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
class LIBERTY_LOOP

inherit
   LIBERTY_INSTRUCTION

create {LIBERTY_BUILDER_TOOLS, LIBERTY_LOOP}
   make

feature {ANY}
   init: LIBERTY_INSTRUCTION
   invariant_clause: LIBERTY_INVARIANT
   variant_clause: LIBERTY_VARIANT
   expression: LIBERTY_EXPRESSION
   body: LIBERTY_INSTRUCTION

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current
      local
         i: like init
         iv: like invariant_clause
         v: like variant_clause
         e: like expression
         b: like body
      do
         i := init.specialized_in(a_type)
         iv := invariant_clause.specialized_in(a_type)
         if variant_clause /= Void then
            v := variant_clause.specialized_in(a_type)
         end
         e := expression.specialized_in(a_type)
         b := body.specialized_in(a_type)
         if i = init and then iv = invariant_clause and then v = variant_clause and then e = expression and then b = body then
            Result := Current
         else
            create Result.make(i, iv, v, e, b, position)
         end
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER)
      do
         init.mark_reachable_code(mark)
         invariant_clause.mark_reachable_code(mark)
         if variant_clause /= Void then
            variant_clause.mark_reachable_code(mark)
         end
         expression.mark_reachable_code(mark)
         body.mark_reachable_code(mark)
      end

feature {}
   make (a_init: like init; a_invariant_clause: like invariant_clause; a_variant_clause: like variant_clause; a_expression: like expression; a_body: like body; a_position: like position)
      require
         a_init /= Void
         a_invariant_clause /= Void
         a_expression /= Void
         a_body /= Void
         a_position /= Void
      do
         init := a_init
         invariant_clause := a_invariant_clause
         variant_clause := a_variant_clause
         expression := a_expression
         body := a_body
         position := a_position
      ensure
         init = a_init
         invariant_clause = a_invariant_clause
         variant_clause = a_variant_clause
         expression = a_expression
         body = a_body
         position = a_position
      end

feature {ANY}
   accept (v: VISITOR)
      local
         v0: LIBERTY_LOOP_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_loop(Current)
      end

invariant
   init /= Void
   invariant_clause /= Void
   expression /= Void
   body /= Void

end
