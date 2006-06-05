indexing
	description: "Enum GtkUpdateType"
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
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_UPDATE_TYPE
feature  -- enum
	is_valid_gtk_update_type (an_update_type: INTEGER): BOOLEAN is
		do	
			Result:=((an_update_type=gtk_update_continuous) or else
						(an_update_type=gtk_update_discontinuous) or else
						(an_update_type=gtk_update_delayed))
		end

	gtk_update_continuous: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_CONTINUOUS"
		end

	gtk_update_discontinuous: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_DISCONTINUOUS"
		end

	gtk_update_delayed: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_DELAYED"
		end
end

