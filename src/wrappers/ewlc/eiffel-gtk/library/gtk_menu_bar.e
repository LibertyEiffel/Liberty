note
	description: "GtkMenuBar -- A subclass widget for GtkMenuShell which holds GtkMenuItem widgets."
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

class GTK_MENU_BAR
	-- The GtkMenuBar is a subclass of GtkMenuShell which contains one
	-- to many GtkMenuItem. The result is a standard menu bar which can
	-- hold many menu items. GtkMenuBar allows for a shadow type to be
	-- set for aesthetic purposes. The shadow types are defined in the
	-- gtk_menu_bar_set_shadow_type function.
	
inherit
	GTK_MENU_SHELL 
		redefine 
			--make, 
			struct_size 
		end

	-- TODO: GtkMenuBar implements AtkImplementorIface.
	
insert GTK_PACK_DIRECTION
	
create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			-- Creates the new GtkMenuBar
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_menu_bar_new)
		end

feature {ANY}
	set_pack_direction (a_direction: INTEGER)
			-- 	Sets how items should be packed inside a menubar.
		require
			valid_direction: is_valid_gtk_pack_direction (a_direction)
		do
			gtk_menu_bar_set_pack_direction (handle, a_direction)
		end

	pack_direction: INTEGER
			--  the current pack direction of the menubar.
		do
			Result:= gtk_menu_bar_get_pack_direction(handle)
		ensure valid_result:is_valid_gtk_pack_direction (Result)			
		end
	
	-- TODO: provide more meaningful boolean queries like
	-- is_trl_pack_direction


	set_child_pack_direction (a_direction: INTEGER)
			-- Sets how widgets should be packed inside the children of a
			-- menubar.
		require
			valid_direction: is_valid_gtk_pack_direction (a_direction)
		do
		  gtk_menu_bar_set_child_pack_direction (handle, a_direction)
		end


	child_pack_direction: INTEGER
			-- the current child pack direction of the menubar. See
			-- `set_child_pack_direction'.
		do
			Result:= gtk_menu_bar_get_child_pack_direction (handle)
		ensure is_valid_gtk_pack_direction (Result)
		end

feature {ANY} -- Properties

	-- Note: "child-pack-direction" and "pack-direction" shall not be
	-- wrapped since there already are functions accessing them. 

feature {ANY} -- Style Properties
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

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkMenuBar)"
		end
	
feature {} -- External calls

	gtk_menu_bar_new: POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_bar_set_pack_direction (a_menubar: POINTER; a_pack_dir: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_bar_get_pack_direction (a_menubar: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_bar_set_child_pack_direction (a_menubar: POINTER; a_child_pack_dir: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_menu_bar_get_child_pack_direction (a_menubar: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
end
