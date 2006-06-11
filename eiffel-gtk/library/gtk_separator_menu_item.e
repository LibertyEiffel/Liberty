indexing
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

class GTK_SEPARATOR_MENU_ITEM
inherit GTK_MENU_ITEM
	
creation make

feature -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkSeparatorMenuItem)"
		end

feature {} -- Creation

--    

--    GtkSeparatorMenuItem -- A separator used in menus

-- Synopsis


--  #include <gtk/gtk.h>


--              GtkSeparatorMenuItem;
--  GtkWidget*  gtk_separator_menu_item_new     (void);



-- Object Hierarchy


--    GObject
--     +----GInitiallyUnowned
--           +----GtkObject
--                 +----GtkWidget
--                       +----GtkContainer
--                             +----GtkBin
--                                   +----GtkItem
--                                         +----GtkMenuItem
--                                               +----GtkSeparatorMenuItem

-- Implemented Interfaces

--    GtkSeparatorMenuItem implements AtkImplementorIface.

-- Description

--    The GtkSeparatorMenuItem is a separator used to group items within a menu. It displays a horizontal line
--    with a shadow to make it appear sunken into the interface.

-- Details

--   GtkSeparatorMenuItem

--  typedef struct _GtkSeparatorMenuItem GtkSeparatorMenuItem;

--    The GtkSeparatorMenuItem-struct struct contains private data only, and should be accessed using the
--    functions below.

--    ------------------------------------------------------------------------------------------------------------

--   gtk_separator_menu_item_new ()

--  GtkWidget*  gtk_separator_menu_item_new     (void);

--    Creates a new GtkSeparatorMenuItem.

--    Returns : a new GtkSeparatorMenuItem.
end
