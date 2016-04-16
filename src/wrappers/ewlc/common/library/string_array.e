note
	description: "An array of C strings. Wraps 'char **'."
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

class STRING_ARRAY 

	-- Note: the only implemented features are:

	-- Creation: from_external_array

	-- Accessing: item, first,last, get_new_iterator, is_empty

	-- Features implementable without making any assumption on memory 
	-- handling: reverse, swap,

	-- all the remaining features are either not yet implemented or not
	-- tested. It is debatable if such a low-level collection shall be
	-- passed to the end-user Eiffel developers or if it is better to
	-- copy its contents into a more proper Eiffel COLLECTION. The key
	-- issue for the choice is memory handling of the array and its
	-- contents. Any choice on how to implement features that changes
	-- the collection (i.e. `add', `remove_first' and so on) require to
	-- make several assumption on how memory of the container and its
	-- containee shall be handled. In this case it would be far better
	-- to use an eventual anchestor of COLLECTION that does not offer
	-- changing features. Paolo 2007-04-28

inherit
	COLLECTION [STRING]
		redefine
			swap 
		end

insert WRAPPER_HANDLER -- only to get null_or_string

create {ANY}
	-- make, with_capacity,	from_collection,
	from_external_array,
	from_external_null_array

feature {STRING_ARRAY, WRAPPER_HANDLER} -- Implementation
	-- Note: to correctly handle memory of the string array wrapper and
	-- to avoid memory leaks we maintain an updated, paraller and
	-- hidden FAST_ARRAY[STRING] that holds a reference to the strings
	-- actually retrieved; when a string is retrieved with `item' or
	-- added in any way, a reference to that string is put into such an
	-- array. So Eiffel STRINGs are created only once and their memory
	-- is handled by the garbage collector.

	storage: NATIVE_ARRAY[POINTER]
	strings: FAST_ARRAY[STRING]

feature {ANY}	-- 
	capacity: INTEGER is do Result := strings.capacity end

	lower: INTEGER is do Result := strings.lower end
	
	upper: INTEGER is do Result := strings.upper end

	count: INTEGER is do Result:= upper-lower+1 end

	is_syncronized: BOOLEAN is
		local i: INTEGER
		do
			from Result:=True; i:=upper; 
			until Result=False or else i<lower 
			loop
				Result := (storage.item(i)=strings.item(i).to_external)
				i:=i-1
			end
		end

	fill_strings is
			-- Fill the internal `strings' storage with the wrappers of
			-- the strings referred by the underlying C array.
		require strings/=Void
		local i: INTEGER; p: POINTER
		do
			from i:=upper until i<lower loop
				p:=storage.item(i)
				if p.is_not_null then 
					strings.put(create {STRING}.from_external(p),i)
				end
				i:=i-1
			end
		end

feature {} -- Creation
	from_external_array (an_array: POINTER; a_length: INTEGER) is
		require 
			array_not_null: an_array.is_not_null
			positive_length: a_length > 0
		do
			storage := storage.from_pointer (an_array)
			create strings.make(a_length)
			fill_strings
		ensure count=a_length
		end

	from_external_null_array (an_array: POINTER) is
		require 
			array_not_null: an_array.is_not_null
		local
			length: INTEGER
		do
			storage := storage.from_pointer (an_array)
			from length := 0 until
				storage.item (length).is_null
			loop length := length + 1 end
			create strings.make(length)
			fill_strings
		end

feature {ANY} -- Writing:
	put (element: like item; i: INTEGER) is
		do
			storage.put(null_or_string(element),i)
			strings.put(element,i)
		end

	swap (i1, i2: INTEGER) is
		-- local p: POINTER
		do
			not_yet_implemented 
			-- p:=storage.item(i1) storage.put(storage.item(i2),i1)
			-- storage.put(p,i2) strings.swap(i1,i2)
		end

	set_all_with (v: like item) is
		-- local i: INTEGER; p: POINTER
		do
			not_yet_implemented
			-- if v/=Void then p:=v.to_external end from i:=upper until
			-- i<lower loop storage.put(p,i) strings.put(v,i) i:=i-1 end
		end

feature {ANY} -- Accessing
	item (an_index: INTEGER): STRING is
		local p: POINTER
		do
			p:=storage.item(an_index)
			if p.is_null then 
				-- Note: theorically nothing; nevertheless we check that 
				-- storage and strings are consistent
				check strings.item(an_index) = Void end
			else
				Result:=strings.item(an_index) 
				check Result/=Void end 
				-- The following if command should be required if storage
				-- and strings are not kept synchronized: if Result=Void
				-- then create Result.from_external(p)
				-- strings.put(Result,an_index) end
			end				
		end

	get_new_iterator: ITERATOR[STRING] is
		do
			create {STRING_ARRAY_ITERATOR} Result.make(Current)
		end

	first: like item is 
		do
			Result:=item(lower)
		end

	last: like item is
		do
			Result:=item(upper)
		end

	is_empty: BOOLEAN is
		do
			Result:=strings.is_empty
		end

feature {ANY} -- Adding:
	add_first (element: like item) is
			-- Add a new item in first position : `count' is increased by
			-- one and all other items are shifted right.

			-- See also `add_last', `first', `last', `add'.

			-- Performance: O(count)
		do
			not_yet_implemented	
			-- local i, old_capacity: INTEGER do old_capacity:=capacity
			-- from i:=upper; strings.add_first(element) if
			-- old_capacity/=capacity then storage:=storage.realloc
			-- (old_capacity,capacity) end until i<=lower loop
			-- storage.put(storage.item(i),i-1) i:=i-1 end
			-- storage.put(null_or_string(element),lower)
		end

	add_last (element: like item) is
		-- local old_capacity: INTEGER
		do
			not_yet_implemented 
			-- old_capacity:=capacity strings.add_last(element) if
			-- capacity>old_capacity then storage:=storage.realloc
			-- (old_capacity,capacity) end
			-- storage.put(null_or_string(element),upper) end
		end
	
	add (element: like item; index: INTEGER) is
			-- Add a new `element' at rank `index' : `count' is increased
			-- by one and range [`index' .. `upper'] is shifted right by one position.

			-- See also `add_first', `add_last', `append_collection'.
		do		
			not_yet_implemented 
			-- local old_capacity,i: INTEGER do old_capacity:=capacity
			-- strings.add(element,index) storage:=storage.realloc
			-- (old_capacity,capacity) from i:=upper until i>=index loop
			-- storage.put(storage.item(i-1),i) i:=i-1 end
			-- storage.put(null_or_string(element),index)
		end

feature {ANY} -- Modification:
	force (element: like item; index: INTEGER) is
		--local previous_count,i: INTEGER
		do
			not_yet_implemented
			-- previous_count:=count strings.force(element,index)
			-- strings.realloc(previous_count,count) from i:=lower until
			-- i>=upper loop storage.put(storage.item(i),i+1) i:=i+1 end
		end

	copy (other: like Current) is
		do
			not_yet_implemented 
			-- local i,old_capacity: INTEGER do
			-- storage:=storage.realloc(capacity,other.capacity)
			-- strings.copy(other.strings) from i:=upper until i<lower
			-- loop storage.put(other.storage.item(i),i) i:=i-1 end
		end

	from_collection (model: COLLECTION[like item]) is
		local i: ITERATOR[like item]
		do
			not_yet_implemented 
			-- with_capacity(model.count) from i:=model.get_new_iterator;
			-- i.start until i.is_off loop add_last i.next end
		end

feature {ANY} -- Removing:
	remove_first is
		-- local i: INTEGER
		do
			not_yet_implemented 
			-- storage.remove_first(upper) strings.remove_first
		end

	remove_head (n: INTEGER) is
		-- local i,j: INTEGER
		do
			not_yet_implemented
			-- from i:=lower; j:=lower+n until j>upper loop
			-- storage.put(storage.item(j),i) i:=i+1; j:=j+1 end
			-- strings.remove_head(n)
		end

	remove (index: INTEGER) is
		-- local i: INTEGER
		do
			not_yet_implemented
			-- storage.remove(n,upper) storage.put(default_pointer,upper)
			-- strings.remove(i)
		end

	remove_last is
		do
			not_yet_implemented
			-- storage.put(default_pointer,upper) strings.remove_last
		end

	remove_tail (n: INTEGER) is
		do
			not_yet_implemented 
			-- local i: INTEGER do from i:=upper-n+1 until i>upper loop
			-- storage.put(default_pointer,i) i:=i+1 end
			-- strings.remove_tail(n)
		end

	clear_count is
		do
			not_yet_implemented 
			-- 			strings.clear_count
		end

	clear_count_and_capacity is
		do
			not_yet_implemented 
			--	strings.clear_count_and_capacity
			--	storage:=storage.calloc(capacity)
		end

feature {ANY} -- Looking and Searching:
	first_index_of (element: like item): INTEGER is
		do
			Result:=strings.first_index_of(element)
		end

	index_of (element: like item; start_index: INTEGER): INTEGER is
		do
			not_yet_implemented
		end

	reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
		do
			not_yet_implemented
		end

	fast_first_index_of (element: like item): INTEGER is
		do
			not_yet_implemented
		end

	fast_index_of (element: like item; start_index: INTEGER): INTEGER is
		do
			not_yet_implemented
		end

	fast_reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
		do
			not_yet_implemented
		end

feature {ANY} -- Looking and comparison:
	is_equal (other: like Current): BOOLEAN is
		do
			not_yet_implemented
		end

	is_equal_map (other: like Current): BOOLEAN is
		do
			not_yet_implemented
		end

	all_default: BOOLEAN is
		do
			not_yet_implemented
		end

	occurrences (element: like item): INTEGER is
		do
			not_yet_implemented
		end

	fast_occurrences (element: like item): INTEGER is
		do
			not_yet_implemented
		end


feature {ANY} -- Other features:
	replace_all (old_value, new_value: like item) is
		do
			not_yet_implemented
		end

	fast_replace_all (old_value, new_value: like item) is
		do
			not_yet_implemented
		end

	slice (min, max: INTEGER): like Current is
		do
			not_yet_implemented
		end
	
	reverse is
		local i,j: INTEGER
		do
			from i:=lower; j:=upper until i>=j loop
				swap(i,j)
				i:=i+1; j:=j-1
			end			
		end

feature {} -- Implement manifest generic creation:
	manifest_put (index: INTEGER; element: like item) is
		do
			put (element,index)
		end

invariant
	is_syncronized
end -- class STRING_ARRAY
