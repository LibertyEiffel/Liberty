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
class LIBERTY_TUPLE

inherit
   LIBERTY_EXPRESSION

create {LIBERTY_BUILDER_TOOLS, LIBERTY_TUPLE}
   make

feature {ANY}
   result_type: LIBERTY_TYPE

   count: INTEGER
      do
         Result := elements.count
      end

   lower: INTEGER 1

   upper: INTEGER
      do
         Result := count
      end

   is_empty: BOOLEAN
      do
         Result := count = 0
      end

   item (i: INTEGER): LIBERTY_EXPRESSION
      do
         Result := elements.item(i - lower)
      end

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current
      local
         r: like result_type
         e: like elements
         x: LIBERTY_EXPRESSION
         i: INTEGER
      do
         r := result_type.specialized_in(a_type)
         from
            e := elements
            i := e.lower
         until
            i > e.upper
         loop
            x := e.item(i).specialized_in(a_type)
            if x /= e.item(i) then
               if e = elements then
                  e := e.twin
               end
               e.put(x, i)
            end
            i := i + 1
         end
         if r = result_type and then e = elements then
            Result := Current
         else
            create Result.make(r, e, position)
         end
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER)
      do
         result_type.mark_reachable_code(mark)
         expressions_marker.mark_reachable_code(mark, elements)
      end

feature {}
   make (a_result_type: like result_type; a_elements: like elements; a_position: like position)
      require
         a_result_type /= Void
         -- a_result_type is a TUPLE type
         a_elements /= Void
         a_position /= Void
      do
         result_type := a_result_type
         elements := a_elements
         position := a_position
      ensure
         result_type = a_result_type
         elements = a_elements
         position = a_position
      end

   elements: COLLECTION[LIBERTY_EXPRESSION]

feature {ANY}
   accept (v: VISITOR)
      local
         v0: LIBERTY_TUPLE_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_tuple(Current)
      end

invariant
   elements /= Void implies elements.count = count

end
