deferred class TYPED_NODE
   -- A castxml node with "type" attribute

inherit
   CASTXML_NODE

insert
   SHARED_COLLECTIONS

feature {ANY}
   type: UNICODE_STRING
      do
         Result := attribute_at(once U"type")
      ensure
         Result /= Void
      end

   is_void: BOOLEAN  deferred

   referree: C_TYPE
         -- The node referred by `type' in `types' dictionary.
      do
         Result := types.reference_at(type)
         if Result=Void then
            log.info.put_line("Warning: type #(1) at line does not have a referee in types" # type.as_utf8 )
         end
      end

end -- class TYPED_NODE

-- Copyright (C) 2008-2025: Paolo Redaelli
--
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
