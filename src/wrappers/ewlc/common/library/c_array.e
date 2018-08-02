note
	description: "."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli 
					
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

deferred class C_ARRAY [ITEM_ -> C_STRUCT]
	-- An array of wrapped item which is also a wrapper to a C array 
	-- of pointers of item's struct. For example a C_ARRAY[GTK_BUTTON] 
	-- wraps a GtkButton** array.

inherit WRAPPER_COLLECTION [ITEM_]

insert
	EXCEPTIONS
		undefine
			fill_tagged_out_memory, copy, is_equal
		end

-- creation with_capacity, from_collection, from_external_array

feature {} -- Creation
	from_external_array (an_array: POINTER; a_length: INTEGER)
		require
			array_not_null: an_array.is_not_null
			positive_length: a_length > 0
		do
			upper := a_length - 1 
			capacity := a_length
			storage := storage.from_pointer (an_array)
		end
	
	with_capacity (a_capacity: INTEGER)
		require positive_capacity: a_capacity > 0
		do
			capacity := a_capacity
			upper := -1
			storage := storage.calloc(a_capacity)
		end

feature {} -- 	
	object_materialization_notice: STRING
			-- The notice printed when creating a new wrapper object from
			-- no-where.
		"Warning: C_ARRAY is going to create a new wrapper; if ITEM_ is deferred the program will almost surely crash. The actual ITEM_ must be made non-deferred.%N"

feature {ANY}
	item (i: INTEGER_32): ITEM_
		local
			ptr: POINTER
		do
			ptr := storage.item(i)
			if ptr.is_not_null then 
				Result:=wrapper(ptr)
			end
		end

	first: ITEM_
		do
			Result := item(lower)
		end

	last: ITEM_
		do
			Result := item(upper)
		end
	
feature {ANY} -- Writing:
	put (element: like item; i: INTEGER)
		do
			if element /= Void then
				storage.put(element.handle, i)
			else
				storage.put(default_pointer, i)
			end
		end

	set_all_with (v: like item)
		local
			i: INTEGER
		do
			from
				i := lower
			until
				i > upper
			loop
				put(v, i)
				i := i + 1
			end
		end

