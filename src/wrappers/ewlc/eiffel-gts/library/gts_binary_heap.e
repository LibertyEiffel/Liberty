note
	description: "Binary heaps: efficient data structure for priority heaps."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, GTS team
					
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

 
deferred class GTS_BINARY_HEAP [ITEM -> COMPARABLE_SHARED_C_STRUCT]
	-- Binary heaps: efficient data structure for priorit heaps.

	-- The basic operations `insert_item' and `remove_top' are
	-- performed in O(log n) time. Calling `freeze', inserting elements
	-- using `insert_item' and calling `thaw' allows to build the
	-- binary heap in O(n) time.

	-- TODO: is this wrapper class really shared?
	
	-- Note: unfinished.

inherit
	SHARED_C_STRUCT
		redefine 
			dispose 
		end

insert
	GTS_BINARY_HEAP_EXTERNALS

feature {} -- Creation
	make (a_factory: WRAPPER_FACTORY[ITEM])
		require a_factory/=Void
		do
			factory := a_factory
			from_external_pointer (gts_heap_new ($comparison_function))
		end
	
feature {ANY}
	comparison_function (an_item, another: like top): INTEGER
		require
			item_not_void: an_item /= Void
			another_not_void: another /= Void
		deferred
		end

	insert_item (an_item: like top)
			-- Inserts `an_item' in the heap.
		require item_not_void: an_item /= Void
		do
			gts_heap_insert(handle, an_item.handle)
		end
	
	remove_top
			-- Removes the element at the top of the heap.
		
			-- Note: the C implementation "returns the element at the
			-- top of the heap". This is a violation of the query-command
			-- separation principle which is widely accepted and used in
			-- Eiffel design; therefore this feature has been changed to
			-- follow the principle.
		local discarded: POINTER
		do
			discarded:=gts_heap_remove_top(handle)
		ensure item_removed: count = old count - 1
		end

	top: ITEM_
			-- the element at the top of the heap.
		local p: POINTER
		do
			p:=gts_heap_top(handle)
			if p.is_not_null then
				Result := factory.wrapper(p)
		end

	freeze
			-- Freezes the heap. Any subsequent operation will not
			-- preserve the heap property. Used in conjunction with
			-- `insert_item' and `thaw' to create a heap in O(n) time.
		do
			gts_heap_freeze(handle)
		end
	
	thaw
			-- If heap has been frozen previously using `freeze', reorder
			-- it in O(n) time and unfreeze it.
		do
			gts_heap_thaw(handle)
		end

	-- TODO: foreach 

	-- void gts_heap_foreach (GtsHeap *heap, GFunc func, gpointer
	-- user_data);

	-- heap : a GtsHeap.  func : the function to call for each element
	-- in the heap. user_data : to pass to func.

	count: INTEGER
			-- the number of items in heap.

			-- TODO: Should be NATURAL, since it is a guint
		do
			Result:=gts_heap_size(handle)
		ensure non_negative: Result >= 0
		end

feature {} 
	dispose
		do
			gts_heap_destroy(handle)
		end
end -- class GTS_BINARY_HEAP
