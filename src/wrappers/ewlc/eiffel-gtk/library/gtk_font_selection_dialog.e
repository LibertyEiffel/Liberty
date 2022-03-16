note
	description: "GtkFontSelectionDialog — A dialog box for selecting fonts."
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
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_FONT_SELECTION_DIALOG
	-- The GtkFontSelectionDialog widget is a dialog box for selecting
	-- a font.
			
	-- To set the font which is initially selected, use
	-- `set_font_name'.
			
	-- To get the selected font use `font_name'.

	-- To change the text which is shown in the preview area, use
	-- `set_preview_text'.


inherit GTK_DIALOG
	-- GtkFontSelectionDialog implements AtkImplementorIface.
	rename make as dialog_make
	redefine struct_size
	end

insert
	GTK_FONT_SELECTION_DIALOG_EXTERNALS

create {ANY} make, from_external_pointer

-- feature {} -- Creation


create {ANY} make

feature {ANY} -- Creation
	make (a_title: STRING)
			-- Creates a new GtkFontSelectionDialog.
		require
			gtk_initialized: gtk.is_initialized
			title_not_void: a_title /= Void
		do
			from_external_pointer (gtk_font_selection_dialog_new (a_title.to_external))
		end

feature {ANY}

	font_name: STRING
			-- Gets the currently-selected font name. Note that this can be a
			-- different string than what you set with `set_font_name', as the
			-- font selection widget may normalize font names and thus return
			-- a string with a different structure.
			-- For example, "Helvetica Italic Bold 12" could be normalized
			-- to "Helvetica Bold Italic 12". Use pango_font_description_equal()
			-- if you want to compare two font descriptions.
			-- Returns Void if no font was selected.
		local
			c_string: POINTER
		do
			c_string := gtk_font_selection_dialog_get_font_name (handle)
			if c_string.is_not_null then
				create Result.from_external (c_string)
			end
		end

	set_preview_text (text: STRING)
			-- Sets the text displayed in the preview area
		do
			gtk_font_selection_dialog_set_preview_text (handle, text.to_external)
		end

	set_font_name (fontname: STRING): BOOLEAN
			-- Sets the currently-selected font.
			-- Returns : True if the font was found.
		do
			Result := gtk_font_selection_dialog_set_font_name (handle, fontname.to_external).to_boolean
		end

	preview_text: STRING
			-- the text displayed in the preview area.
		do
			create Result.from_external_copy (gtk_font_selection_dialog_get_preview_text (handle))
		end

	ok_button: GTK_WIDGET
			--	The OK button of the dialog
		local factory: G_OBJECT_EXPANDED_FACTORY [GTK_WIDGET]
		do
			Result := factory.wrapper (get_ok_button(handle))
		end

	apply_button: GTK_WIDGET
			-- The Apply button of the dialog. This button is hidden by default
			-- but you can show/hide it
		local factory: G_OBJECT_EXPANDED_FACTORY [GTK_WIDGET]
		do
			Result := factory.wrapper (get_apply_button(handle))
		end
	
	cancel_button: GTK_WIDGET
			-- The Cancel button of the dialog
		local factory: G_OBJECT_EXPANDED_FACTORY [GTK_WIDGET]
		do
			Result := factory.wrapper (get_cancel_button(handle))
		end
	
feature {} -- GtkFontSelectionDialog struct

-- typedef struct {
--   GtkWidget *ok_button;
--   GtkWidget *apply_button;
--   GtkWidget *cancel_button;
-- } GtkFontSelectionDialog;

	get_ok_button (a_struct: POINTER): POINTER
		external "C struct GtkFontSelectionDialog get ok_button use <gtk/gtk.h>"
		end
	
	get_apply_button (a_struct: POINTER): POINTER
		external "C struct GtkFontSelectionDialog get apply_button use <gtk/gtk.h>"
		end
	
	get_cancel_button (a_struct: POINTER): POINTER
		external "C struct GtkFontSelectionDialog get cancel_button use <gtk/gtk.h>"
		end

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof (GtkFontSelectionDialog)"
		end

end -- class GTK_FONT_SELECTION_DIALOG
