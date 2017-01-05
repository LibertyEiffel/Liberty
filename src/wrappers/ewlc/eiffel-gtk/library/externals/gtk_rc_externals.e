note
	description: "External calls for GTK_RC, GTK_RC_STYLE"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_RC_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_rc_style_new: POINTER
		external "C use <gtk/gtk.h>"
		ensure
			Result.is_not_null
		end

	gtk_rc_style_copy (other: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		ensure
			Result.is_not_null
		end

	gtk_rc_parse (a_filename: POINTER)
		require
			a_filename.is_not_null
		external "C use <gtk/gtk.h>"
		end

	gtk_rc_get_default_files: POINTER
		external "C use <gtk/gtk.h>"
		ensure
			Result.is_not_null
		end

	gtk_rc_set_default_files (some_deafult_files: POINTER)
		require
			some_deafult_files.is_not_null
		external "C use <gtk/gtk.h>"
		end

end -- class GTK_RC_EXTERNALS
