note
	description: "A wrapper that is a collection of other wrappers."
	copyright: "[
					Copyright (C) 2008 Paolo Redaelli
					
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

deferred class WRAPPER_COLLECTION [ITEM_->WRAPPER]
	-- A collection of wrappers. 

inherit
	WRAPPER_FACTORY[ITEM_] 
	GLOBAL_CACHE

	COLLECTION[ITEM_] 
		undefine 
			append_collection,
			clear_all,
			has,
			fast_has,
			-- fast_first_index_of,
			-- first_index_of,
			-- reverse,
			swap
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	wrapper(a_pointer: POINTER): ITEM_
			-- The wrapper for `a_pointer'. It could be newly created or
			-- retrieved from a cache, a dictionary, from the underlying
			-- object, depending on the implementation.
		deferred
		ensure then 
			not_void: Result/=Void
			cached_result: wrappers.has(a_pointer) 
		end	

invariant cache_not_void: wrappers /= Void
end -- class WRAPPER_COLLECTION
