note
	description: "GtkFileChooserButton — A button to launch a file selection dialog"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team,  GTK+ team and others
					
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
	revision "$REvision:$"

class GTK_FILE_CHOOSER_BUTTON

inherit
	GTK_HBOX
		undefine
			struct_size
		end
	GTK_FILE_CHOOSER

insert
	GTK_FILE_CHOOSER_ACTION
	GTK_FILE_CHOOSER_BUTTON_EXTERNALS
		-- Implemented Interfaces
		-- GtkFileChooserButton implements GtkFileChooser and AtkImplementorIface.

create {ANY}
	from_title,
	from_external_pointer

feature {} -- Creation

	from_title (a_title: STRING; an_action: INTEGER) is
			-- Creates a new file-selecting button widget.
			-- a_title : 	the title of the browse dialog.
			-- an_action : 	the open mode for the widget.
		require
			valid_title: a_title /= Void
			is_valid_gtk_file_chooser_action (an_action)
		do
			from_external_pointer (gtk_file_chooser_button_new (a_title.to_external, an_action))
		end

-- gtk_file_chooser_button_new_with_backend ()
-- 
-- GtkWidget*  gtk_file_chooser_button_new_with_backend
--                                             (const gchar *title,
--                                              GtkFileChooserAction action,
--                                              const gchar *backend);
-- 
-- Creates a new file-selecting button widget using backend.
-- 
-- title : 	the title of the browse dialog.
-- action : 	the open mode for the widget.
-- backend : 	the name of the GtkFileSystem backend to use.
-- Returns : 	a new button widget.
-- 
-- Since 2.6
-- gtk_file_chooser_button_new_with_dialog ()
-- 
-- GtkWidget*  gtk_file_chooser_button_new_with_dialog
--                                             (GtkWidget *dialog);
-- 
-- Creates a GtkFileChooserButton widget which uses dialog as it's file-picking window. Note that dialog must be a GtkFileChooserDialog (or subclass) and must not have GTK_DIALOG_DESTROY_WITH_PARENT set.
-- 
-- dialog : 	the GtkFileChooserDialog widget to use.
-- Returns : 	a new button widget.
-- 
-- Since 2.6

feature {ANY}

	title: STRING is
			-- Retrieves the title of the browse dialog used by button.
			-- The returned value should not be modified or freed.
		do
			create Result.from_external (gtk_file_chooser_button_get_title (handle))
		end

-- gtk_file_chooser_button_set_title ()
-- 
-- void        gtk_file_chooser_button_set_title
--                                             (GtkFileChooserButton *button,
--                                              const gchar *title);
-- 
-- Modifies the title of the browse dialog used by button.
-- 
-- button : 	the button widget to modify.
-- title : 	the new browse dialog title.
-- 
-- Since 2.6
-- gtk_file_chooser_button_get_width_chars ()
-- 
-- gint        gtk_file_chooser_button_get_width_chars
--                                             (GtkFileChooserButton *button);
-- 
-- Retrieves the width in characters of the button widget's entry and/or label.
-- 
-- button : 	the button widget to examine.
-- Returns : 	an integer width (in characters) that the button will use to size itself.
-- 
-- Since 2.6
-- gtk_file_chooser_button_set_width_chars ()
-- 
-- void        gtk_file_chooser_button_set_width_chars
--                                             (GtkFileChooserButton *button,
--                                              gint n_chars);
-- 
-- Sets the width (in characters) that button will use to n_chars.
-- 
-- button : 	the button widget to examine.
-- n_chars : 	the new width, in characters.
-- 
-- Since 2.6
-- gtk_file_chooser_button_get_focus_on_click ()
-- 
-- gboolean    gtk_file_chooser_button_get_focus_on_click
--                                             (GtkFileChooserButton *button);
-- 
-- Returns whether the button grabs focus when it is clicked with the mouse. See gtk_file_chooser_button_set_focus_on_click().
-- 
-- button : 	a GtkFileChooserButton
-- Returns : 	TRUE if the button grabs focus when it is clicked with the mouse.
-- 
-- Since 2.10
-- gtk_file_chooser_button_set_focus_on_click ()
-- 
-- void        gtk_file_chooser_button_set_focus_on_click
--                                             (GtkFileChooserButton *button,
--                                              gboolean focus_on_click);
-- 
-- Sets whether the button will grab focus when it is clicked with the mouse. Making mouse clicks not grab focus is useful in places like toolbars where you don't want the keyboard focus removed from the main area of the application.
-- 
-- button : 	a GtkFileChooserButton
-- focus_on_click : 	whether the button grabs focus when clicked with the mouse
-- 
-- Since 2.10
-- Property Details
-- The "dialog" property
-- 
--   "dialog"               GtkFileChooserDialog  : Write / Construct Only
-- 
-- Instance of the GtkFileChooserDialog associated with the button.
-- 
-- Since 2.6
-- The "focus-on-click" property
-- 
--   "focus-on-click"       gboolean              : Read / Write
-- 
-- Whether the GtkFileChooserButton button grabs focus when it is clicked with the mouse.
-- 
-- Default value: TRUE
-- 
-- Since 2.10
-- The "title" property
-- 
--   "title"                gchararray            : Read / Write
-- 
-- Title to put on the GtkFileChooserDialog associated with the button.
-- 
-- Default value: "Select A File"
-- 
-- Since 2.6
-- The "width-chars" property
-- 
--   "width-chars"          gint                  : Read / Write
-- 
-- The width of the entry and label inside the button, in characters.
-- 
-- Allowed values: >= -1
-- 
-- Default value: -1
-- 
-- Since 2.6
-- See Also
-- 
-- GtkFileChooserDialog
end -- GTK_FILE_CHOOSER_BUTTON
