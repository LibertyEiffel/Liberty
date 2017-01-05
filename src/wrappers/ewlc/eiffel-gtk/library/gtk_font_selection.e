note
	description: "GtkFontSelection: A widget for selecting fonts."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "2.10.6"

class GTK_FONT_SELECTION
	-- The GtkFontSelection widget lists the available fonts, styles
	-- and sizes, allowing the user to select a font. It is used in the
	-- GtkFontSelectionDialog widget to provide a dialog box for
	-- selecting fonts.
	
	-- To set the font which is initially selected, use
	-- `set_font_name'.
	
	-- To get the selected font use `font_name'.
	
	-- To change the text which is shown in the preview area, use
	-- `set_preview_text'.

inherit
	GTK_VBOX
		rename
			make as make_vbox
		undefine
			struct_size
		end
		-- GtkFontSelection implements AtkImplementorIface.

insert GTK_FONT_SELECTION_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			--   Creates a new GtkFontSelection.
		do
			from_external_pointer(gtk_font_selection_new)
		end

feature {ANY}
	font_name: STRING
			-- The currently-selected font name. Note that this can be a
			-- different string than what you set with `set_font_name',
			-- as the font selection widget may normalize font names and
			-- thus return a string with a different structure. For
			-- example, "Helvetica Italic Bold 12" could be normalized to
			-- "Helvetica Bold Italic 12". Use (TODO)
			-- pango_font_description_equal() if you want to compare two
			-- font
		local ptr: POINTER
		do
			ptr:=gtk_font_selection_get_font_name(handle)
			if ptr.is_not_null then
				create Result.from_external(ptr)
				-- Note: C documentation saya that
				-- gtk_font_selection_get_font_name "returns a string with
				-- the name of the current font, or NULL if no font is
				-- selected. You must free this string with g_free()". We 
				-- isntead pass it under the Garbage Collector.
			end
		end

	successfully_set: BOOLEAN
			-- Has the last call to `set_font_name' been successful?

	set_font_name (a_font_name: STRING)
			-- Sets the currently-selected font. Note that the font
			-- selection widget needs to know the screen in which it will
			-- appear for this to work; this can be guaranteed by simply
			-- making sure that the widget is inserted in a toplevel
			-- window before you call this function.
			
			-- `a_fontname': a font name like "Helvetica 12" or "Times
			-- Bold 18"

			-- `successfully_set' will be True if the font could be set
			-- successfully; False if no such font exists or if the
			-- fontsel doesn't belong to a particular screen yet.
		require name_not_void: a_font_name /= Void
		do
			successfully_set:=(gtk_font_selection_set_font_name
									 (handle, a_font_name.to_external).to_boolean)
		end

	preview_text: CONST_STRING
			-- the text displayed in the preview area.
		do
			create Result.from_external(gtk_font_selection_get_preview_text(handle))
		end

	set_preview_text (a_text: STRING)
			-- Sets the text displayed in the preview area.
		require text_not_void: a_text /= Void
		do
			gtk_font_selection_set_preview_text(handle, a_text.to_external)
		end

	--   GtkFontSelectionDialog a dialog box which uses GtkFontSelection.

end -- class GTK_FONT_SELECTION
