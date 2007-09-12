indexing
	description: "GtkFileChooserButton - A button to launch a file selection dialog"
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

class GTK_FILE_CHOOSER_BUTTON

inherit
	GTK_HBOX
		redefine
			dummy_gobject,
			struct_size
		end
	
	GTK_FILE_CHOOSER

		-- Implemented Interfaces: GtkFileChooserButton implements GtkFileChooser
		-- and AtkImplementorIface.

insert
	GTK_FILE_CHOOSER_ACTION
	GTK_FILE_CHOOSER_BUTTON_EXTERNALS

creation dummy,
	from_title,
	from_external_pointer

feature {} -- Creation

	from_title (a_title: STRING; an_action: INTEGER) is
			-- Creates a new file-selecting button widget.
			-- a_title : 	the title of the browse dialog.
			-- an_action : 	the open mode for the widget.
		require
			valid_title: a_title /= Void
			valid_action: (an_action = gtk_file_chooser_action_open) or
							  (an_action = gtk_file_chooser_action_select_folder)
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

feature
	title: STRING is
			-- the title of the browse dialog used by button.
		do
			-- The returned value should not be modified or freed.
			create {CONST_STRING} Result.from_external
			(gtk_file_chooser_button_get_title (handle))
		end

	set_title (a_title: STRING) is
			-- Modifies the title of the browse dialog used by button.
		require title_not_void: a_title/=Void
		do
			gtk_file_chooser_button_set_title(handle,a_title.to_external)-- 
		ensure set: title.is_equal(a_title)
		end

	width_chars: INTEGER is
			-- the width in characters of the button widget's entry and/or label.
			-- It will be used to size the button.
		do
			Result:=gtk_file_chooser_button_get_width_chars(handle)
		ensure valid: Result >= -1
		end

	set_width_chars (a_width: INTEGER) is
			-- Sets the width (in characters) that button will use to `a_width'.
		require allowed_value: a_width >= -1
		do
			gtk_file_chooser_button_set_width_chars(handle,a_width)
		ensure set: width_chars = a_width
		end

	does_focus_on_click: BOOLEAN is
			-- Does the button grab focus when it is clicked with the mouse?
			-- Default value: True
		do
			Result:=gtk_file_chooser_button_get_focus_on_click(handle).to_boolean
		end

	set_focus_on_click (a_setting: BOOLEAN) is
			-- Sets whether the button will grab focus when it is clicked with the
			-- mouse. Making mouse clicks not grab focus is useful in places like
			-- toolbars where you don't want the keyboard focus removed from the
			-- main area of the application.
		do
			gtk_file_chooser_button_set_focus_on_click
			(handle, a_setting.to_integer)
		ensure set: does_focus_on_click = a_setting
		end

feature
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkFileChooserButton)"
		end

	dummy_gobject: POINTER is
		do
			Result:= gtk_file_chooser_button_new 
			((once "Dummy GTK_FILE_CHOOSER_BUTTON").to_external, 
			 gtk_file_chooser_action_open)
		end
end -- GTK_FILE_CHOOSER_BUTTON
