note
	description: "Enum GtkPolicyType Determines when a scroll bar will be visible."
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

deferred class GTK_POLICY_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_policy (a_policy_type :INTEGER): BOOLEAN
		do	
			Result:=((a_policy_type = gtk_policy_always) or else
						(a_policy_type = gtk_policy_automatic) or else
						(a_policy_type = gtk_policy_never))
		end

	gtk_policy_always: INTEGER
			-- The scrollbar is always visible.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_POLICY_ALWAYS"
		end
	
	gtk_policy_automatic: INTEGER
			-- The scrollbar will appear and disappear as necessary. For
			-- example, when all of a GtkCList can not be seen.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_POLICY_AUTOMATIC"
		end
	
	gtk_policy_never: INTEGER
			-- The scrollbar will never appear.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_POLICY_NEVER"
		end
end