feature {ANY} -- Adding:
	add_first (element: like item)
			-- Performance: O(count), not counting the eventual reallocation.
		local i,j: INTEGER
		do
			if count=capacity then
				capacity := capacity*2
				storage:=storage.realloc (count,capacity)
			end
			from i:=upper; j:=i+1 until i=lower
			loop
				storage.put(storage.item(i),j)
				j:=i; i:=i-1
			end
			storage.put(null_or(element),lower)
			upper:=upper+1
		end

	add_last (element: like item)
			-- Performance: O(1), not counting the eventual reallocation.
		do
			if count=capacity then
				capacity := capacity*2
				storage:=storage.realloc (count,capacity)
			end
			check count=upper+1 end -- because the next put command relies on this assumption.
			storage.put(null_or(element),count)
			upper:=upper+1
		end

	add (element: like item; index: INTEGER)
			-- Performance: O(count-index), not counting the eventual reallocation
		local i,j: INTEGER 
		do
			-- Add a new `element' at rank `index' : `count' is increased by one
			-- and range [`index' .. `upper'] is shifted right by one position.
			if count=capacity then
				capacity := capacity*2
				storage:=storage.realloc (count,capacity)
			end
			from i:=upper; j:=upper+1 until i<index
			loop
				storage.put(storage.item(i),j)
				j:=i ; i:=i-1
			end
			storage.put(null_or(element),index)
			upper:=upper+1
		end

feature {ANY} -- Modification:
	copy (other: like Current)
		local i: INTEGER
		do
			if other/=Void then
				capacity := other.capacity
				upper := other.upper
				storage := storage.calloc(other.capacity)
				from i:=lower until i>upper loop
					put(other.item(i),i)
					i:=i+1
				end
			end
		end

	force (element: ITEM_; index: INTEGER)
		do
			-- Make `element' the item at `index', enlarging the collection if
			-- necessary (new bounds except `index' are initialized with default
			-- values).
			if index>upper then
				upper:=index				
				if index>capacity then 
					debug print (once "C_ARRAY.force: storage enlarged using realloc%N") end
					storage:=storage.realloc(count,index) 
				end
			end
			put(element,index)
		end

	from_collection (model: COLLECTION[like item])
		local i: ITERATOR[like item]
		do
				-- FIXME: signature should be model: TRAVERSABLE, once SE2.3 is out
			with_capacity(model.count)
			from i:=model.get_new_iterator; i.start
			until i.is_off 
			loop add_last(i.item); i.next
			end
		end

feature {ANY} -- Removing:
	remove_first
			-- Performance: O(count)
		local i,j: INTEGER
		do
			-- Remove the `first' element of the collection.
			from i:=lower; j:=lower+1 until j>upper
			loop
				storage.put(storage.item(j),i)
				i:=j; j:=j+1
			end
			upper:=upper-1
		end

	remove_head (n: INTEGER)
			-- Performance: O(upper-n)
		local i,j: INTEGER
		do
			-- Remove the `n' elements of the collection.
			from i:=lower; j:=lower+n until j>upper
			loop
				storage.put(storage.item(j),i)
				i:=i+1; j:=j+1				    
			end
			upper:=upper-n
		end

	remove (index: INTEGER)
			-- Performance: O(count)
		local i,j: INTEGER
		do
			-- Remove the item at position `index'. Followings items are shifted
			-- left by one position.
			from i:=index; j:=index+1 until j>=upper
			loop
				storage.put(storage.item(j),i)
				i:=j; j:=j+1
			end
			upper:=upper-1
		end

	remove_last
			-- Performance: O(1)
		do
			-- Remove the `last' item.
			storage.put(default_pointer,upper)
			upper:=upper-1
		end

	remove_tail (n: INTEGER)
			-- Performance: O(n)
		local i,j: INTEGER
		do
			-- Remove the last `n' item(s).
			-- 0 1 2 3 4 5 6 7 8 9  (0,9 c=10)
			-- 0 1 2 3 4 5 6 x x x  (n=3)
			from i:=upper-n+1 until i>upper
			loop storage.put(default_pointer,i) i:=i+1
			end
			upper:=upper-n
		end

	clear_count
		local i: INTEGER
		do
			-- Discard all items (`is_empty' is True after that call). If
			-- possible, the actual implementation is supposed to keep
			-- its internal storage area in order to refill `Current' in
			-- an efficient way.
			from i:=lower until i>upper
			loop
				storage.put(default_pointer,i)
				i:=i+1
			end
			upper:=lower
		end

	clear_count_and_capacity
			-- Instead of releasing the memory, it is reallocated with
			-- with 2 elements.
		do
			-- Discard all items (`is_empty' is True after that call). If possible,
			-- the actual implementation is supposed to release its internal
			-- storage area for this memory to be used by other objects.
			storage:=storage.realloc(count,2) 
			upper:=lower
		end

feature {ANY} -- Looking and Searching:
	first_index_of (element: like item): INTEGER
		do
				Result := index_of (element, lower)
		end

	index_of (element: like item; start_index: INTEGER): INTEGER
		do
			-- Using `is_equal' for comparison, gives the index of the
			-- first occurrence of `element' at or after
			-- `start_index'. Answer `upper + 1' when `element' when the
			-- search fail.
			if element=Void then
				from Result:=lower -- start_index
				until item(Result)=Void or else Result>upper
				loop Result:=Result+1
				end
			else
				from Result:=lower -- start_index
				until item(Result).is_equal(element) or else Result>upper
				loop Result:=Result+1
				end				
			end
		end

	reverse_index_of (element: like item; start_index: INTEGER): INTEGER
		do
			-- Using `is_equal' for comparison, gives the index of the
			-- first occurrence of `element' at or before
			-- `start_index'. Search is done in reverse direction, which
			-- means from the `start_index' down to the `lower'
			-- index. Answer `lower -1' when the search fail.
			if element=Void then
				from Result:=start_index
				until item(Result)=Void or else Result<lower
				loop Result:=Result-1
				end
			else
				from Result:=start_index
				until item(Result).is_equal(element) or else Result<lower
				loop Result:=Result-1
				end				
			end
			
		end

	fast_first_index_of (element: like item): INTEGER
			-- Note: comparison is done using the address of the wrapped
			-- structure.
		do
				Result := fast_index_of (element, lower)
		end

	fast_index_of (element: like item; start_index: INTEGER): INTEGER
			-- Note: comparison is done using the address of the wrapped
			-- structure.
		local element_ptr: POINTER
		do
			-- Using basic `=' for comparison, gives the index of the
			-- first occurrence of `element' at or after
			-- `start_index'. Answer `upper + 1' when `element' when the
			-- search fail.
			element_ptr:=null_or(element)
			from Result:=lower until storage.item(Result)=element_ptr or else Result>upper
			loop Result:=Result+1
			end
		end

	fast_reverse_index_of (element: like item; start_index: INTEGER): INTEGER
			-- Note: comparison is done using the address of the wrapped
			-- structure
		local element_ptr: POINTER
		do
			-- Using basic `=' comparison, gives the index of the first
			-- occurrence of `element' at or before `start_index'. Search
			-- is done in reverse direction, which means from the
			-- `start_index' down to the `lower' index . Answer `lower
			-- -1' when the search fail.
			element_ptr:=null_or(element)
			-- from Result:=start_index
			from Result:=lower until storage.item(Result)=element_ptr or else Result>upper
			loop Result:=Result-1
			end
		end

feature {ANY} -- Looking and comparison:
	is_equal (other: like Current): BOOLEAN
			-- Do both collections have the same `lower', `upper', and items?
			-- The basic `=' is used for comparison of items.

			-- Complexity: O(count)

			-- See also `is_equal_map', `same_items'.
		local i: INTEGER
		do
			from i:=lower 
			until Result=True or else i>upper 
			loop
				Result := (Current.storage.item(i) = other.storage.item(i))
				i:=i+1
			end
		end

	is_equal_map (other: like Current): BOOLEAN
		local i: INTEGER; c_ith, o_ith: ITEM_
		do
			-- Do both collections have the same `lower', `upper', and
			-- items?  feature `is_equal' is used for comparison of
			-- items.
			if other=Void then Result:=False
			elseif count/=other.count then Result:=False
			else 
				from i:=lower; Result:=True until Result=False or else i>upper 
				loop
					c_ith:=Current.item(i)
					o_ith:=other.item(i)
					if c_ith/=Void then
						if o_ith/=Void then Result := c_ith.is_equal(o_ith)
						else                Result := False
						end
					else
						if o_ith/=Void then Result := False
						else -- nothing, result should already be true
						end
					end
					i:=i+1
				end
			end
		end

	all_default: BOOLEAN
			-- Do all items have their type's default value?  Note: for
			-- non Void items, the test is performed with the
			-- `is_default' predicate.
			
			-- See also `clear_all'.
		local i:INTEGER
		do
			from i:=lower until Result=False or else i>upper
			loop
				Result:= (storage.item(i).is_null)
				i:=i+1
			end			
		end

	occurrences (element: like item): INTEGER
		local i: ITERATOR[ITEM_]
		do
			-- Number of occurrences of `element' using `is_equal' for comparison.
			if element/=Void then 
				from i:=get_new_iterator; i.start; until i.is_off
				loop
					if element.is_equal(i.item) then Result:=Result+1 end
					i.next
				end
			else
				from i:=get_new_iterator; i.start; until i.is_off
				loop
					if i.item=Void then Result:=Result+1 end
					i.next
				end
			end
		end

	fast_occurrences (element: like item): INTEGER
			-- Number of occurrences of `element' using basic its handle
			-- (or default_pointer) for comparison.
		local ep: POINTER; i: INTEGER
		do
			ep:=null_or(element)
			from i:=lower until i>upper loop
				if storage.item(i)=ep then Result:=Result+1 end
				i:=i+1
			end
		end

feature {ANY} -- Agents based features:
	-- do_all (action: ROUTINE[TUPLE[ITEM_]]) is
	-- do
	-- 			-- Apply `action' to every item of `Current'.
	-- 			--
	-- 			-- See also `for_all', `exists'.
	-- 		require
	-- 			action /= Void
	-- 		local
	-- 			i: INTEGER
	-- 		do
	-- 			from
	-- 				i := lower
	-- 			until
	-- 				i > upper
	-- 			loop
	-- 				action.call([item(i)])
	-- 				i := i + 1
	-- end
	-- end

	-- for_all (test: PREDICATE[TUPLE[ITEM_]]): BOOLEAN is
	--		do
	-- 			-- Do all items satisfy `test'?
	-- 			--
	-- 			-- See also `do_all', `exists'.
	-- 		require
	-- 			test /= Void
	-- 		local
	-- 			i: INTEGER
	-- 		do
	-- 			from
	-- 				Result := True
	-- 				i := lower
	-- 			until
	-- 				not Result or else i > upper
	-- 			loop
	-- 				Result := test.item([item(i)])
	-- 				i := i + 1
	-- end
	--		end

	-- exists (test: PREDICATE[TUPLE[ITEM_]]): BOOLEAN is
	--		do
	-- 			-- Does at least one item satisfy `test'?
	-- 			--
	-- 			-- See also `do_all', `for_all'.
	-- 		require
	-- 			test /= Void
	-- 		local
	-- 			i: INTEGER
	-- 		do
	-- 			from
	-- 				i := lower
	-- 			until
	-- 				Result or else i > upper
	-- 			loop
	-- 				Result := test.item([item(i)])
	-- 				i := i + 1
		-- end
		-- end

feature {ANY} -- Other features:
	replace_all (old_value, new_value: like item)
		obsolete "Unimplemented!"
		do
			-- 			-- Replace all occurrences of the element `old_value' by `new_value' using `is_equal' for comparison.
			-- 			--
			-- 			-- See also `fast_replace_all', `move'.
			-- 		deferred
			-- 		ensure
			-- 			count = old count
			-- 			not (create {SAFE_EQUAL[ITEM_]}).test(old_value, new_value) implies occurrences(old_value) = 0
		end

	fast_replace_all (old_value, new_value: like item)
		obsolete "Unimplemented!"
		do
			-- 			-- Replace all occurrences of the element `old_value' by `new_value' using basic `=' for comparison.
			-- 			--
			-- 			-- See also `replace_all', `move'.
			-- 		deferred
			-- 		ensure
			-- 			count = old count
			-- 			old_value /= new_value implies fast_occurrences(old_value) = 0
		end

	--	move (lower_index, upper_index, distance: INTEGER) is
	--		do
	-- 			-- Move range `lower_index' .. `upper_index' by `distance' positions.
	-- 			--	Negative distance moves towards lower indices.
	-- 			-- Free places get default values.
	-- 			--
	-- 			-- See also `slice', `replace_all'.
	-- 		require
	-- 			lower_index <= upper_index
	-- 			valid_index(lower_index)
	-- 			valid_index(lower_index + distance)
	-- 			valid_index(upper_index)
	-- 			valid_index(upper_index + distance)
	-- 		local
	-- 			default_value: like item; i: INTEGER
	-- 		do
	-- 			if distance = 0 then
	-- 			elseif distance < 0 then
	-- 				from
	-- 					i := lower_index
	-- 				until
	-- 					i > upper_index
	-- 				loop
	-- 					put(item(i), i + distance)
	-- 					put(default_value, i)
	-- 					i := i + 1
	-- end
	-- 			else
	-- 				from
	-- 					i := upper_index
	-- 				until
	-- 					i < lower_index
	-- 				loop
	-- 					put(item(i), i + distance)
	-- 					put(default_value, i)
	-- 					i := i - 1
	--	end
	--	end
	-- 		ensure
	-- 			count = old count
	--	end

	slice (min, max: INTEGER): like Current
		obsolete "Unimplemented!"
		do
			-- 			-- New collection consisting of items at indexes in [`min'..`max'].
			-- 			-- Result has the same dynamic type as `Current'.
			-- 			-- The `lower' index of the `Result' is the same as `lower'.
			-- 			--
			-- 			-- See also `from_collection', `move', `replace_all'.
			-- 		require
			-- 			lower <= min
			-- 			max <= upper
			-- 			min <= max + 1
			-- 		deferred
			-- 		ensure
			-- 			same_dynamic_type(Result)
			-- 			Result.count = max - min + 1
			-- 			Result.lower = lower
		end

	reverse
		obsolete "Unimplemented!"
		do
			-- 			-- Reverse the order of the elements.
			-- 		deferred
			-- 		ensure
			-- 			count = old count
		end

feature {ANY}
	-- struct_size: INTEGER

	count: INTEGER
		do
			Result:=upper-lower+1
		end
	
	upper: INTEGER

	lower: INTEGER is 0

	is_empty: BOOLEAN
		do
			Result := (upper = -1) or else storage.is_null
		end

	get_new_iterator: ITERATOR[ITEM_]
		do
			create {ITERATOR_ON_C_ARRAY[ITEM_]} Result.from_array(Current)
		end

feature {C_ARRAY, WRAPPER_HANDLER} -- Implementation
	storage: NATIVE_ARRAY[POINTER]

	capacity: INTEGER

	manifest_put (index: INTEGER_32; element: ITEM_)
		do
			put(element, index)
		end

end -- class C_ARRAY
