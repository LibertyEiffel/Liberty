note
	description: "Arrays of non-expanded wrappers of C data structures; it grows automatically as new elements are added."
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class G_REFERENCE_ARRAY [ITEM->C_STRUCT]
	-- Warning: this class will be soon called G_ARRAY and the "old" 
	-- G_ARRAY will become G_EXPANDED_ARRAY or something like this. 
	-- Paolo 2007-04-08
	
	-- Array of referenced C structures (i.e. non-expanded wrappers of
	-- C data structures); it grows automatically as new elements are
	-- added.

	-- Reference arrays wraps GPtrArray, similar to GArray but are used
	-- only for storing pointers, i.e. reference to other objects,
	-- speaking in Eiffel.

	-- Note: If you remove elements from the array, elements at the end
	-- of the array are moved into the space previously occupied by the
	-- removed element. This means that you should not rely on the
	-- index of particular elements remaining the same. You should also
	-- be careful when deleting elements while iterating over the
	-- array.

	-- To create an array, use `empty' or `with_capacity'.
	
	-- To add elements to a pointer array, use `add'.
	
	-- To remove elements from a pointer array, use
	-- g_ptr_array_remove(), g_ptr_array_remove_index() or
	-- g_ptr_array_remove_index_fast().
	
	-- To access an element of a pointer array, use
	-- g_ptr_array_index().

	-- To set the size of a pointer array, use g_ptr_array_set_size().
	
	-- To free a pointer array, use g_ptr_array_free().
	
	-- Example 5. Using a GPtrArray
	
	--   GPtrArray *gparray;
	--   gchar *string1 = "one", *string2 = "two", *string3 = "three";
	
	--   gparray = g_ptr_array_new ();
	--   g_ptr_array_add (gparray, (gpointer) string1);
	--   g_ptr_array_add (gparray, (gpointer) string2);
	--   g_ptr_array_add (gparray, (gpointer) string3);

	--   if (g_ptr_array_index (gparray, 0) != (gpointer) string1)
	--     g_print ("ERROR: got %p instead of %p\n",
	--              g_ptr_array_index (gparray, 0), string1);
	
	--   g_ptr_array_free (gparray, TRUE);

inherit 
	C_STRUCT 
		rename exists as struct_exists
		undefine fill_tagged_out_memory
		redefine copy, is_equal
		end

	COLLECTION [ITEM]
		redefine -- features that can be implemented in a smarter way, knowing that there is an array of pointers to wrapped features.
			fast_first_index_of,
			--fast_index_of,
			fast_last_index_of,
			has,
			fast_has,
			swap
		end
	
insert
	WRAPPER_FACTORY [ITEM] -- undefine fill_tagged_out_memory end
	G_PTR_ARRAY_EXTERNALS undefine fill_tagged_out_memory end
	
create {ANY} empty, with_capacity, from_external_pointer

feature {ANY} 
	empty is
			-- Creates a new empty array.		
		do
			from_external_pointer(g_ptr_array_new)
		ensure is_empty
		end

	with_capacity (a_size: INTEGER) is
			-- Creates a new GPtrArray with a_size preallocated. This
			-- avoids frequent reallocation, if you are going to add many
			-- pointers to the array. Note however that the size of the
			-- array is still 0.

			-- Note: `a_size' should be NATURAL
		require natural: a_size>=0
		do 
			from_external_pointer(g_ptr_array_sized_new(a_size))
		ensure is_empty
		end

feature {ANY} -- Indexing:
	lower: INTEGER_32 is 0 
		-- Minimum index.  See also `upper', `valid_index', `item'.

	upper: INTEGER_32 is 
		-- Maximum index.  See also `lower', `valid_index', `item'.
		do
			Result:=count-1
		end

