indexing
   description:
      "An array of C strings. Wraps 'char **'."
   copyright:
      "[
               Copyright (C) 2006 Paolo Redaelli

               This library is free software; you can redistribute it and/or
               modify it under the terms of the GNU Lesser General Public License
               as published by the Free Software Foundation; either version 2.1 of
               the License, or (at your option) any later version.

               This library is distributed in the hopeOA that it will be useful, but
               WITHOUT ANY WARRANTY; without even the implied warranty of
               MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
               Lesser General Public License for more details.

               You should have received a copy of the GNU Lesser General Public
               License along with this library; if not, write to the Free Software
               Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
               02110-1301 USA
         ]"
class STRING_ARRAY
   -- An array of C strings, wrapping the type 'char **'.

   -- This class is only TRAVERSABLE and not a COLLECTION because a
   -- COLLETION offers feature to change its contents; a "char **" does not
   -- offer any hint on the memory handling required to implement changing
   -- features. 

   -- It is debatable if such a low-level storage shall be
   -- shown to the end-user Eiffel developers or if it is better to
   -- copy its contents into a more proper Eiffel COLLECTION.

   -- Previously this class ensured an "implicit" post-condition of the item
   -- feature, i.e. that invoking item several times with the same index
   -- returns the same Eiffel, i.e. item(i)=item(i). Since item feature in
   -- INDEXABLE actually does ot have this requirements it won't be garantueed
   -- anymore. Of course the contenct of the strings will be the same, ensuring
   -- that item(i).is_equal(item(i)), which is also writable as item(i)~item(i)

inherit TRAVERSABLE[STRING]

insert WRAPPER_HANDLER -- to use null_or_string

create {ANY} 
   from_external_array, from_external_null_array

feature {STRING_ARRAY, WRAPPER_HANDLER}
   storage: NATIVE_ARRAY[POINTER]

feature {ANY} 
	lower: INTEGER is 0 
   
	upper: INTEGER is
      do
         Result := count-1
      end

   count: INTEGER 

feature {} -- Creation
   from_external_array (an_array: POINTER; a_length: INTEGER) is
      require
         array_not_null: an_array.is_not_null
         positive_length: a_length > 0
      do
         storage := storage.from_pointer(an_array)
		 count := a_length
      ensure
         count = a_length
      end

  from_external_null_array (an_array: POINTER) is
  require
	  array_not_null: an_array.is_not_null
  local
	  length: INTEGER
  do
	  storage := storage.from_pointer(an_array)
	  from
		  length := 0
	  until
		  storage.item(length).is_null
	  loop
		  length := length + 1
	  end
	  count := length
  end

feature {ANY} -- Accessing
   item (an_index: INTEGER): STRING is
      local
         p: POINTER
      do
         p := storage.item(an_index)
         if p.is_not_null then
			 create Result.from_external(p)
		 end
      end

   new_iterator: ITERATOR[STRING] is
      do
         create {STRING_ARRAY_ITERATOR} Result.make(Current)
      end

   first: like item is
      do
         Result := item(lower)
      end

   last: like item is
      do
         Result := item(upper)
      end

   is_empty: BOOLEAN is
      do
         Result := count=0
      end

end -- class STRING_ARRAY
