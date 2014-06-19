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
class LIBERTY_OPEN_ARGUMENT

inherit
   LIBERTY_EXPRESSION
      redefine
         result_type_may_be_void, is_open_argument
      end

create {LIBERTY_BUILDER_TOOLS}
   make

create {LIBERTY_OPEN_ARGUMENT}
   make_specialized

feature {ANY}
   result_type: LIBERTY_TYPE

   result_type_may_be_void: BOOLEAN True
   is_open_argument: BOOLEAN True

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current
      local
         r: like result_type
      do
         if result_type /= Void then
            r := result_type.specialized_in(a_type)
         end
         if r = result_type then
            Result := Current
         else
            create Result.make_specialized(r, position)
         end
      end

feature {LIBERTY_BUILDER_TOOLS, LIBERTY_AGENT}
   set_result_type (a_result_type: like result_type)
      require
         a_result_type /= Void
      do
         result_type := a_result_type
      ensure
         result_type = a_result_type
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER)
      do
         -- nothing
      end

feature {}
   make (a_position: like position)
      require
         a_position /= Void
      do
         position := a_position
      ensure
         position = a_position
      end

   make_specialized (a_result_type: like result_type; a_position: like position)
      require
         a_result_type /= Void
         a_position /= Void
      do
         result_type := a_result_type
         position := a_position
      ensure
         result_type = a_result_type
         position = a_position
      end

feature {ANY}
   accept (v: VISITOR)
      local
         v0: LIBERTY_OPEN_ARGUMENT_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_open_argument(Current)
      end

end
