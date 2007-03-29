indexing
	description: "."
	copyright: "[
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

class C_ARRAY [ITEM -> SHARED_C_STRUCT]
	-- TODO: ITEM could also be conformant to C_STRUCT or
	-- SHARED_C_STRUCT. See which is the better design.

inherit 
	COLLECTION [ITEM]
	SHARED_C_STRUCT
		rename exists as struct_exists
		undefine fill_tagged_out_memory
		redefine is_equal
		end

insert
	SHARED_WRAPPERS_DICTIONARY
		undefine fill_tagged_out_memory
		end
	
	WRAPPER_RETRIEVER[ITEM]
		undefine
			fill_tagged_out_memory,
			copy,
			is_equal
		end
								 
creation
	with_capacity,
	from_collection,
	from_external_array

feature {} -- Creation
	from_external_array (an_array: POINTER; a_length: INTEGER) is
		require
			array_not_null: an_array.is_not_null
			positive_length: a_length > 0
		do
			capacity := a_length
			storage := storage.from_pointer (an_array)
			handle := storage.to_pointer 
		end
	
	with_capacity(a_capacity: INTEGER) is
		require positive_capacity: a_capacity > 0
		do
			capacity := a_capacity
			storage := storage.calloc(a_capacity)
			handle := storage.to_pointer 
		end

feature
	item (i: INTEGER_32): ITEM is
		local ptr: POINTER
		do
			ptr := storage.item(i)
			if ptr.is_not_null then 
				if wrappers.has (ptr) then Result ::= wrappers.at (ptr)
				else
					Result := new_item
					Result.from_external_pointer(ptr)
				end
			end
		end

   first: ITEM is
		local ptr: POINTER
		do
			ptr := storage.item(lower)
			if ptr.is_not_null then 
				if wrappers.has (ptr) then
					Result ::= wrappers.at (ptr)
				else
					Result := new_item
					Result.from_external_pointer(ptr)
				end
			end
		end

   last: ITEM is
		local ptr: POINTER
		do
			ptr := storage.item(upper)
			if ptr.is_not_null then 
				if wrappers.has (ptr) then
					Result ::= wrappers.at (ptr)
				else
					Result := new_item
					Result.from_external_pointer(ptr)
				end
			end
		end
	
feature {ANY} -- Writing:
	put (element: like item; i: INTEGER) is
		do
			if element /= Void then storage.put(element.handle,i)
			else  storage.put(default_pointer,i)
			end
		end

	set_all_with (v: like item) is
		obsolete "Unimplemented!"
		do
			-- 		do
		
		end

