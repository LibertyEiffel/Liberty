deferred class FILED_NODE
   -- A Gccxml node with "file" attribute

inherit
   GCCXML_NODE

insert
   SHARED_COLLECTIONS

feature {ANY}
   file_id: UNICODE_STRING
      do
         Result := attribute_at(once U"file")
      ensure
         Result /= Void
      end

   line_row: UNICODE_STRING
         -- The line in the source code where Current is defined
      do
         Result := attribute_at(once U"line")
         if Result=Void then Result := once U"unknown"
      ensure
         Result /= Void
      end

   c_file: C_FILE
      do
         if file_id /= Void then
            Result := files.reference_at(file_id)
         else
            log(once "warning node at line #(1) does not have a C associated file"# (&line))
         end
      end

   set_file (a_file: C_FILE)
         -- Make Current node as if it was defined into `a_file'
         -- Consider Current as if it was defined in `a_file_name'.
      require
         a_file /= Void
      do
         attributes.put(a_file.id, once U"file")
      ensure
         set: c_file = a_file
      end

end -- class FILED_NODE
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
