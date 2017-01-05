note
	description: "A wrapper factory that "
	copyright: "[
					Copyright (C) 2006-2017: , 2007 Paolo Redaelli
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

deferred class CACHING_FACTORY [ITEM_->WRAPPER]
	-- A factory that retrieves wrappers from a cache, usually a
	-- dictionary; used to implement collection of wrapped objects

inherit
	WRAPPER_FACTORY[ITEM_]

feature {ANY} 
	wrappers: HASHED_DICTIONARY [ITEM_, POINTER]
			-- Dictionary cache storing wrappers; usually used in 
			-- WRAPPER_COLLECTIONs or WRAPPER_DICTIONARY
			-- Key is the address (pointer) to the wrapped C structure,
			-- value is the corresponding Eiffel wrapper. This way you
			-- can get back an already-created Eiffel wrapper. Heirs of
			-- SHARED_C_STRUCT, i.e. G_OBJECT could provide alternative
			-- implementation that will not rely on this dictionary.

	put (a_wrapper: ITEM_)
		require 
			wrapper_not_void: a_wrapper /= Void
			non_dummy_wrapper: a_wrapper.is_not_null
			not_already_present: 
		do
			wrappers.put(a_wrapper,a_wrapper.handle)
		ensure
         definition: wrapper(a_wrapper.handle) = a_wrapper 
		end

invariant
	dictionary_not_void: wrappers /= Void
end