feature {ANY} -- Adding:
	add_first (element: like item) is
		obsolete "Unimplemented!"
		do
			-- 			-- Add a new item in first position : `count' is increased by
			-- 			-- one and all other items are shifted right.
			-- 			--
			-- 			-- See also `add_last', `first', `last', `add'.
			-- 		do
		
		end

	add_last (element: like item) is
		obsolete "Unimplemented!"
		do
			-- 			-- Add a new item at the end : `count' is increased by one.
			-- 			--
			-- 			-- See also `add_first', `last', `first', `add'.
			-- 		do
		
		end

	add (element: like item; index: INTEGER) is
		obsolete "Unimplemented!"
		do
			-- 			-- Add a new `element' at rank `index' : `count' is increased
			-- 			-- by one and range [`index' .. `upper'] is shifted right by one position.
			-- 			--
			-- 			-- See also `add_first', `add_last', `append_collection'.
			-- 		do
			
		end

feature {ANY} -- Modification:
	force (element: ITEM; index: INTEGER) is
		obsolete "Unimplemented!"
		do
			-- 			-- Make `element' the item at `index', enlarging the collection if
			-- 			-- necessary (new bounds except `index' are initialized with
			-- 			-- default values).
			-- 			--
			-- 			-- See also `put', `item', `swap'.
			-- 		do
			
		end

	from_collection (model: TRAVERSABLE[like item]) is
		obsolete "Unimplemented!"
		do
			-- 			-- Initialize the current object with the contents of `model'.
			-- 		require
			-- 			model /= Void
			-- 			useful_work: model /= Current
			-- 		deferred
			-- 		ensure
			-- 			count = model.count
		end

feature {ANY} -- Removing:
	remove_first is
		obsolete "Unimplemented!"
		do
			-- 			-- Remove the `first' element of the collection.
			-- 			--
			-- 			-- See also `remove_last', `remove', `remove_head'.
			-- 		require
			-- 			not is_empty
			-- 		deferred
			-- 		ensure
			-- 			count = old count - 1
			-- 			lower = old lower + 1 xor upper = old upper - 1
		end

	remove_head (n: INTEGER) is
		obsolete "Unimplemented!"
		do
			-- 			-- Remove the `n' elements of the collection.
			-- 			--
			-- 			-- See also `remove_tail', `remove', `remove_first'.
			-- 		require
			-- 			n > 0 and n <= count
			-- 		deferred
			-- 		ensure
			-- 			count = old count - n
			-- 			lower = old lower + n xor upper = old upper - n
		end

	remove (index: INTEGER) is
		obsolete "Unimplemented!"
		do
			-- 			-- Remove the item at position `index'. Followings items are shifted left by one position.
			-- 			--
			-- 			-- See also `remove_first', `remove_head', `remove_tail', `remove_last'.
			-- 		require
			-- 			valid_index(index)
			-- 		deferred
			-- 		ensure
			-- 			count = old count - 1
			-- 			upper = old upper - 1
		end

	remove_last is
		obsolete "Unimplemented!"
		do
			-- 			-- Remove the `last' item.
			-- 			--
			-- 			-- See also `remove_first', `remove', `remove_tail'.
			-- 		require
			-- 			not is_empty
			-- 		deferred
			-- 		ensure
			-- 			count = old count - 1
			-- 			upper = old upper - 1
		end

	remove_tail (n: INTEGER) is
		obsolete "Unimplemented!"
		do
			-- 			-- Remove the last `n' item(s).
			-- 			--
			-- 			-- See also `remove_head', `remove', `remove_last'.
			-- 		require
			-- 			n > 0 and n <= count
			-- 		deferred
			-- 		ensure
			-- 			count = old count - n
			-- 			upper = old upper - n
		end

	clear_count is
		obsolete "Unimplemented!"
		do
			-- 			-- Discard all items (`is_empty' is True after that call). If possible, the actual implementation is
			-- 			-- supposed to keep its internal storage area in order to refill `Current' in an efficient way.
			-- 			--
			-- 			-- See also `clear_count_and_capacity'.
			-- 		deferred
			-- 		ensure
			-- 			is_empty: count = 0
		end

	clear_count_and_capacity is
		obsolete "Unimplemented!"
		do
			-- 			-- Discard all items (`is_empty' is True after that call). If possible, the actual implementation is
			-- 			-- supposed to release its internal storage area for this memory to be used by other objects.
			-- 			--
			-- 			-- See also `clear_count'.
			-- 		deferred
			-- 		ensure
			-- 			is_empty: count = 0
		end

feature {ANY} -- Looking and Searching:
	-- has (x: like item): BOOLEAN is	
	-- do
	-- 			-- Look for `x' using `is_equal' for comparison.
	-- 			--
	-- 			-- See also `fast_has', `index_of', `fast_index_of'.
	-- 		do
	-- 			Result := valid_index(first_index_of(x))
	--	end

	-- fast_has (x: like item): BOOLEAN is
	-- do
	-- 			-- Look for `x' using basic `=' for comparison.
	-- 			--
	-- 			-- See also `has', `fast_index_of', `index_of'.
	-- 		do
	-- 			Result := valid_index(fast_first_index_of(x))
	--	end

	first_index_of (element: like item): INTEGER is
		obsolete "Unimplemented!"
		do
			-- 			-- Give the index of the first occurrence of `element' using `is_equal' for comparison.
			-- 			-- Answer `upper + 1' when `element' is not inside.
			-- 			--
			-- 			-- See also `fast_first_index_of', `index_of', `last_index_of', `reverse_index_of'.
			-- 		deferred
			-- 		ensure
			-- 			definition: Result = index_of(element, lower)
		end

	index_of (element: like item; start_index: INTEGER): INTEGER is
			-- Using `is_equal' for comparison, gives the index of the
			-- first occurrence of `element' at or after
			-- `start_index'. Answer `upper + 1' when `element' when the
			-- search fail.
			
			-- See also `fast_index_of', `reverse_index_of',
			-- `first_index_of'.
		do
			from Result:=start_index
			until item(Result).is_equal(element) or else Result>upper
			loop Result:=Result+1
			end
		end

	reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
		obsolete "Unimplemented!"
		do
			-- 			-- Using `is_equal' for comparison, gives the index of the first occurrence of `element' at or before
			-- 			-- `start_index'. Search is done in reverse direction, which means from the `start_index' down to the
			-- 			-- `lower' index . Answer `lower -1' when the search fail.
			-- 			--
			-- 			-- See also `fast_reverse_index_of', `last_index_of', `index_of'.
			-- 		require
			-- 			valid_index(start_index)
			-- 		deferred
			-- 		ensure
			-- 			Result.in_range(lower - 1, start_index)
			-- 			valid_index(Result) implies item(Result).is_equal(element)
		end

	--	last_index_of (element: like item): INTEGER is
	--		do
	-- 			-- Using `is_equal' for comparison, gives the index of the last occurrence of `element' at or before
	-- 			-- `upper'. Search is done in reverse direction, which means from the `upper' down to the
	-- 			-- `lower' index . Answer `lower -1' when the search fail.
	-- 			--
	-- 			-- See also `fast_last_index_of', `reverse_index_of', `index_of'.
	-- 		do
	-- 			Result := reverse_index_of(element, upper)
	-- 		ensure
	-- 			definition: Result = reverse_index_of(element, upper)
	--	end

	fast_first_index_of (element: like item): INTEGER is
		obsolete "Unimplemented!"
		do
			-- 			-- Give the index of the first occurrence of `element' using basic `=' for comparison.
			-- 			-- Answer `upper + 1' when `element' is not inside.
			-- 			--
			-- 			-- See also `first_index_of', `last_index_of', `fast_last_index_of'.
			-- 		deferred
			-- 		ensure
			-- 			definition: Result = fast_index_of(element, lower)
		end

	fast_index_of (element: like item; start_index: INTEGER): INTEGER is
		obsolete "Unimplemented!"
		do
			-- 			-- Using basic `=' for comparison, gives the index of the first occurrence of `element' at or after
			-- 			-- `start_index'. Answer `upper + 1' when `element' when the search fail.
			-- 			--
			-- 			-- See also `index_of', `fast_reverse_index_of', `fast_first_index_of'.
			-- 		deferred
			-- 		ensure
			-- 			Result.in_range(start_index, upper + 1)
			-- 			valid_index(Result) implies element = item(Result)
		end

	fast_reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
		obsolete "Unimplemented!"
		do
			-- 			-- Using basic `=' comparison, gives the index of the first occurrence of `element' at or before
			-- 			-- `start_index'. Search is done in reverse direction, which means from the `start_index' down to the
			-- 			-- `lower' index . Answer `lower -1' when the search fail.
			-- 			--
			-- 			-- See also `reverse_index_of', `fast_index_of', `fast_last_index_of'.
			-- 		require
			-- 			valid_index(start_index)
			-- 		deferred
			-- 		ensure
			-- 			Result.in_range(lower - 1, start_index)
			-- 			valid_index(Result) implies item(Result) = element
		end

	-- fast_last_index_of (element: like item): INTEGER is
	-- do
	-- 			-- Using basic `=' for comparison, gives the index of the last occurrence of `element' at or before
	-- 			-- `upper'. Search is done in reverse direction, which means from the `upper' down to the
	-- 			-- `lower' index . Answer `lower -1' when the search fail.
	-- 			--
	-- 			-- See also `fast_reverse_index_of', `last_index_of'.
	-- 		do
	-- 			Result := fast_reverse_index_of(element, upper)
	-- 		ensure
	-- 			definition: Result = fast_reverse_index_of(element, upper)
	--	end

feature {ANY} -- Looking and comparison:
	is_equal (other: like Current): BOOLEAN is
			-- Do both collections have the same `lower', `upper', and items?
			-- The basic `=' is used for comparison of items.

			-- Complexity: O(count)

			-- See also `is_equal_map', `same_items'.
		local i: INTEGER
		do
			from i := lower; Result := True
			until Result=True and then i <= upper 
			loop
				Result := (Current.storage.item(i) = other.storage.item(i))
				i:=i+1
			end
		end

	is_equal_map (other: like Current): BOOLEAN is
		obsolete "Unimplemented!"
		do
			-- 			-- Do both collections have the same `lower', `upper', and
			-- 			-- items?
			-- 			feature `is_equal' is used for comparison of items.
			-- 			--
			-- 			-- See also `is_equal', `same_items'.
			-- 		deferred
			-- 		ensure
			-- 			Result implies lower = other.lower and upper = other.upper
		end

	all_default: BOOLEAN is
			-- Do all items have their type's default value?  Note: for
			-- non Void items, the test is performed with the
			-- `is_default' predicate.
			
			-- See also `clear_all'.
		local i:INTEGER
		do
			from i:=lower until Result=False or else i>upper
			loop
				Result:= (storage.item(i)=default_pointer or else
							 item(i).is_null)
				i:=i+1
			end			
		end

	-- same_items (other: COLLECTION[ITEM]): BOOLEAN is
	--		do
	-- 			-- Do both collections have the same items? The basic `=' is used
	-- 			-- for comparison of items and indices are not considered (for
	-- 			-- example this routine may yeld True with `Current' indexed in
	-- 			-- range [1..2] and `other' indexed in range [2..3]).
	-- 			--
	-- 			-- See also `is_equal_map', `is_equal'.
	-- 		require
	-- 			other /= Void
	-- 		local
	-- 			i, j: INTEGER
	-- 		do
	-- 			if count = other.count then
	-- 				from
	-- 					Result := True
	-- 					i := lower
	-- 					j := other.lower
	-- 				until
	-- 					not Result or else i > upper
	-- 				loop
	-- 					Result := item(i) = other.item(j)
	-- 					i := i + 1
	-- 					j := j + 1
	-- end
	-- end
	--		end

	occurrences (element: like item): INTEGER is
		obsolete "Unimplemented!"
		do
			-- 			-- Number of occurrences of `element' using `is_equal' for comparison.
			-- 			--
			-- 			-- See also `fast_occurrences', `index_of'.
			-- 		deferred
			-- 		ensure
			-- 			Result >= 0
		end

	fast_occurrences (element: like item): INTEGER is
		obsolete "Unimplemented!"
		do
			-- 			-- Number of occurrences of `element' using basic `=' for comparison.
			-- 			--
			-- 			-- See also `occurrences', `index_of'.
			-- 		deferred
			-- 		ensure
			-- 			Result >= 0
		end

feature {ANY} -- Agents based features:
	-- do_all (action: ROUTINE[TUPLE[ITEM]]) is
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

	-- for_all (test: PREDICATE[TUPLE[ITEM]]): BOOLEAN is
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

	-- exists (test: PREDICATE[TUPLE[ITEM]]): BOOLEAN is
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
	replace_all (old_value, new_value: like item) is
		obsolete "Unimplemented!"
		do
			-- 			-- Replace all occurrences of the element `old_value' by `new_value' using `is_equal' for comparison.
			-- 			--
			-- 			-- See also `fast_replace_all', `move'.
			-- 		deferred
			-- 		ensure
			-- 			count = old count
			-- 			not (create {SAFE_EQUAL[ITEM]}).test(old_value, new_value) implies occurrences(old_value) = 0
		end

	fast_replace_all (old_value, new_value: like item) is
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

	slice (min, max: INTEGER): like Current is
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

	reverse is
		obsolete "Unimplemented!"
		do
			-- 			-- Reverse the order of the elements.
			-- 		deferred
			-- 		ensure
			-- 			count = old count
		end

feature
	struct_size: INTEGER

	count: INTEGER is
		do
			Result:=capacity
		end

	upper: INTEGER is
		do
			Result:=count-1
		end

	lower: INTEGER is 0

	is_empty: BOOLEAN is
		do
			Result := count=0 or else storage.is_null
		end

	get_new_iterator: ITERATOR[ITEM] is
		obsolete "Unimplemented!"
		do
		end

	manifest_put (index: INTEGER_32; element: ITEM) is
		obsolete "Unimplemented!"
		do
		end

feature {C_ARRAY} -- Implementation
	storage: NATIVE_ARRAY[POINTER]

	capacity: INTEGER
end -- class C_ARRAY
