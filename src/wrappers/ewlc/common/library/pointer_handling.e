note
	description: "Utility class to reference and dereference C pointers."
	copyright: "[
					Copyright (C) 2005-2018: Paolo Redaelli
					
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

deferred class POINTER_HANDLING

insert ANY undefine copy,is_equal,fill_tagged_out_memory end

feature {WRAPPER} -- Pointer referencing and de-referencing
	address_of (a_pointer: POINTER): POINTER
		external "C inline" 
		alias "(& ($a_pointer))"
		end

	content_of (a_pointer: POINTER): POINTER
			-- The pointer referenced by `a_pointer' which has to be a
			-- pointer to a pointer (i.e.: void **). Note: the type
			-- cannot be checked by Eiffel AFAIK. Paolo 2006-05-08q.
		external "C inline" 
		alias "(* ($a_pointer))"
		end

end -- class POINTER_HANDLING
