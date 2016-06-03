note
	description: "GtkButtonBox: Base class for GtkHButtonBox and GtkVButtonBox."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "2.10.6"

deferred class GTK_BUTTON_BOX
	-- The primary purpose of this class is to keep track of the
	-- various properties of GtkHButtonBox and GtkVButtonBox widgets.
	
	-- `child_size' retrieves the minimum width and height for widgets
	-- in a given button box. `set_child_size'() allows those
	-- properties to be changed.
	
	-- The internal padding of buttons can be retrieved and changed per
	-- button box using `child_ipadding' and `set_child_ipadding'
	-- respectively.
	
	-- `spacing' and `set_spacing' retrieve and change default number
	-- of pixels between buttons, respectively.
	
	-- `layout' and `set_layout' retrieve and alter the method used to
	-- spread the buttons in a button box across the container,
	-- respectively.
	
	-- The main purpose of GtkButtonBox is to make sure the children
	-- have all the same size. Therefore it ignores the homogeneous
	-- property which it inherited from GtkBox, and always behaves as
	-- if homogeneous was TRUE.

inherit GTK_BOX
	--   GtkButtonBox implements AtkImplementorIface.

feature {ANY} 
	layout: INTEGER is
			-- the method used to arrange the buttons in a button box.
		do
			Result:=gtk_button_box_get_layout(handle)
		ensure valid_button_box_style: is_valid_gtk_button_box_style(Result)
		end

	is_child_secondary (a_child: GTK_WIDGET): BOOLEAN is
			-- Should `a_child' appear in a secondary group of children?
		require child_not_void: a_child/=Void
		do
			Result:=gtk_button_box_get_child_secondary(handle,a_child.handle).to_boolean
		end

	set_layout (a_style: INTEGER) is
			--   Changes the way buttons are arranged in their container.
		require valid_button_box_style: is_valid_gtk_button_box_style(a_style)
		do
			gtk_button_box_set_layout(handle, a_style)
		end

	set_child_secondary (a_child: GTK_WIDGET; a_setting: BOOLEAN) is
			-- Sets whether `a_child' should appear in a secondary group
			-- of children. A typical use of a secondary child is the
			-- help button in a dialog.
			
			-- This group appears after the other children if the style
			-- is `gtk_buttonbox_start', `gtk_buttonbox_spread' or
			-- `gtk_buttonbox_edge', and before the other children if the
			-- style is `gtk_buttonbox_end'. For horizontal button boxes,
			-- the definition of before/after depends on direction of the
			-- widget (see `set_direction'). If the style is
			-- `gtk_buttonbox_start' or `gtk_buttonbox_end', then the
			-- secondary children are aligned at the other end of the
			-- button box from the main children. For the other styles,
			-- they appear immediately next to the main children.
			
			-- If `a_setting' is True, the child appears in a secondary
			-- group of the button box.
		require child_not_void: a_child/=Void
		do
			gtk_button_box_set_child_secondary(handle,a_child.handle,a_setting.to_integer)
		end
		

feature {ANY} -- Properties
	-- Note: "layout-style" property and "secondary" child property 
	-- already have strongly typed SETTER

	--
	--Style Properties
	--
	--
	--   "child-internal-pad-x" gint                  : Read
	--   "child-internal-pad-y" gint                  : Read
	--   "child-min-height"     gint                  : Read
	--   "child-min-width"      gint                  : Read
	--Property Details
	--
	--  The "layout-style" property
	--
	--   "layout-style"         GtkButtonBoxStyle     : Read / Write
	--
	--   How to layout the buttons in the box. Possible values are default, spread,
	--   edge, start and end.
	--
	--   Default value: GTK_BUTTONBOX_DEFAULT_STYLE
	--
	--Child Property Details
	--
	--  The "secondary" child property
	--
	--   "secondary"            gboolean              : Read / Write
	--
	--   If TRUE, the child appears in a secondary group of children, suitable for,
	--   e.g., help buttons.
	--
	--   Default value: FALSE
	--
	--Style Property Details
	--
	--  The "child-internal-pad-x" style property
	--
	--   "child-internal-pad-x" gint                  : Read
	--
	--   Amount to increase child's size on either side.
	--
	--   Allowed values: >= 0
	--
	--   Default value: 4
	--
	--   --------------------------------------------------------------------------
	--
	--  The "child-internal-pad-y" style property
	--
	--   "child-internal-pad-y" gint                  : Read
	--
	--   Amount to increase child's size on the top and bottom.
	--
	--   Allowed values: >= 0
	--
	--   Default value: 0
	--
	--   --------------------------------------------------------------------------
	--
	--  The "child-min-height" style property
	--
	--   "child-min-height"     gint                  : Read
	--
	--   Minimum height of buttons inside the box.
	--
	--   Allowed values: >= 0
	--
	--   Default value: 27
	--
	--   --------------------------------------------------------------------------
	--
	--  The "child-min-width" style property
	--
	--   "child-min-width"      gint                  : Read
	--
	--   Minimum width of buttons inside the box.
	--
	--   Allowed values: >= 0
	--
	--   Default value: 85
	--
	--
feature {} -- External calls
	gtk_button_box_get_layout (a_widget: POINTER): INTEGER is
			-- GtkButtonBoxStyle gtk_button_box_get_layout (GtkButtonBox
			-- *widget);
		external "C use <gtk/gtk.h>"
		end

	gtk_button_box_get_child_secondary (a_widget, a_child: POINTER): INTEGER is
			-- gboolean gtk_button_box_get_child_secondary (GtkButtonBox
			-- *widget, GtkWidget *child);
		external "C use <gtk/gtk.h>"
		end

	gtk_button_box_set_layout (widget: POINTER; a_layout_style: INTEGER) is
			-- void gtk_button_box_set_layout (GtkButtonBox *widget,
			-- GtkButtonBoxStyle layout_style);
		external "C use <gtk/gtk.h>"
		end

	gtk_button_box_set_child_secondary (a_widget, a_child: POINTER; is_secondary_bool: INTEGER) is
			-- void gtk_button_box_set_child_secondary (GtkButtonBox
			-- *widget, GtkWidget *child, gboolean is_secondary);
		external "C use <gtk/gtk.h>"
		end
end

