note
	description: "."
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
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_TABLE_CHILD

inherit 
	C_STRUCT
	EIFFEL_OWNED
	-- TODO: wrap this structure for real	
create {ANY} from_external_pointer

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTableChild)"
		end

feature {} -- Creation
--   GtkTableChild

--  typedef struct {
--    GtkWidget *widget;
--    guint16 left_attach;
--    guint16 right_attach;
--    guint16 top_attach;
--    guint16 bottom_attach;
--    guint16 xpadding;
--    guint16 ypadding;
--    guint xexpand : 1;
--    guint yexpand : 1;
--    guint xshrink : 1;
--    guint yshrink : 1;
--    guint xfill : 1;
--    guint yfill : 1;
--  } GtkTableChild;

--    The widget field is a pointer to the widget that this GtkTableChild
--    structure is keeping track of. The left_attach, right_attach, top_attach,
--    and bottom_attach fields specify the row and column numbers which make up
--    the invisible rectangle that the child widget is packed into.

--    xpadding and ypadding specify the space between this widget and the
--    surrounding table cells.

end
