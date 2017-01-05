note
	description: "Enum "
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

deferred class GTK_PRINT_ERROR

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_gtk_print_error (an_error :INTEGER): BOOLEAN
		do	
			Result:=((an_error = gtk_print_error_general) or else
						(an_error = gtk_print_error_internal_error) or else
						(an_error = gtk_print_error_nomem))
		end

	gtk_print_error_general: INTEGER
				-- GTK_PRINT_ERROR_GENERAL
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_ERROR_GENERAL"
		end

	gtk_print_error_internal_error: INTEGER
		
				-- GTK_PRINT_ERROR_INTERNAL_ERROR
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_ERROR_INTERNAL_ERROR"
		end

	gtk_print_error_nomem: INTEGER
				-- GTK_PRINT_ERROR_NOMEM
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_ERROR_NOMEM"
		end
end
