note
   description:
      "Iterator over a C_ARRAY."
   copyright:
      "[
               Copyright (C) 2007-2018: Paolo Redaelli

               This library is free software; you can redistribute it and/or
               modify it under the terms of the GNU Lesser General Public License
               as published by the Free Software Foundation; either version 2.1 of
               the License, or (at your option) any later version.

               This library is distributed in the hope that it will be useful, but
               WITHOUT ANY WARRANTY; without even the implied warranty of
               MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
               Lesser General Public License for more details.

               You should have received a copy of the GNU Lesser General Public
               License along with this library; if not, write to the Free Software
               Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
               02110-1301 USA
         ]"
class ITERATOR_ON_C_ARRAY[ITEM_ -> C_STRUCT]
    -- TODO: this class is conceptually obsolete as it actually duplicates
    -- ITERATOR_ON_COLLECTION, or more precisely ITERATOR_ON_TRAVERSABLE. It
    -- could and should be easily removed 

inherit
   ITERATOR[ITEM_]

create {ANY}
   from_array

feature {} -- Creation and implementation
   from_array (an_array: C_ARRAY[ITEM_])
      require
         array_not_void: an_array /= Void
      do
         array := an_array
      end

   i: INTEGER -- Iterator index

   array: C_ARRAY[ITEM_]

feature {ANY} --
   start
      do
         i := array.lower
      end

   is_off: BOOLEAN
      do
         Result := i > array.upper
         -- Result:=array.valid_index(i)
      end

   item: ITEM_
      do
         Result := array.item(i)
      end

   next
      do
         i := i + 1
      end

feature {ANY}
   iterable_generation: INTEGER
      do
         Result := array.generation
      end

   generation: INTEGER


end -- class ITERATOR_ON_C_ARRAY
