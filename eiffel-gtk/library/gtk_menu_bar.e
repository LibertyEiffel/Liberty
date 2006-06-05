indexing
	description: "GtkMenuBar -- A subclass widget for GtkMenuShell which holds GtkMenuItem widgets."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

-- Description

--    The GtkMenuBar is a subclass of GtkMenuShell which contains one to many
--    GtkMenuItem. The result is a standard menu bar which can hold many menu
--    items. GtkMenuBar allows for a shadow type to be set for aesthetic
--    purposes. The shadow types are defined in the
--    gtk_menu_bar_set_shadow_type function.

class GTK_MENU_BAR
inherit
	GTK_MENU_SHELL
	-- GtkMenuBar implements AtkImplementorIface.
		
creation make


feature {} -- Creation
	make is
			-- Creates the new GtkMenuBar
		do
			handle := gtk_menu_bar_new
		end
	
-- 	-----------------------------------------------------------------------

--   enum GtkPackDirection

--  typedef enum
--  {
-- 	GTK_PACK_DIRECTION_LTR,
-- 	GTK_PACK_DIRECTION_RTL,
-- 	GTK_PACK_DIRECTION_TTB,
-- 	GTK_PACK_DIRECTION_BTT
--  } GtkPackDirection;

-- 	-----------------------------------------------------------------------

--   gtk_menu_bar_set_pack_direction ()

--  void        gtk_menu_bar_set_pack_direction (GtkMenuBar *menubar,
-- 															 GtkPackDirection pack_dir);

-- 	Sets how items should be packed inside a menubar.

-- 	menubar :  a GtkMenuBar.
-- 	pack_dir : a new GtkPackDirection.

-- 	Since 2.8

-- 	-----------------------------------------------------------------------

--   gtk_menu_bar_get_pack_direction ()

--  GtkPackDirection gtk_menu_bar_get_pack_direction
-- 															(GtkMenuBar *menubar);

-- 	Retrieves the current pack direction of the menubar. See
-- 	gtk_menu_bar_set_pack_direction().

-- 	menubar : a GtkMenuBar
-- 	Returns : the pack direction

-- 	Since 2.8

-- 	-----------------------------------------------------------------------

--   gtk_menu_bar_set_child_pack_direction ()

--  void        gtk_menu_bar_set_child_pack_direction
-- 															(GtkMenuBar *menubar,
-- 															 GtkPackDirection child_pack_dir);

-- 	Sets how widgets should be packed inside the children of a menubar.

-- 	menubar :        a GtkMenuBar.
-- 	child_pack_dir : a new GtkPackDirection.

-- 	Since 2.8

-- 	-----------------------------------------------------------------------

--   gtk_menu_bar_get_child_pack_direction ()

--  GtkPackDirection gtk_menu_bar_get_child_pack_direction
-- 															(GtkMenuBar *menubar);

-- 	Retrieves the current child pack direction of the menubar. See
-- 	gtk_menu_bar_set_child_pack_direction().

-- 	menubar : a GtkMenuBar
-- 	Returns : the child pack direction

-- 	Since 2.8

-- Properties


-- 	"child-pack-direction" GtkPackDirection      : Read / Write
-- 	"pack-direction"       GtkPackDirection      : Read / Write

-- Style Properties


-- 	"internal-padding"     gint                  : Read
-- 	"shadow-type"          GtkShadowType         : Read
-- Property Details

--   The "child-pack-direction" property

-- 	"child-pack-direction" GtkPackDirection      : Read / Write

-- 	The pack direction of the menubar. It determines how the widgets
-- 	contained in child menuitems are arranged.

-- 	Default value: GTK_PACK_DIRECTION_LTR

-- 	Since 2.8

-- 	-----------------------------------------------------------------------

--   The "pack-direction" property

-- 	"pack-direction"       GtkPackDirection      : Read / Write

-- 	The pack direction of the menubar. It determines how menuitems are
-- 	arranged in the menubar.

-- 	Default value: GTK_PACK_DIRECTION_LTR

-- 	Since 2.8

-- Style Property Details

--   The "internal-padding" style property

-- 	"internal-padding"     gint                  : Read

-- 	Amount of border space between the menubar shadow and the menu items.

-- 	Allowed values: >= 0

-- 	Default value: 1

-- 	-----------------------------------------------------------------------

--   The "shadow-type" style property

-- 	"shadow-type"          GtkShadowType         : Read

-- 	Style of bevel around the menubar.

-- 	Default value: GTK_SHADOW_OUT

-- See Also

-- 	GtkMenuShell, GtkMenu, GtkMenuItem

feature -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkMenuBar)"
		end
	
feature {} -- External calls

	gtk_menu_bar_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	--  enum        GtkPackDirection;
	--  void        gtk_menu_bar_set_pack_direction (GtkMenuBar *menubar,
	-- 															 GtkPackDirection pack_dir);
	--  GtkPackDirection gtk_menu_bar_get_pack_direction
	-- 															(GtkMenuBar *menubar);
	--  void        gtk_menu_bar_set_child_pack_direction
	-- 															(GtkMenuBar *menubar,
	-- 															 GtkPackDirection child_pack_dir);
	--  GtkPackDirection gtk_menu_bar_get_child_pack_direction
	-- 															(GtkMenuBar *menubar);
end

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.

-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.

-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
