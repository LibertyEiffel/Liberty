note
	description: "GtkHScrollbar - A horizontal scrollbar."
	copyright: "[
					Copyright (C) 2006-2018: Paolo Redaelli, GTK+ team
					
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

class GTK_HSCROLLBAR
	-- The GTK_HSCROLLBAR widget is a widget arranged horizontally
	-- creating a scrollbar. See GTK_SCROLLBAR for details on
	-- scrollbars. A GTK_ADJUSTMENT may be added to handle the
	-- adjustment of the scrollbar or it may be left Void in which case
	-- one will be created for you. See GTK_ADJUSTMENT for details.

inherit GTK_SCROLLBAR
	-- GtkHScrollbar implements AtkImplementorIface.
	
create {ANY} make, with_adjustment, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new horizontal scrollbar; a new adjustment is also created.
		do
			from_external_pointer (gtk_hscrollbar_new (default_pointer))
		end
	
	with_adjustment (an_adjustment: GTK_ADJUSTMENT)
			-- Creates a new horizontal scrollbar using `an_adjustment'.
		require
			adjustment_not_void: an_adjustment /= Void
		do
			from_external_pointer (gtk_hscrollbar_new (an_adjustment.handle))
		end

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkHSCrollbar)"
		end
	
feature {} -- External calls
	gtk_hscrollbar_new (gtk_adjustment: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
end -- class GTK_HSCROLLBAR
