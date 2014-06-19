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
class LIBERTY_TAG_REF[T_]

create {LIBERTY_TAGS}
   make

feature {ANY}
   add (a_value: T_; tagged: LIBERTY_TAGGED)
      require
         not is_set(tagged)
      local
         tag: LIBERTY_TYPED_TAG[T_]
      do
         create tag.make(Current, a_value)
         tagged.add_tag(tag)
      ensure
         is_set(tagged)
      end

   set (a_value: T_; tagged: LIBERTY_TAGGED)
      local
         tag: LIBERTY_TYPED_TAG[T_]
      do
         create tag.make(Current, a_value)
         tagged.set_tag(tag)
      ensure
         is_set(tagged)
      end

   is_set (tagged: LIBERTY_TAGGED): BOOLEAN
      require
         tagged /= Void
      do
         Result := tagged.tag_set(id)
      end

   value (tagged: LIBERTY_TAGGED): T_
      require
         is_set(tagged)
      local
         tag: LIBERTY_TYPED_TAG[T_]
      do
         tag ::= tagged.tag(id)
         Result := tag.value
      end

feature {LIBERTY_TAGGED, LIBERTY_TAG}
   id: FIXED_STRING

feature {}
   make (a_id: like id)
      require
         a_id /= Void
      do
         id := a_id
      end

end
