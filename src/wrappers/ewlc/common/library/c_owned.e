note
	description: "A wrapper for a C object whose memory is handled by the Eiffel library "
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

deferred class C_OWNED 
	-- A wrapper for a C object whose memory is handled by the underlying C library

inherit
   WRAPPER
      undefine
         from_external_pointer
      end
   
feature {ANY}
	dispose is
		do
			debug 
				print("Disposing a " + generating_type + "; since it is a C_OWNED object the underlying memory is handled by the C library and not freed now. From now on, the struct will not be used anymore by any Eiffel object.%N")
			end
		end
end
