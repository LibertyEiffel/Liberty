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

class GTK_STRING_TAG

inherit GTK_SOURCE_TAG

create {ANY} dummy, make, from_external_pointer
	
feature {} -- Creation
	make 	(an_id, a_name, a_pattern: STRING)
			-- Creates a new string tag object with `an_id', the ID for
			-- the tag; `a_name': the name of the tag,
			-- `a_starting_pattern' and
			-- `an_ending_pattern'. `end_at_line_end' indicates whether
			-- the ending pattern should be suffixed by an -- end-of-line
			-- character.
		do
			from_external_pointer
			(gtk_string_tag_new(an_id.to_external,
									  a_name.to_external,
									  a_starting_pattern.to_external,
									  an_ending_pattern.to_external,
									  end_at_line_end.to_boolean))
		end
end -- class GTK_STRING_TAG
