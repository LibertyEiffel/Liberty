note
	description: " enum GtkPageOrientation"
	copyright: "[
					Copyright (C) 2007 eiffel-libraries team, GTK+ team
					
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

deferred class GTK_PAGE_ORIENTATION

inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_gtk_page_orientation (an_orientation: INTEGER): BOOLEAN is
		do	
			Result:=((an_orientation=gtk_page_orientation_portrait) or else
						(an_orientation=gtk_page_orientation_landscape) or else
						(an_orientation=gtk_page_orientation_reverse_portrait) or else
						(an_orientation=gtk_page_orientation_reverse_landscape))
		end
	
	gtk_page_orientation_portrait: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PAGE_ORIENTATION_PORTRAIT"
		end

	gtk_page_orientation_landscape: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PAGE_ORIENTATION_LANDSCAPE"
		end

	gtk_page_orientation_reverse_portrait: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PAGE_ORIENTATION_REVERSE_PORTRAIT"
		end

	gtk_page_orientation_reverse_landscape: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PAGE_ORIENTATION_REVERSE_LANDSCAPE"
		end

end