feature {ANY} -- Counting:
	count: INTEGER_32 is
			-- Number of available indices See also `is_empty',
			-- `lower', `upper'. 
		do
			Result:=get_len(handle)
		end

	is_empty: BOOLEAN is
			-- Is collection empty ?  See also `count'.
		do
			Result := (count = 0)
		end

feature {ANY} -- Accessing:
	item (index: INTEGER_32): ITEM is
			-- Item at the corresponding `index'.  See also `lower',
			-- `upper', `valid_index'.
		local 
			p: POINTER; 
			npa: NATIVE_ARRAY[POINTER]
		do
			npa := npa.from_pointer(get_pdata(handle))
			p := npa.item(index)
			if p.is_not_null then
				if wrappers.has(p) then Result::=wrappers.item(p)
				else print_wrapper_factory_notice
				end
			end
		end

	first: ITEM is
			-- The very `first' item.
		do		
			Result:=item(lower)
		end

	last: ITEM is
			-- The `last' item.
			-- See also `first', `item'.
		do
			Result:=item(upper)
		end

feature {ANY}   -- Other features:
	get_new_iterator: ITERATOR[ITEM] is
		obsolete "Currently unimplemented!"
		do
			-- create {G_ARRAY_ITERATOR[ITEM]} Result.from_array(Current)
		end
