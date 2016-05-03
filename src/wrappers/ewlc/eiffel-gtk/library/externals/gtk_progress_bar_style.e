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

deferred class GTK_PROGRESS_BAR_STYLE
	-- An enumeration representing the styles for drawing the progress
	-- bar.
	
inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_gtk_progress_bar_style (a_style :INTEGER): BOOLEAN is
		do	
			Result:=((a_style = gtk_progress_continuous) or else
						(a_style = gtk_progress_discrete))
		end

	gtk_progress_continuous: INTEGER is
			-- The progress bar grows in a smooth, continuous manner.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PROGRESS_CONTINUOUS"
		end

	gtk_progress_discrete: INTEGER is
			-- The progress bar grows in discrete, visible blocks.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PROGRESS_DISCRETE"
		end

end
