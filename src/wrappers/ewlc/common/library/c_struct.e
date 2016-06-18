note
	description: "Wrapper for a generic C structure"
	copyright: "[
					(C) 2005,2008 Paolo Redaelli, Raphael Mack <mail@raphael-mack.de>
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

deferred class C_STRUCT
	-- Wrapper for a data structure implemented in C programming language.

inherit
	WRAPPER

feature {} -- Initialization

	from_external_copy (other: POINTER)
		do
			--dispose
			if other.is_not_null then
				allocate
				handle := memcpy (handle, other, struct_size)
			else
				handle := default_pointer
			end
		end

	allocate
			-- Allocate an initialized structure
		do
			handle := calloc (1, struct_size)
			if handle.is_null then raise_exception (No_more_memory) end
		ensure memory_allocated: handle.is_not_null
		end

feature {ANY} -- Copying

	copy (other: like Current)
		do
			dispose
			if other.handle.is_not_null then
				allocate
				handle := memcpy (handle, other.handle, struct_size)
			else
				handle := default_pointer
			end
		end

	is_equal (another: like Current): BOOLEAN
		do
			Result:= Current.handle = another.handle
		end

feature {} -- Access to C features

	-- struct_size should be exported to WRAPPER, to be able to check size 
	-- before copying
	struct_size: INTEGER
			-- sizeof (wrapped_structure), speaking in C. TODO: shall be a NATURAL
		deferred
		ensure positive: Result > 0 -- TODO: having NATURAL it is plainly useless
		end

feature {WRAPPER_HANDLER} -- Destroying
	free_handle
			-- release the external memory
		do
			free (handle)
			-- Note free(NULL) is a harmless non-operation.
		end

end -- class C_STRUCT
