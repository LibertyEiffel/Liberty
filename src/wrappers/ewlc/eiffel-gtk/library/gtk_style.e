note
	description: "Styles -- Functions for drawing widget parts"
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

class GTK_STYLE

	-- The C structure associated to this wrapper
	-- represents a widget's style.  As such
	-- it shouldn't be freed by our code, but
	-- shall be freed by C when the widget is freed.

inherit G_OBJECT

insert
	GTK_STATE_TYPE
	GTK_STYLE_EXTERNALS

create {ANY} from_external_pointer

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkStyle)"
		end

feature {ANY} -- Accessq
	-- Using strings for color lookups is inefficient! And it is much less
	-- efficient to search for the index of an item in an array which contains
	-- the given "pen-name" and then using it to get access the low-level C
	-- array. Not to speak of correctness. How easy is to break the contract!
	-- As easy as a mistype or much subtler as easy as issuing
	-- "states.put(2,Void)". Paolo 2008-08-01

	states: FAST_ARRAY [STRING]
		once
			Result := {FAST_ARRAY[STRING] <<"NORMAL", "ACTIVE", "PRELIGHT", "SELECTED", "INSENSITIVE">>}
		end

	background_color (a_state: STRING): GDK_COLOR
		require
			states.has (a_state)
		do
			create Result.from_external_pointer (gtk_style_get_bg (handle, states.first_index_of(a_state)))
		end

	foreground_color (a_state: STRING): GDK_COLOR
		require
			states.has (a_state)
		do
			create Result.from_external_pointer (gtk_style_get_fg (handle, states.first_index_of(a_state)))
		end

	text_color (a_state: STRING): GDK_COLOR
		require
			states.has (a_state)
		do
			create Result.from_external_pointer (gtk_style_get_text (handle, states.first_index_of(a_state)))
		end

	base_color (a_state: STRING): GDK_COLOR
		require
			states.has (a_state)
		do
			create Result.from_external_pointer (gtk_style_get_base (handle, states.first_index_of(a_state)))
		end

feature {ANY} -- Operations
	set_background_pixmap (a_pixmap: GDK_PIXMAP; a_state: INTEGER)
		require
			is_valid_gtk_state_type (a_state)
		do
			gtk_style_set_background(handle, a_pixmap.handle, a_state)
		end

end -- class GTK_STYLE
