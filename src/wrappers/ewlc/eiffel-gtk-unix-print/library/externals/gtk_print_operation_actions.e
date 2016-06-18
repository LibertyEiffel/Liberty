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

deferred class GTK_PRINT_OPERATION_ACTIONS
	--   The action parameter given to GTK_PRINT_OPERATION's `run' that
	--   determines what action the print operation should perform.

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_gtk_print_operatio_action (an_action: INTEGER): BOOLEAN
		do	
			Result:=((an_action = gtk_print_operation_action_print_dialog) or else
						(an_action = gtk_print_operation_action_print) or else
						(an_action = gtk_print_operation_action_preview) or else
						(an_action = gtk_print_operation_action_export))
		end
	
	gtk_print_operation_action_print_dialog: INTEGER
				-- Show the print dialog.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG"
		end

	gtk_print_operation_action_print: INTEGER
			-- Start to print without showing the print dialog, based
			-- on the current print settings.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_OPERATION_ACTION_PRINT"
		end

	gtk_print_operation_action_preview: INTEGER
				-- Show the print preview.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_OPERATION_ACTION_PREVIEW"
		end

	gtk_print_operation_action_export: INTEGER
				-- Export to a file. This requires the export-filename
				-- property to be set.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_OPERATION_ACTION_EXPORT"
		end
end
