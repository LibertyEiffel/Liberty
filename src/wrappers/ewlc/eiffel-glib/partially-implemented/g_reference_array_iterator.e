note
	description: "."
	copyright: "[
					Copyright (C) 2007-2022: $EWLC_developer, $original_copyright_holder
					
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

class G_REFERENCE_ARRAY_ITERATOR [ITEM->C_STRUCT]

inherit
	ITERATOR[ITEM]
	WRAPPER_HANDLER

insert
	WRAPPER_FACTORY [ITEM]
	SHARED_WRAPPERS_DICTIONARY
	G_PTR_ARRAY_EXTERNALS

create {ANY} make 

feature {} -- Creation
	make (an_array: G_REFERENCE_ARRAY [ITEM])
		require array_not_void: an_array/=Void
		do
			array:=an_array
		end
	
feature {ANY}
	start
		do
			i:=array.lower
		end

	is_off: BOOLEAN
			-- Returns True when there are no more objects in the
			-- sequence.
		do
			Result := i>upper
		end

	item: ITEM
		local p: POINTER; npa: NATIVE_ARRAY[POINTER]
		do
			npa := npa.from_pointer(get_pdata(handle))
			p := npa.item(index)
			if p.is_not_null then
				if wrappers.has(p) then Result::=wrappers.item(p)
				else print_wrapper_factory_notice
				end
			end
		end

	next
		do
			i:=i+1
		end
feature {} -- Implementation
	array: G_REFERENCE_ARRAY [ITEM]
	
end --class G_REFERENCE_ARRAY_ITERATOR

