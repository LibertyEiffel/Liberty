note
	description: "Enum "
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

deferred class GTK_PRINT_OPERATION_RESULT
	--   A value of this type is returned by GTK_PRINT_OPERATION's `run'.
inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_gtk_print_operation_result (a_result :INTEGER): BOOLEAN
		do	
			Result:=((a_result = gtk_print_operation_result_error) or else
						(a_result = gtk_print_operation_result_apply) or else
						(a_result = gtk_print_operation_result_cancel) or else
						(a_result = gtk_print_operation_result_in_progress))
		end

	gtk_print_operation_result_error: INTEGER
				-- An error has occured.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_OPERATION_RESULT_ERROR"
		end

	gtk_print_operation_result_apply: INTEGER
				-- The print settings should be stored.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_OPERATION_RESULT_APPLY"
		end

	gtk_print_operation_result_cancel: INTEGER
				-- The print operation has been canceled, the print
				-- settings should not be stored.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_OPERATION_RESULT_CANCEL"
		end

	gtk_print_operation_result_in_progress: INTEGER
				-- The print operation is complete yet. This value will
				-- only be returned when running asynchronously.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_OPERATION_RESULT_IN_PROGRESS"
		end
end
