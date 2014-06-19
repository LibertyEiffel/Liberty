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
deferred class LIBERTY_EXPRESSION

inherit
   LIBERTY_TAGGED

insert
   LIBERTY_POSITIONABLE
   LIBERTY_REACHABLE
   VISITABLE

feature {ANY}
   result_type: LIBERTY_TYPE
      deferred
      ensure
         Result /= Void or else result_type_may_be_void
      end

   result_type_may_be_void: BOOLEAN
      do
         Result := is_agent_call
      end

   is_agent_call: BOOLEAN False
   is_open_argument: BOOLEAN False

   specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current
      require
         a_type /= Void
      deferred
      ensure
         Result /= Void
      end

invariant
   (not result_type_may_be_void) implies result_type /= Void

end
