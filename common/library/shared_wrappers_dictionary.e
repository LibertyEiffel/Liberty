indexing
	description: "Wrappers dictionary."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli
					
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

				-- wrapper factory would be inserted into the class that 
				-- needs to use it; if multiple usage are needed it is 
				-- perhaps better to use its expanded variant, 
				-- WRAPPER_RETRIEVER. The pattern usage is more or less like 
				-- this:
				
				--  foo: FOO_WRAPPER is 
				-- 		local p: POINTER
				-- 		do
				-- 			p:= get_foo (handle)
				-- 			if wrappers.has(p) then
				-- 				Result ::= wrappers.at(p)
				-- 			else
				-- 				create Result.from_external_pointer(a_pointer)
				-- 			end
				-- 		end
				
				-- I know it is tedious, but it is the only feasible solution
				-- I was able to find.

				
deferred class SHARED_WRAPPERS_DICTIONARY

insert ANY undefine copy, is_equal, fill_tagged_out_memory end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation

	wrappers: HASHED_DICTIONARY [SHARED_C_STRUCT, POINTER] is
			-- Dictionary storing wrappers created in the program.  Key
			-- is the address (pointer) to the wrapped C structure, value
			-- is the corresponding Eiffel wrapper. This way you can get
			-- back an already-created Eiffel wrapper. Heirs of
			-- SHARED_C_STRUCT, i.e. G_OBJECT could provide alternative
			-- implementation that will not rely on this dictionary.
		once
			create {HASHED_DICTIONARY[SHARED_C_STRUCT,POINTER]}
			Result.with_capacity (100)
		end

end -- class SHARED_WRAPPERS_DICTIONARY
