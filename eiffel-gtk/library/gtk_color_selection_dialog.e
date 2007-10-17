indexing
	description: "GtkColorSelectionDialog A standard dialog box for selecting a color."
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
	
class GTK_COLOR_SELECTION_DIALOG
	-- The GtkColorSelectionDialog provides a standard dialog which allows the
	-- user to select a color much like the GtkFileSelection provides a standard
	-- dialog for file selection.

inherit
	GTK_DIALOG
		rename make as make_dialog
		redefine
			dummy_gobject,
			struct_size
		end 
	-- TODO: AtkImplementorIface

insert
	GTK_COLOR_SELECTION_DIALOG_EXTERNALS

creation dummy, make

feature {} -- Creation
	make (a_title: STRING) is
			-- Creates a new GtkColorSelectionDialog.
		require title_not_void: a_title /= Void
		do
			from_external_pointer (gtk_color_selection_dialog_new(a_title.to_external))
		end
	
feature

	colorselection: GTK_COLOR_SELECTION is
		local
			selection_ptr: POINTER
			factory: G_OBJECT_EXPANDED_FACTORY [GTK_COLOR_SELECTION]
		do
			Result := (factory.wrapper_or_void
						  (gtk_color_selection_dialog_get_colorsel (handle)))
		end

feature {} -- GtkColorSelectionDialog struct
	
	-- typedef struct _GtkColorSelectionDialog GtkColorSelectionDialog;
	
	-- The GtkColorSelectionDialog struct contains the following
	-- fields. (These fields should be considered read-only. They
	-- should never be set by an application.)
	
	-- GtkWidget *colorsel; The GtkColorSelection widget contained
	-- within the dialog. Use this widget and its
	-- gtk_color_selection_get_current_color() function to gain access
	-- to the selected color. Connect a handler for this widget's
	-- color_changed signal to be notified when the color changes.
	
	-- GtkWidget *ok_button; The OK button widget contained within the
	-- dialog. Connect a handler for the clicked event.
	
	-- GtkWidget *cancel_button; The cancel button widget contained
	-- within the dialog. Connect a handler for the clicked event.
	
	-- GtkWidget *help_button; The help button widget contained within
	-- the dialog. Connect a handler for the clicked event.
	
feature 
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkColorSelectionDialog)"
		end

	dummy_gobject: POINTER is
		do
			Result:=(gtk_color_selection_dialog_new
						((once "Dummy GTK_COLOR_SELECTION_DIALOG").to_external))
		end
end -- class GTK_COLOR_SELECTION_DIALOG
