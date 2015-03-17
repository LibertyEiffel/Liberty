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
class LIBERTY_INTERPRETER_NATIVE_ARRAY_ITERATOR[E_]

inherit
   ITERATOR[LIBERTY_INTERPRETER_OBJECT]

create {LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED}
   make

feature {ANY}
   start
      do
         elements.start
      end

   is_off: BOOLEAN
      do
         Result := elements.is_off
      end

   item: LIBERTY_INTERPRETER_OBJECT
      do
         Result := accessor.retrieve(elements.item)
      end

   next
      do
         elements.next
      end

feature {}
   make (a_elements: like elements; a_accessor: like accessor)
      require
         a_elements /= Void
         a_accessor /= Void
      do
         elements := a_elements
         accessor := a_accessor
      ensure
         elements = a_elements
         accessor = a_accessor
      end

   elements: ITERATOR[E_]
   accessor: LIBERTY_INTERPRETER_NATIVE_ARRAY_ACCESSOR_TYPED[E_]

invariant
   elements /= Void
   accessor /= Void

end -- class LIBERTY_INTERPRETER_NATIVE_ARRAY_ITERATOR
