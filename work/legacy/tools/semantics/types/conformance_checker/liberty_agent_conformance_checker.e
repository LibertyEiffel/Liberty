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
class LIBERTY_AGENT_CONFORMANCE_CHECKER

inherit
   LIBERTY_GENERICS_CONFORMANCE_CHECKER
      undefine
         is_equal
      end

insert
   SINGLETON

create {LIBERTY_UNIVERSE}
   make

feature {LIBERTY_ACTUAL_TYPE}
   inherits (parent, child: LIBERTY_KNOWN_TYPE): BOOLEAN
      do
         Result := check_inheritance(parent, child, True)
      end

   inserts (parent, child: LIBERTY_KNOWN_TYPE): BOOLEAN
      do
         Result := check_inheritance(parent, child, False)
      end

feature {}
   check_inheritance (parent, child: LIBERTY_KNOWN_TYPE; conformance: BOOLEAN): BOOLEAN
      local
         i: INTEGER
      do
         check
            parent.parameters.lower = child.parameters.lower
            not parent.parameters.is_empty
            not child.parameters.is_empty
         end
         Result := parent.parameters.count = child.parameters.count
         if Result then
            check
               -- parent.parameters.first and child.parameters.first both are tuples
            end
            if conformance then
               Result := parent.parameters.first.known_type.is_conform_to(child.parameters.first.known_type)
            else
               Result := parent.parameters.first.known_type.is_non_conformant_child_of(child.parameters.first.known_type)
            end
            from
               i := parent.parameters.lower + 1
            until
               not Result or else i > parent.parameters.upper
            loop
               check
                  parent.parameters.item(i).is_known
                  child.parameters.item(i).is_known
               end
               if conformance then
                  Result := child.parameters.item(i).known_type.is_conform_to(parent.parameters.item(i).known_type)
               else
                  Result := child.parameters.item(i).known_type.is_non_conformant_child_of(parent.parameters.item(i).known_type)
               end
               i := i + 1
            end
         end
      end

feature {}
   make
      do
      end

end -- class LIBERTY_AGENT_CONFORMANCE_CHECKER
