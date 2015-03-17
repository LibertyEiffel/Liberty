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
class LIBERTY_EMPTY

inherit
   LIBERTY_INSTRUCTION

create {LIBERTY_BUILDER_TOOLS}
   make

feature {ANY}
   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current
      do
         Result := Current
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER)
      do
         -- nothing
      end

feature {}
   make
      local
         errors: LIBERTY_ERRORS
      do
         position := errors.unknown_position
      end

feature {ANY}
   accept (v: VISITOR)
      local
         v0: LIBERTY_EMPTY_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_empty(Current)
      end

end

