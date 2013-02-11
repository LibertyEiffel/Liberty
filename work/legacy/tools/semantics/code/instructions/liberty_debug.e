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
class LIBERTY_DEBUG

inherit
   LIBERTY_INSTRUCTION

create {LIBERTY_BUILDER_TOOLS, LIBERTY_DEBUG}
   make

feature {ANY}
   keys: TRAVERSABLE[FIXED_STRING]
   instruction: LIBERTY_INSTRUCTION

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
      local
         i: like instruction
      do
         i := instruction.specialized_in(a_type)
         if i = instruction then
            Result := Current
         else
            create Result.make(keys, i, position)
         end
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER) is
      do
         instruction.mark_reachable_code(mark)
      end

feature {}
   make (a_keys: like keys; a_instruction: like instruction; a_position: like position) is
      require
         a_keys /= Void
         a_instruction /= Void
         a_position /= Void
      do
         keys := a_keys
         instruction := a_instruction
         position := a_position
      ensure
         keys = a_keys
         instruction = a_instruction
         position = a_position
      end

feature {ANY}
   accept (v: VISITOR) is
      local
         v0: LIBERTY_DEBUG_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_debug(Current)
      end

invariant
   keys /= Void
   instruction /= Void

end