feature {ANY}    -- Writing:
	put (element: ITEM; an_index: INTEGER_32) is
			-- Make `element' the item at `an_index'.  See also `lower',
			-- `upper', `valid_index', `item', `swap', `force'.
		local npa: NATIVE_ARRAY[POINTER]
		do
			npa:=npa.from_pointer(get_pdata(handle))
			npa.put(null_or(element),i)
		end
	
	swap (i1, i2: INTEGER_32) is
			-- Swap item at index `i1' with item at index `i2'.  See also
			-- `item', `put'.
		local npa: NATIVE_ARRAY[POINTER]; tmp: POINTER
		do
			-- Working at C level
			npa:=npa.from_pointer(get_pdata(handle))
			tmp := npa.item(i1)
			npa.put( npa.item(i2), i1)
			npa.put( tmp, i2)
		end

	set_all_with (v: ITEM) is
			-- Set all items with value `v'.  See also `set_slice_with'.
		local i:INTEGER
		do
			from i:=lower until i>upper
			loop put(v,i); i:=i+1
			end
		end
	
	-- set_slice_with (v: ITEM_; lower_index, upper_index: INTEGER_32) is
	-- Set all items in range [`lower_index' .. `upper_index'] with `v'.
	-- See also `set_all_with'.
	-- local i:INTEGER
	-- do
	-- from i:=lower_index until i>upper_index
	-- loop put(v,i); i:=i+1
	-- end
	-- end

	clear_all is
			-- Set every item to its default value. The `count' is not
			-- affected.  See also `clear', `all_default'.
		local i:INTEGER
		do
			from i:=lower until i>upper
			loop put(Void,i); i:=i+1
			end
		end

feature {ANY} -- Adding:
	add_first (element: ITEM) is
			-- Add a new item in first position : `count' is increased by
			-- one and all other items are shifted right.  See also
			-- `add_last', `first', `last', `add'.

			-- Note: this is an O(n) feature, with n=count. This call in 
			-- a loop makes a feature at least O(n^2) 
		local i: INTEGER
		do
			from i:=upper until i<lower loop
				put (item(i), i+1)
				i := i-1
			end
			put(element,lower)
		end

	add_last (element: ITEM) is
			-- Add a new item at the end; `count' is increased by one.
			-- See also `add_first', `last', `first', `add'.
		do
			g_ptr_array_add (handle, null_or(element))
		end

	add (element: ITEM; index: INTEGER_32) is
			-- Add a new `element' at rank `index' : `count' is increased
			-- by one and range [`index' .. `upper'] is shifted right by
			-- one position.

			-- See also `add_first', `add_last', `append_collection'.
		local i,j: INTEGER
		do
			from i:=upper; j:=upper+1 until i=index loop
				put(item(i),j)
				j:=i; i:=i-1
			end
		end

	append_collection (other: COLLECTION[ITEM]) is
			-- Append `other' to Current.  See also `add_last',
			-- `add_first', `add'.
		
			-- Complexity: O(other.count)
		local i: ITERATOR[ITEM]
		do
			i := other.get_new_iterator
			from i.start until i.is_off loop
				add_last(i.item) i.next
			end
		end

feature {ANY} -- Modification:
	force (element: E_; index: INTEGER_32) is
			-- Make `element' the item at `index', enlarging the
			-- collection if necessary (new bounds except `index' are
			-- initialized with default values).
		
			-- See also `put', `item', `swap'.
		obsolete "unimplemented!"
		do
		end

	copy (other: like Current) is
			-- Reinitialize by copying all the items of `other'.
		local i: INTEGER
		do
			-- Looping from upper to lower, so Current array is resized
			-- only one time.
			from i:=other.upper until i<other.lower loop
				force(other.item(i),i)
				i:=i-1
			end
		end

	from_collection (model: TRAVERSABLE[ITEM]) is
			-- Initialize the current object with the contents of `model'.
		local i: ITERATOR[ITEM]
		do
			from_external_pointer(g_ptr_array_sized_new(model.count))
			from i:=model.get_new_iterator; i.start until i.is_off 
			loop
				add(i.iter)
				i.next
			end
		end

feature {ANY} -- Removing:
	remove_first is
			-- Remove the `first' element of the collection.
		local removed: POINTER
		do
			removed := g_ptr_array_remove_index (handle, lower)
		end
	
	remove_head (n: INTEGER_32) is
			-- Remove the `n' elements of the collection.

			-- See also `remove_tail', `remove', `remove_first'.
		do
			g_ptr_array_remove_range(handle, lower,n)
		end
	
	remove (index: INTEGER_32) is
			-- Remove the item at position `index'. Followings items are
			-- shifted left by one position.
		
			-- See also `remove_first', `remove_head', `remove_tail',
			-- `remove_last'.
		local removed: POINTER
		do
			removed := g_ptr_array_remove_index (handle, index)
		end

	remove_last is
			-- Remove the `last' item.
		
			-- See also `remove_first', `remove', `remove_tail'.
		local removed: POINTER
		do
			removed := g_ptr_array_remove_index (handle, upper)
		end


	remove_tail (n: INTEGER_32) is
		do
			g_ptr_array_remove_range(handle, upper-n, n)
		end

	clear_count is
			-- Discard all items (`is_empty' is True after that call). If
			-- possible, the actual implementation is supposed to keep
			-- its internal storage area in order to refill `Current' in
			-- an efficient way.

			-- See also `clear_count_and_capacity'.
		do
			set_size(0)
		end
	
	clear_count_and_capacity is
			-- Discard all items (`is_empty' is True after that call). If
			-- possible, the actual implementation is supposed to release
			-- its internal storage area for this memory to be used by
			-- other objects.
		
			-- See also `clear_count'.
		local p: POINTER
		do
			-- Implemented freeing the old one and recreating it.
			p := g_ptr_array_free (handle, 1)
		end
	
feature {ANY} -- Looking and Searching:
	has (x: ITEM): BOOLEAN is
			-- Look for `x' using `is_equal' for comparison.

			-- See also `fast_has', `index_of', `fast_index_of'.
		local i: INTEGER
		do
			from i:=upper until Result=True or else i<lower 
			loop
				Result := x.is_equal(item(i))
				i:=i-1
			end
		end
	
	fast_has (x: ITEM): BOOLEAN is
			-- Look for `x' using basic `=' for comparison.

			-- See also `has', `fast_index_of', `index_of'.
		local i: INTEGER
		do
			from i:=upper until Result=True or else i<lower
			loop
				Result := (x.handle = g_ptr_array_index(handle,i))
				i:=i-1
			end
		end
	
--    first_index_of (element: ITEM): INTEGER_32 is
-- 			-- Give the index of the first occurrence of `element' using
-- 			-- `is_equal' for comparison.  Answer `upper + 1' when
-- 			-- `element' is not inside.

-- 			-- See also `fast_first_index_of', `index_of', `last_index_of', 
-- 			-- `reverse_index_of'.
-- 		local i: INTEGER_32; found: BOOLEAN
-- 		do
-- 			from i:=lower until found or else i>upper
-- 			loop
-- 				if element.is_equal(item(i)) then
-- 					Result:=i; found := True
-- 				end
-- 				i := i+1
-- 			end
-- 		end

--    index_of (element: ITEM; start_index: INTEGER_32): INTEGER_32 is
-- 			-- Using `is_equal' for comparison, gives the index of the
-- 			-- first occurrence of `element' at or after
-- 			-- `start_index'. Answer `upper + 1' when `element' when the
-- 			-- search fail.

-- 			-- See also `fast_index_of', `reverse_index_of',
-- 			-- `first_index_of'.
-- 		local i: INTEGER_32; found: BOOLEAN
-- 		do
-- 			from i:=start_index until found or else i>upper
-- 			loop
-- 				if element.is_equal(item(i)) then
-- 					Result:=i; found := True
-- 				end
-- 				i := i+1
-- 			end
-- 		end
			
-- 	reverse_index_of (element: ITEM; start_index: INTEGER_32): INTEGER_32 is
-- 			-- Using `is_equal' for comparison, gives the index of the
-- 			-- first occurrence of `element' at or before
-- 			-- `start_index'. Search is done in reverse direction, which
-- 			-- means from the `start_index' down to the `lower' index
-- 			-- . Answer `lower -1' when the search fail.
		
-- 			-- See also `fast_reverse_index_of', `last_index_of', 
-- 			-- `index_of'.
-- 		local i: INTEGER_32; found: BOOLEAN
-- 		do
-- 			from i:=start_index until found or else i<lower
-- 			loop
-- 				if element.is_equal(item(i)) then
-- 					Result:=i; found := True
-- 				end
-- 				i := i-1
-- 			end
-- 		end

--    last_index_of (element: ITEM): INTEGER_32 is
-- 			-- Using `is_equal' for comparison, gives the index of the
-- 			-- last occurrence of `element' at or before `upper'. Search
-- 			-- is done in reverse direction, which means from the `upper'
-- 			-- down to the `lower' index . Answer `lower -1' when the
-- 			-- search fail.
		
-- 			-- See also `fast_last_index_of', `reverse_index_of', `index_of'.
-- 		local i: INTEGER_32; found: BOOLEAN
-- 		do
-- 			from i:=upper until found or else i<lower
-- 			loop
-- 				if element.is_equal(item(i)) then
-- 					Result:=i; found := True
-- 				end
-- 				i := i-1
-- 			end
-- 		end

	fast_first_index_of (element: ITEM): INTEGER_32 is
			-- Give the index of the first occurrence of `element' using
			-- basic `=' for comparison.  Answer `upper + 1' when
			-- `element' is not inside.
		
			-- See also `first_index_of', `last_index_of', `fast_last_index_of'.
		local i: INTEGER_32; found: BOOLEAN
		do
			from i:=lower until found or else i>upper
			loop
				if element.handle = g_ptr_array_index(handle,i) then
					Result:=i; found:=True
				end
				i := i-1
			end
		end
		
	fast_index_of (element: ITEM; start_index: INTEGER_32): INTEGER_32 is
			-- Using basic `=' for comparison, gives the index of the
			-- first occurrence of `element' at or after
			-- `start_index'. Answer `upper + 1' when `element' when the
			-- search fail.
			
			-- See also `index_of', `fast_reverse_index_of',
			-- `fast_first_index_of'.
		local i: INTEGER_32; found: BOOLEAN
		do
			from i:=start_index until found or else i>upper
			loop
				if element.handle = g_ptr_array_index(handle,i) then
					Result:=i; found:=True
				end
				i := i+1
			end
		end

	fast_reverse_index_of (element: ITEM; start_index: INTEGER_32): INTEGER_32 is
			-- Using basic `=' comparison, gives the index of the first
			-- occurrence of `element' at or before `start_index'. Search
			-- is done in reverse direction, which means from the
			-- `start_index' down to the `lower' index . Answer `lower
			-- -1' when the search fail.
		
			-- See also `reverse_index_of', `fast_index_of', `fast_last_index_of'.
		local i: INTEGER_32; found: BOOLEAN
		do
			from i:=start_index until found or else i<lower
			loop
				if element.handle = g_ptr_array_index(handle,i) then
					Result:=i; found:=True
				end
				i := i-1
			end
		end

	fast_last_index_of (element: ITEM): INTEGER_32 is
			-- Using basic `=' for comparison, gives the index of the
			-- last occurrence of `element' at or before `upper'. Search
			-- is done in reverse direction, which means from the `upper'
			-- down to the `lower' index . Answer `lower -1' when the
			-- search fail.
		local i: INTEGER_32; found: BOOLEAN
		do
			from i:=upper until found or else i<lower
			loop
				if element.handle = g_ptr_array_index(handle,i) then
					Result:=i; found:=True
				end
				i := i-1
			end
		end

feature {ANY} -- Looking and comparison:
	is_equal (other: like Current): BOOLEAN is
			-- Do both collections have the same `lower', `upper', and items?
			-- The basic `=' is used for comparison of items.

			-- See also `is_equal_map', `same_items'.
		local i: INTEGER_32
		do
			if     lower/=other.lower then Result:=False -- this shouldn't be strictly necessary
			elseif upper/=other.upper then Result:=False -- this shouldn't be strictly necessary
			else
				from Result:=True; i:=upper until Result=False or else i<lower
				loop
					if element.handle /= g_ptr_array_index(handle,i) then
						Result:=False
					end
					i := i-1
				end
			end
		end

	is_equal_map (other: like Current): BOOLEAN is
			-- Do both collections have the same `lower', `upper', and
			-- items?  Feature `is_equal' is used for comparison of
			-- items.

			-- See also `is_equal', `same_items'.
		local i: INTEGER_32
		do
			if     lower/=other.lower then Result:=False -- this shouldn't be strictly necessary
			elseif upper/=other.upper then Result:=False -- this shouldn't be strictly necessary
			else
				from Result:=True; i:=upper until Result=False or else i<lower
				loop
					if not element.is_equal(item(i)) then Result:=False end
					i := i-1
				end
			end
		end

	all_default: BOOLEAN is
			-- Are all items Void?
		local i: INTEGER_32
		do
			from Result:=True; i:=upper until Result=False or else i<lower
			loop
				if g_ptr_array_index(handle,i).is_not_null then Result:=False end
				i := i-1
			end
		end

	same_items (other: COLLECTION[ITEM]): BOOLEAN is
			-- Do both collections have the same items? The basic `=' is used
			-- for comparison of items and indices are not considered (for
			-- example this routine may yeld True with `Current' indexed in
			-- range [1..2] and `other' indexed in range [2..3]).

			-- See also `is_equal_map', `is_equal'.
		local i, oi: ITERATOR[ITEM]
		do
			if count = other.count then
				from
					i  := get_new_iterator; i.start
					oi := get_new_iterator; oi.start
				until Result=False or else (i.is_off or oi.is_off)
				loop
					if i.item/=oi.item then Result:=False end
					i.next; oi.next
				end
			else Result:=False
			end
		end
		
	occurrences (element: ITEM): INTEGER_32 is
			-- Number of occurrences of `element' using `is_equal' for comparison.
		
			-- See also `fast_occurrences', `index_of'.
		local i: INTEGER_32
		do
			from i:=upper until i<lower
			loop
				if element.is_equal(item(i)) then Result:=Result+1 end
				i:=i-1
			end
		end
	
	fast_occurrences (element: ITEM): INTEGER_32 is
			-- Number of occurrences of `element' using basic `=' for comparison.
		
			-- See also `occurrences', `index_of'.
		local i: INTEGER_32
		do
			from i:=upper until i<lower
			loop
				if (element.handle=g_ptr_array_index(handle,i)) then Result:=Result+1 end
				i:=i-1
			end
		end
	

feature {ANY} -- Agents based features:
	--    do_all (action: ROUTINE[TUPLE[ANY]]) is
	-- 			-- Apply `action' to every item of `Current'.
		
	-- 			-- See also `for_all', `exists'.
	--       require
	--          action /= Void
	--    for_all (test: FUNCTION[TUPLE[ANY], BOOLEAN]): BOOLEAN
	--       -- Do all items satisfy `test'?
	--       --
	--       -- See also `do_all', `exists'.
	--       require
	--          test /= Void
	--    exists (test: FUNCTION[TUPLE[ANY], BOOLEAN]): BOOLEAN
	--       -- Does at least one item satisfy `test'?
	--       --
	--       -- See also `do_all', `for_all'.
	--       require
	--          test /= Void
	-- feature(s) from COLLECTION
	--    -- Other features:
	--    replace_all (old_value, new_value: ITEM)
	--       -- Replace all occurrences of the element `old_value' by `new_value' using `is_equal' for comparison.
	--       --
	--       -- See also `fast_replace_all', `move'.
	--       ensure
	--          count = old count;
	--          not (create {SAFE_EQUAL[ITEM]}default_create).test(old_value, new_value) implies occurrences(old_value) = 0
	--    fast_replace_all (old_value, new_value: ITEM)
	--       -- Replace all occurrences of the element `old_value' by `new_value' using basic `=' for comparison.
	--       --
	--       -- See also `replace_all', `move'.
	--       ensure
	--          count = old count;
	--          old_value /= new_value implies fast_occurrences(old_value) = 0
	--    move (lower_index, upper_index, distance: INTEGER_32)
	--       -- Move range `lower_index' .. `upper_index' by `distance' positions.
	--       --	Negative distance moves towards lower indices.
	--       -- Free places get default values.
	--       --
	--       -- See also `slice', `replace_all'.
	--       require
	--          lower_index <= upper_index;
	--          valid_index(lower_index);
	--          valid_index(lower_index + distance);
	--          valid_index(upper_index);
	--          valid_index(upper_index + distance)
	--       ensure
	--          count = old count
	--    slice (min, max: INTEGER_32): like Current
	--       -- New collection consisting of items at indexes in [`min'..`max'].
	--       -- Result has the same dynamic type as `Current'.
	--       -- The `lower' index of the `Result' is the same as `lower'.
	--       --
	--       -- See also `from_collection', `move', `replace_all'.
	--       require
	--          lower <= min;
	--          max <= upper;
	--          min <= max + 1
	--       ensure
	--          same_dynamic_type(Result);
	--          Result.count = max - min + 1;
	--          Result.lower = lower
	--    reverse
	--       -- Reverse the order of the elements.
	--       ensure
	--          count = old count

	set_count (a_length: INTEGER) is
			-- Sets the size of the array, expanding it if necessary. New
			-- elements are set to Void.
			require natural: a_length >= 0
		do
			g_ptr_array_set_size(handle, a_length)
		ensure set: count=a_length
		end

feature {ANY} -- Unwrapped code

-- g_ptr_array_remove ()

-- gboolean    g_ptr_array_remove              (GPtrArray *array,
--                                              gpointer data);

-- Removes the first occurrence of the given pointer from the pointer array. The following elements are moved down one place.

-- It returns TRUE if the pointer was removed, or FALSE if the pointer was not found.
-- array : 	a GPtrArray.
-- data : 	the pointer to remove.
-- Returns : 	TRUE if the pointer is removed. FALSE if the pointer is not found in the array.
-- g_ptr_array_remove_index ()

-- gpointer    g_ptr_array_remove_index        (GPtrArray *array,
--                                              guint index_);

-- Removes the pointer at the given index from the pointer array. The following elements are moved down one place.
-- array : 	a GPtrArray.
-- index_ : 	the index of the pointer to remove.
-- Returns : 	the pointer which was removed.
-- g_ptr_array_remove_fast ()

-- gboolean    g_ptr_array_remove_fast         (GPtrArray *array,
--                                              gpointer data);

-- Removes the first occurrence of the given pointer from the pointer array. The last element in the array is used to fill in the space, so this function does not preserve the order of the array. But it is faster than g_ptr_array_remove().

-- It returns TRUE if the pointer was removed, or FALSE if the pointer was not found.
-- array : 	a GPtrArray.
-- data : 	the pointer to remove.
-- Returns : 	TRUE if the pointer was found in the array.
-- g_ptr_array_remove_index_fast ()

-- gpointer    g_ptr_array_remove_index_fast   (GPtrArray *array,
--                                              guint index_);

-- Removes the pointer at the given index from the pointer array. The last element in the array is used to fill in the space, so this function does not preserve the order of the array. But it is faster than g_ptr_array_remove_index().
-- array : 	a GPtrArray.
-- index_ : 	the index of the pointer to remove.
-- Returns : 	the pointer which was removed.
-- g_ptr_array_remove_range ()

-- void        g_ptr_array_remove_range        (GPtrArray *array,
--                                              guint index_,
--                                              guint length);

-- Removes the given number of pointers starting at the given index from a GPtrArray. The following elements are moved to close the gap.
-- array : 	a GPtrArray.
-- index_ : 	the index of the first pointer to remove.
-- length : 	the number of pointers to remove.

-- Since 2.4
-- g_ptr_array_sort ()

-- void        g_ptr_array_sort                (GPtrArray *array,
--                                              GCompareFunc compare_func);

-- Sorts the array, using compare_func which should be a qsort()-style comparison function (returns -1 for first arg is less than second arg, 0 for equal, 1 if first arg is greater than second arg).
-- Note

-- The comparison function for g_ptr_array_sort() doesn't take the pointers from the array as arguments, it takes pointers to the pointers in the array.
-- array : 	a GPtrArray.
-- compare_func : 	comparison function.
-- g_ptr_array_sort_with_data ()

-- void        g_ptr_array_sort_with_data      (GPtrArray *array,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);

-- Like g_ptr_array_sort(), but the comparison function has a user data argument.
-- Note

-- The comparison function for g_ptr_array_sort_with_data() doesn't take the pointers from the array as arguments, it takes pointers to the pointers in the array.
-- array : 	a GPtrArray.
-- compare_func : 	comparison function.
-- user_data : 	data to pass to compare_func.

-- g_ptr_array_index()

-- #define     g_ptr_array_index(array,index_)

-- Returns the pointer at the given index of the pointer array.
-- array : 	a GPtrArray.
-- index_ : 	the index of the pointer to return.
-- Returns : 	the pointer at the given index.
-- g_ptr_array_free ()

-- gpointer*   g_ptr_array_free                (GPtrArray *array,
--                                              gboolean free_seg);

-- Frees all of the memory allocated for the pointer array.
-- array : 	a GPtrArray.
-- free_seg : 	if TRUE the array of pointers (pdata) is freed.
-- Returns : 	NULL if free_seg is TRUE, otherwise the array of pointers (pdata) is returned.
-- g_ptr_array_foreach ()

-- void        g_ptr_array_foreach             (GPtrArray *array,
--                                              GFunc func,
--                                              gpointer user_data);

-- Calls a function for each element of a GPtrArray.

-- array : 	a GPtrArray
-- func : 	the function to call for each array element
-- user_data : 	user data to pass to the function

-- Since 2.4
end
