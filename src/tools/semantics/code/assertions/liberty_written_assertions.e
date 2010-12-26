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
deferred class LIBERTY_WRITTEN_ASSERTIONS

inherit
   LIBERTY_ASSERTIONS

feature {ANY}
   assertions: TRAVERSABLE[LIBERTY_ASSERTION] is
      do
         Result := assertions_list
      end

feature {LIBERTY_FEATURE, LIBERTY_ASSERTIONS}
   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
      local
         al: like assertions_list
         a: LIBERTY_ASSERTION
         i: INTEGER
      do
         from
            al := assertions_list
            i := al.lower
         until
            i > al.upper
         loop
            a := al.item(i).specialized_in(a_type)
            if a /= al.item(i) then
               if al = assertions_list then
                  al := assertions_list.twin
               end
               al.put(a, i)
            end
            i := i + 1
         end
         if al = assertions_list then
            Result := Current
         else
            Result := specialized(al)
         end
      end

feature {}
   specialized (a_assertions: like assertions_list): like Current is
      deferred
      ensure
         Result /= Current
         Result.assertions_list = a_assertions
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER) is
      do
         assertions_marker.mark_reachable_code(mark, assertions)
      end

feature {LIBERTY_WRITTEN_ASSERTIONS}
   assertions_list: COLLECTION[LIBERTY_ASSERTION]

invariant
   assertions /= Void

end
