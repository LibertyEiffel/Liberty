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
deferred class LIBERTY_GENERICS_CONFORMANCE_CHECKER
   --
   -- Reifies special conformance rules for generic classes (different rule sets for classical generics,
   -- tuples, and agents)
   --

feature {LIBERTY_ACTUAL_TYPE}
   inherits (parent, child: LIBERTY_KNOWN_TYPE): BOOLEAN is
      require
         parent.name = child.name
      deferred
      end

   inserts (parent, child: LIBERTY_KNOWN_TYPE): BOOLEAN is
      require
         parent.name = child.name
      deferred
      end

end -- class LIBERTY_GENERICS_CONFORMANCE_CHECKER
