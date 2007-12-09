indexing
	description: "Layout Line Objects -- Represent a single line of text within a Pango Layout"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, Pango team
					
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
	date: "$Date:$"
	revision: "$Revision:$"

class PANGO_LAYOUT_LINE

inherit SHARED_C_STRUCT

insert
	PANGO_DIRECTION
	PANGO_LAYOUT_LINE_EXTERNALS
	G_OBJECT_RETRIEVER [PANGO_LAYOUT]
		rename retrieve_eiffel_wrapper_from_gobject_pointer as retrieve_layout end

creation
	from_external_pointer

feature -- Access

	layout: PANGO_LAYOUT is
			-- the parent layout for this line
		local
			layout_pointer: POINTER
		do
			layout_pointer := pango_layout_line_get_layout (handle)
			if has_eiffel_wrapper_stored (layout_pointer) then
				Result := retrieve_layout (layout_pointer)
			else
				create Result.from_external_pointer (layout_pointer)
			end
		end

	start_index: INTEGER is
			-- the start of the line as byte index into layout.text
		do
			Result := pango_layout_line_get_start_index (handle)
		end

	length: INTEGER is
			-- the length of the line in bytes
		do
			Result := pango_layout_line_get_length (handle)
		end

	is_paragraph_start: BOOLEAN is
			-- True if this is the first line of the paragraph
		do
			Result := pango_layout_line_get_is_paragraph_start (handle).to_boolean
		end

	resolved_direction: INTEGER is
			-- the resolved PANGO_DIRECTION of the line
		do
			Result := pango_layout_line_get_resolved_direction (handle)
		ensure
			is_valid_pango_direction (Result)
		end

end -- PANGO_LAYOUT_LINE
