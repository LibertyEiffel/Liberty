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
class LIBERTY_TYPED_TAG[T_]

inherit
   LIBERTY_TAG

create {LIBERTY_TAG_REF}
   make

feature {ANY}
   id: FIXED_STRING is
      do
         Result := ref.id
      end

   value: T_

feature {LIBERTY_TAG_REF}
   set (a_value: like value) is
      do
         value := a_value
      ensure
         value = a_value
      end

feature {}
   make (a_ref: like ref; a_value: like value) is
      require
         a_ref /= Void
      do
         ref := a_ref
         value := a_value
      ensure
         ref = a_ref
         value = a_value
      end

   ref: LIBERTY_TAG_REF[T_]

invariant
   ref /= Void

end
