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
class LIBERTY_DIVIDE

inherit
   LIBERTY_INFIX_CALL

create {LIBERTY_BUILDER_TOOLS}
   make

create {LIBERTY_DIVIDE}
   new

feature {}
   the_infix_name: FIXED_STRING
      once
         Result := "/".intern
      end

   make_new (a_target: like target; a_entity: like entity; a_actuals: like actuals_list; a_position: like position): like Current
      do
         create Result.new(a_target, a_entity, a_actuals, a_position)
      end

feature {ANY}
   accept (v: VISITOR)
      local
         v0: LIBERTY_DIVIDE_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_divide(Current)
      end

end
