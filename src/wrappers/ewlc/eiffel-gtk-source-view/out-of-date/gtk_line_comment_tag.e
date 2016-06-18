note
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GtkSourceView developers
					
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

	wrapped_version: "1.8.5"

class GTK_LINE_COMMENT_TAG

inherit GTK_SOURCE_TAG

create {ANY} dummy, make, from_external_pointer
	
feature {} -- Creation
	make 	(an_id, a_name, a_starting_pattern: STRING)
			-- Creates a new line comment tag object with `an_id', `a_name' and
			-- `a_starting_pattern'.
		do
			from_external_pointer(gtk_line_comment_tag_new
										 (an_id.to_external,
										  a_name.to_external,
										  a_pattern.to_external))
		end
end -- class GTK_LINE_COMMENT_TAG
