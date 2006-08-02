indexing
	description: "GtkFontSelectionDialog — A dialog box for selecting fonts."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

inherit GTK_DIALOG

insert
	GTK_FONT_SELECTION_DIALOG_EXTERNALS

-- creation make, from_external_pointer

-- feature {NONE} -- Creation

feature -- size

	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkFontSelectionDialog)"
		end

-- Synopsis
-- 
-- #include <gtk/gtk.h>
-- 
-- 
--             GtkFontSelectionDialog;
-- GtkWidget*  gtk_font_selection_dialog_new   (const gchar *title);
-- GdkFont*    gtk_font_selection_dialog_get_font
--                                             (GtkFontSelectionDialog *fsd);

feature

	font_name: STRING is
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

	set_preview_text (text: STRING) is
			-- Sets the text displayed in the preview area
		do
			gtk_font_selection_dialog_set_preview_text (handle, text.to_external)
		end

-- Implemented Interfaces
-- 
-- GtkFontSelectionDialog implements AtkImplementorIface.
-- Description
-- 
-- The GtkFontSelectionDialog widget is a dialog box for selecting a font.
-- 
-- To set the font which is initially selected, use gtk_font_selection_dialog_set_font_name().
-- 
-- To get the selected font use gtk_font_selection_dialog_get_font_name().
-- 
-- To change the text which is shown in the preview area, use gtk_font_selection_dialog_set_preview_text().
-- Details
-- GtkFontSelectionDialog
-- 
-- typedef struct {
--   GtkWidget *ok_button;
--   GtkWidget *apply_button;
--   GtkWidget *cancel_button;
-- } GtkFontSelectionDialog;
-- 
-- GtkWidget *ok_button; 	The OK button of the dialog
-- GtkWidget *apply_button; 	The Apply button of the dialog. This button is hidden by default but you can show/hide it
-- GtkWidget *cancel_button; 	The Cancel button of the dialog
-- gtk_font_selection_dialog_new ()
-- 
-- GtkWidget*  gtk_font_selection_dialog_new   (const gchar *title);
-- 
-- Creates a new GtkFontSelectionDialog.
-- title : 	the title of the dialog box.
-- Returns : 	a new GtkFontSelectionDialog.
-- gtk_font_selection_dialog_get_font ()
-- 
-- GdkFont*    gtk_font_selection_dialog_get_font
--                                             (GtkFontSelectionDialog *fsd);
-- 
-- Warning
-- 
-- gtk_font_selection_dialog_get_font is deprecated and should not be used in newly-written code.
-- 
-- Gets the currently-selected font.
-- fsd : 	a GtkFontSelectionDialog.
-- Returns : 	the currently-selected font, or NULL if no font is selected.
-- gtk_font_selection_dialog_set_font_name ()
-- 
-- gboolean    gtk_font_selection_dialog_set_font_name
--                                             (GtkFontSelectionDialog *fsd,
--                                              const gchar *fontname);
-- 
-- Sets the currently-selected font.
-- fsd : 	a GtkFontSelectionDialog.
-- fontname : 	a fontname.
-- Returns : 	TRUE if the font was found.
-- gtk_font_selection_dialog_get_preview_text ()
-- 
-- const gchar* gtk_font_selection_dialog_get_preview_text
--                                             (GtkFontSelectionDialog *fsd);
-- 
-- Gets the text displayed in the preview area.
-- fsd : 	a GtkFontSelectionDialog.
-- Returns : 	the text displayed in the preview area. This string is owned by the widget and should not be modified or freed.

end -- class GTK_FONT_SELECTION_DIALOG