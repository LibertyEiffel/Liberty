note
	description: "."
	copyright: "[
					Copyright (C) 2008-2017: Paolo Redaelli
					
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

deferred class GLOBALLY_CACHED
	-- A wrapper for an globally cached object. Until disposed by Eiffel the
	-- wrapper registered in wrappers dictionary will be the one and only
	-- wrapper linked to the given address pointer. 

inherit
   WRAPPER
      undefine
         fill_tagged_out_memory
      redefine
         from_external_pointer
      end

insert GLOBAL_CACHE
         
feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
   from_external_pointer (a_ptr: POINTER)
		do
         Precursor (a_ptr)
         wrappers.put (Current, a_ptr)
      end

feature {}
	dispose
		do
			wrappers.remove (handle)
		end

invariant
	stored: wrappers.has(handle)
end -- class GLOBALLY_CACHED
