deferred class IDENTIFIED_NODE
   -- A Gccxml node with id attribute

inherit
   GCCXML_NODE

feature {ANY}
   id: UNICODE_STRING
      do
         Result := attribute_at(once U"id")
      ensure
         Result /= Void
      end

end -- class IDENTIFIED_NODE
-- Copyright (C) 2008-2018: ,2009,2010 Paolo Redaelli
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
