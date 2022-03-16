note
	description: "A wrapper that is a dictionary of other wrappers."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli
					
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

license: "LGPL v2 or later"

deferred class WRAPPER_DICTIONARY [VALUE->WRAPPER, KEY->COMPARABLE_WRAPPER]
	-- A wrapper that is a collection of other wrappers. 

	-- Contains the shared logic used in Glib G_SLIST, G_HASH_TABLE 
	-- and so on.

inherit
	DICTIONARY [VALUE,KEY]

	WRAPPER
      undefine
         fill_tagged_out_memory
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	are_items_shared: BOOLEAN
			-- Are the items contained in Currect DICTIONARY shared? If
			-- an item is not shared the underlying C structure will be
			-- freed once the Eiffel object is disposed.

	set_shared_items (a_setting: BOOLEAN)
		do
			are_items_shared:=a_setting
		ensure set: are_items_shared = a_setting
		end

	factory: WRAPPER_FACTORY[VALUE]
			-- The wrapper factory takes a pointer and returns a correct 
			-- VALUE wrapper.

invariant
	factory_not_void: factory /= Void

end -- class WRAPPER_DICTIONARY
