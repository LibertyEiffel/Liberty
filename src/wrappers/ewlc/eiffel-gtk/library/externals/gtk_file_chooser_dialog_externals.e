note
	description: "External calls for GTK_FILE_CHOOSER_DIALOG"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_FILE_CHOOSER_DIALOG_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	
	gtk_file_chooser_dialog_new (a_title, a_parent: POINTER; a_gtkfilechooseraction: INTEGER;
										  first_button_text: POINTER): POINTER
			-- Note variadic call wrapped as non variadic
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_dialog_new_with_backend  (a_title, a_parent: POINTER; a_gtkfilechooseraction: INTEGER;
															 a_backend, first_button_text: POINTER): POINTER
			-- Note variadic call wrapped as non variadic
		external "C use <gtk/gtk.h>"
		end

end
