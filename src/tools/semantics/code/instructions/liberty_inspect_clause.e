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
class LIBERTY_INSPECT_CLAUSE

insert
   LIBERTY_POSITIONABLE
   LIBERTY_REACHABLE

create {LIBERTY_BUILDER_TOOLS}
   make

create {LIBERTY_INSPECT_CLAUSE}
   make_specialized

feature {ANY}
   instruction: LIBERTY_INSTRUCTION

   values: TRAVERSABLE[LIBERTY_INSPECT_SLICE] is
      do
         Result := values_list
      ensure
         Result = values_list
      end

feature {LIBERTY_INSPECT}
   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
      local
         ins: like instruction
         v: like values_list
         slice: LIBERTY_INSPECT_SLICE
         i: INTEGER
      do
         ins := instruction.specialized_in(a_type)
         from
            v := values_list
            i := v.lower
         until
            i > v.upper
         loop
            slice := v.item(i).specialized_in(a_type)
            if slice /= v.item(i) then
               if v = values_list then
                  v := v.twin
               end
               v.put(slice, i)
            end
            i := i + 1
         end
         if ins = instruction and then v = values_list then
            Result := Current
         else
            create Result.make_specialized(ins, v, position)
         end
      end

feature {LIBERTY_BUILDER_TOOLS}
   add_value (a_value: LIBERTY_INSPECT_SLICE) is
      require
         a_value /= Void
      do
         values_list.add_last(a_value)
      ensure
         values.last = a_value
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER) is
      do
         instruction.mark_reachable_code(mark)
         inspect_slices_marker.mark_reachable_code(mark, values)
      end

feature {}
   make (a_instruction: like instruction; a_position: like position) is
      require
         a_instruction /= Void
         a_position /= Void
      do
         instruction := a_instruction
         create {FAST_ARRAY[LIBERTY_INSPECT_SLICE]} values_list.with_capacity(2)
         position := a_position
      ensure
         instruction = a_instruction
         position = a_position
      end

   make_specialized (a_instruction: like instruction; a_values_list: like values_list; a_position: like position) is
      require
         a_instruction /= Void
         a_values_list /= Void
         a_position /= Void
      do
         instruction := a_instruction
         values_list := a_values_list
         position := a_position
      ensure
         instruction = a_instruction
         values_list = a_values_list
         position = a_position
      end

   values_list: COLLECTION[LIBERTY_INSPECT_SLICE]

   inspect_slices_marker: LIBERTY_REACHABLE_COLLECTION_MARKER[LIBERTY_INSPECT_SLICE]

feature {ANY}
   accept (v: VISITOR) is
      local
         v0: LIBERTY_INSPECT_CLAUSE_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_inspect_clause(Current)
      end

invariant
   instruction /= Void
   values_list /= Void

end
