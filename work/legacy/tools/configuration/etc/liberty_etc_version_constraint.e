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
class LIBERTY_ETC_VERSION_CONSTRAINT

inherit
   LIBERTY_ETC_CONSTRAINT

create {LIBERTY_ETC_VISITOR_IMPL}
   make

feature {ANY}
   check_validity (a_cluster: LIBERTY_ETC_CLUSTER)
      do
         if not operator.item([a_cluster.version, version]) then
            std_error.put_line("*** Version mismatch: " + a_cluster.name
                               + " version " + a_cluster.version + " not compatible")
            die_with_code(1)
         end
      end

feature {}
   make (a_operator: like operator; a_version: like version)
      require
         a_operator /= Void
         a_version /= Void
      do
         operator := a_operator
         version := a_version
      ensure
         operator = a_operator
         version = a_version
      end

   operator: PREDICATE[TUPLE[FIXED_STRING, FIXED_STRING]]
   version: FIXED_STRING

invariant
   operator /= Void
   version /= Void

end
