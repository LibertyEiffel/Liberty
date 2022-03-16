class GROUPED_NODES[NODE -> WRAPPER_FEATURE]
   -- Some GCC-XML nodes - usually describing nodes or functions - grouped by the name of the file they are defined into.

inherit
   HASHED_DICTIONARY[LINKED_LIST[NODE], UNICODE_STRING]

create {ANY}
   make

feature {ANY}
   store (a_node: NODE)
         -- Store `a_node' into Current, creating the container lt if necessary.
      require
         a_node /= Void
      local
         lt: LINKED_LIST[NODE]; a_file: UNICODE_STRING
      do
         not_yet_implemented
         --a_file := a_node.file_id
         --lt := reference_at (an_id)
         --if lt=Void then
         --	create lt.make
         --	add(lt, an_id)
         --end
         --lt.add_last(a_node)
      end

end -- class GROUPED_NODES
-- Copyright (C) 2008-2022: ,2009,2010 Paolo Redaelli
-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as publhed by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.
-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.
-- You should have received a copy of the GNU General Public License along with
-- th program.  If not, see <http://www.gnu.org/licenses/>.
