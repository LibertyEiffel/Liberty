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
   -- An array of C strings. Wraps 'char **'.

  	-- Implementation notes: this class inhertis from TRAVERSABLE hence from
	-- INDEXABLE. INDEXABLE first feature has the post condition "ensure
	-- definition Result = item(lower)". This means that first, last and item
	-- must return the same object every time they are called. Therefore in
	-- this wrapper to char** item can't be implemented as a simple "create
	-- Result.from_external(storage.item(i))" but a STRING_ARRAY must cache the
	-- result.

	-- One of the assumption of being a TRAVERSABLE[STRING] is that we assume
	-- that it cannot change. Yet the actual items could change while being
	-- still owned by this wrapper.

	-- It is debatable if such a low-level collection shall be passed to the
	-- end-user Eiffel developers or if it is better to copy its contents into
	-- a more proper Eiffel COLLECTION or TRAVERSABLE with proper information
	-- of memory handling policy.

	-- Most often a STRING_ARRAY or a NULL_TERMINATED_STRING_ARRAY object is
	-- meant to be a short lived temporary.
  
inherit
   TRAVERSABLE[STRING]
   STRING_HANDLER

insert
   WRAPPER_HANDLER
      -- only to get null_or_string

create {ANY}
   from_external_array, from_external_null_array, 
   from_indexable, from_iterable

feature {} -- Creation
	from_indexable (an_indexable: INDEXABLE[STRING]) is
		-- Build Current from `an_indexable', using item feature
	local i, other_i: INTEGER
	do
		storage := storage.calloc(an_indexable.count)
        create strings.make(an_indexable.count)
		
		from i := lower; other_i:=an_indexable.lower until i>upper
		loop
			storage.put(an_indexable.item(other_i).to_external,i)
			strings.put(an_indexable.item(other_i),i)
			i:=i+1
			other_i := other_i + 1
		end
	end

	from_iterable (an_iterable: ITERABLE[STRING]) is
		-- Build Current from `an_iterable' using iterators
	local iter: ITERATOR[STRING]; c,i: INTEGER_32
	do
		-- Count the objects
		iter := an_iterable.new_iterator
		from iter.start; c:=0; until not iter.is_off loop c:=c+1; iter.next; end -- Sorry for the one-liner
		storage := storage.calloc(c)
		create strings.make(c)
		from iter.start; i:=strings.lower 
		until not iter.is_off
		loop
			storage.put(iter.item.to_external,i)
			strings.put(iter.item,i)
			i:=i+1
			iter.next
		end
	end




   from_external_array (an_array: POINTER; a_length: INTEGER) is
      require
         array_not_null: an_array.is_not_null
         positive_length: a_length > 0
      do
         storage := storage.from_pointer(an_array)
         create strings.make(a_length)
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
         create strings.make(length)
      end

feature {STRING_ARRAY, WRAPPER_HANDLER}
	storage: NATIVE_ARRAY[POINTER]

	strings: FAST_ARRAY[STRING]

feature {ANY} --
   lower: INTEGER is
      do
         Result := strings.lower
      end

   upper: INTEGER is
      do
         Result := strings.upper
      end

   count: INTEGER is
      do
         Result := upper - lower + 1
      end

feature {ANY} -- Accessing
   item (an_index: INTEGER): STRING is
      local
         p: POINTER
      do
         p := storage.item(an_index)
         if p.is_not_null then
			 Result := string.item(an_index)
			 if Result = Void then 
				 create Result.from_external(p)
				 strings.put(Result,i)
			 end
			
			 check -- That the underlying C string has not been changed since its wrapper has been created
			 	Result.to_external = p
			end
         else
			 check 
				 Result = Void
			 end
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
         Result := strings.is_empty
      end

end -- class STRING_ARRAY
