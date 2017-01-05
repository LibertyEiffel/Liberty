deferred class WRAPPABLE_NODE
   -- A node of an XML file made by GccXml representing an entity that may be wrapped in Liberty Eiffel either as a feature, as a class or a cluster.

inherit
   NAMED_NODE

insert
   NAME_CONVERTER

feature {ANY} -- Emittability
   is_to_be_emitted: BOOLEAN
         -- Shall Current node be wrapped?
      deferred
      end

   emitted: BOOLEAN 
      -- Has Current node been already been wrapped?

end -- class WRAPPABLE_NODE
-- Copyright (C) 2008-2017: ,2009,2010 Paolo Redaelli
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
