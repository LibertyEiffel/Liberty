note
	description: "Shared error for C features that supports it."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, GTK+ team
					
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

			-- TODO: this design is way too simplicistic to scale well. It also
			-- tends to make the end-user programmer write horrible code
			
deferred class SHARED_G_ERROR

inherit ANY undefine is_equal, copy end

insert POINTER_HANDLING
	
feature {ANY}
	error: G_ERROR
			-- 
		once 
			create Result.empty
		end
	
	is_successful: BOOLEAN

	has_error: BOOLEAN
		do
			Result := not is_successful
		end
		
end -- class SHARED_G_ERROR
