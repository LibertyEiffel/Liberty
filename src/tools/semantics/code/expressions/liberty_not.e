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
class LIBERTY_NOT

inherit
   LIBERTY_PREFIX_CALL

create {LIBERTY_BUILDER_TOOLS}
   make

create {LIBERTY_NOT}
   new

feature {}
   the_prefix_name: FIXED_STRING is
      once
         Result := "not".intern
      end

   make_new (a_target: like target; a_entity: like entity; a_actuals: like actuals_list; a_position: like position): like Current is
      do
         create Result.new(a_target, a_entity, a_actuals, a_position)
      end

feature {ANY}
   accept (v: VISITOR) is
      local
         v0: LIBERTY_NOT_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_not(Current)
      end

end
