note
	description: "GtkFileChooserWidget — File chooser widget that can be embedded in other widgets"
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

class GTK_FILE_CHOOSER_WIDGET
	-- GtkFileChooserWidget is a widget suitable for selecting files.
	-- It is the main building block of a GtkFileChooserDialog. Most
	-- applications will only need to use the latter; you can use
	-- GtkFileChooserWidget as part of a larger window if you have
	-- special needs.

	-- Note that GtkFileChooserWidget does not have any methods of its
	-- own. Instead, you should use the functions that work on a
	-- GtkFileChooser.

inherit
	--GTK_VBOX
	GTK_FILE_CHOOSER

insert
	GTK_FILE_CHOOSER_WIDGET_EXTERNALS

create {ANY}
	make,
	with_backend,
	from_external_pointer

feature {} -- Creation

	make (an_action: INTEGER)
			-- Creates a new GtkFileChooserWidget. This is a file chooser widget
			-- that can be embedded in custom windows, and it is the same widget
			-- that is used by GtkFileChooserDialog.
			-- an_action : 	Open or save mode for the widget
		require
			is_valid_gtk_file_chooser_action (an_action)
		do
			from_external_pointer (gtk_file_chooser_widget_new (an_action))
		end

	with_backend (an_action: INTEGER; backend: STRING)
			-- Creates a new GtkFileChooserWidget with a specified backend.
			-- This is especially useful if you use gtk_file_chooser_set_local_only()
			-- to allow non-local files. This is a file chooser widget that can be
			-- embedded in custom windows and it is the same widget that is
			-- used by GtkFileChooserDialog.
			-- an_action : 	Open or save mode for the widget
			-- backend : 	The name of the specific filesystem backend to use.
		require
			is_valid_gtk_file_chooser_action (an_action)
		do
			from_external_pointer (gtk_file_chooser_widget_new_with_backend (an_action, backend.to_external))
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkFileChooserWidget)"
		end
end
