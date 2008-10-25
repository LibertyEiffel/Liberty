indexing
	description: "."
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

deferred class WRAPPERS_CACHE [ITEM->C_STRUCT]
	-- A cache for other wrapper.

inherit WRAPPER_HANDLER

-- insert ANY undefine copy, is_equal, fill_tagged_out_memory end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	cache: HASHED_DICTIONARY [ITEM, POINTER]
			-- Dictionary storing wrappers; Key is the address (pointer)
			-- to the wrapped C structure, value is the corresponding
			-- Eiffel wrapper. This way you can get back an
			-- already-created Eiffel wrapper. Heirs of SHARED_C_STRUCT,
			-- i.e. G_OBJECT could provide alternative implementation
			-- that will not rely on this dictionary.

end -- class WRAPPERS_CACHE

