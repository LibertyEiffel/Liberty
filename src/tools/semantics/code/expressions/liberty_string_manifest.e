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
class LIBERTY_STRING_MANIFEST

inherit
   LIBERTY_TYPED_MANIFEST[STRING]
      rename
         make as typed_make
      redefine
         mark_reachable_code
      end

create {LIBERTY_BUILDER_TOOLS}
   make

feature {ANY}
   is_once: BOOLEAN

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER) is
      do
         Precursor(mark)
         storage_type.mark_reachable_code(mark)
      end

feature {}
   make (a_type: like result_type; a_storage_type: like storage_type; a_manifest: like manifest; a_once: like is_once; a_position: like position) is
      require
         a_type /= Void
         -- a_type is STRING
         a_storage_type /= Void
         -- a_storage_type is NATIVE_ARRAY[CHARACTER]
         a_position /= Void
      do
         typed_make(a_type, a_manifest, a_position)
         storage_type := a_storage_type
         is_once := a_once
      ensure
         result_type = a_type
         storage_type = a_storage_type
         manifest = a_manifest
         is_once = a_once
         position = a_position
      end

   storage_type: LIBERTY_ACTUAL_TYPE

feature {ANY}
   accept (v: VISITOR) is
      local
         v0: LIBERTY_STRING_MANIFEST_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_string_manifest(Current)
      end

invariant
   result_type /= Void
      -- result_type is STRING
   storage_type /= Void
      -- storage_type is NATIVE_ARRAY[CHARACTER]

end
