note
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GTS_FILE_VARIABLE

inherit SHARED_C_STRUCT
	
insert
	GTS_FILE_VARIABLE_STRUCT
	GTS_TOKEN_TYPE
	
create {ANY}  make, from_external_pointer

feature {} -- Creation
	make is
		do
			allocate
		end
	
feature {ANY} 
	type: INTEGER is
		do
			Result:=get_type(handle)
		ensure is_valid_token(Result)
		end

	name: STRING is
		do
			create {CONST_STRING} Result.from_external(get_name(handle))
		end

	is_unique: BOOLEAN is
		do
			Result:=get_unique(handle).to_boolean
		end
	
	-- TODO: wrap "gpointer data" if meaningful

	is_set: BOOLEAN is
		do
			Result:=get_set(handle).to_boolean
		end

	line: INTEGER is
			-- TODO: should be NATURAL
		do
			Result:=get_line(handle)
		end

	position: INTEGER is
			-- TODO: should be NATURAL
		do
			Result:=get_pos(handle)
		end
		
end -- class  GTS_FILE_VARIABLE
