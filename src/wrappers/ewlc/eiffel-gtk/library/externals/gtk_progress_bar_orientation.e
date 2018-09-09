note
	description: "Enum GtkProgressBarOrientation"
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

deferred class GTK_PROGRESS_BAR_ORIENTATION
	-- An enumeration representing possible orientations and growth
	-- directions for the visible progress bar.
	
inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_gtk_progress_bar_orientation (an_orientation :INTEGER): BOOLEAN
		do	
			Result:=((an_orientation =  gtk_progress_left_to_right) or else
						(an_orientation =  gtk_progress_right_to_left) or else
						(an_orientation =  gtk_progress_bottom_to_top) or else
						(an_orientation =  gtk_progress_top_to_bottom))
		end
	
	gtk_progress_left_to_right: INTEGER
			-- A horizontal progress bar growing from left to right.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PROGRESS_LEFT_TO_RIGHT"
		end

	gtk_progress_right_to_left: INTEGER
			-- A horizontal progress bar growing from right to left.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PROGRESS_RIGHT_TO_LEFT"
		end

	gtk_progress_bottom_to_top: INTEGER
			-- A vertical progress bar growing from bottom to top.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PROGRESS_BOTTOM_TO_TOP"
		end

	gtk_progress_top_to_bottom: INTEGER
			-- A vertical progress bar growing from top to bottom.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PROGRESS_TOP_TO_BOTTOM"
		end


end


