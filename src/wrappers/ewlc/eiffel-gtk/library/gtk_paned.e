note
	description: "GtkPaned: Base class for widgets with two adjustable panes."
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

deferred class GTK_PANED
	-- GtkPaned is the base class for widgets with two panes, arranged
	-- either horizontally (GtkHPaned) or vertically (GtkVPaned). Child
	-- widgets are added to the panes of the widget with `pack1' and
	-- `pack2'. The division beween the two children is set by default
	-- from the size requests of the children, but it can be adjusted
	-- by the user.

	-- A paned widget draws a separator between the two child
	-- widgets and a small handle that the user can drag to
	-- adjust the division. It does not draw any relief around
	-- the children or around the separator. (The space in which
	-- the separator is called the gutter.) Often, it is useful
	-- to put each child inside a GtkFrame with the shadow type
	-- set to `gtk_shadow_in' so that the gutter appears as a
	-- ridge.
	
	-- Each child has two options that can be set, resize and
	-- shrink. If resize is true, then when the GtkPaned is resized,
	-- that child will expand or shrink along with the paned widget. If
	-- shrink is true, then when that child can be made smaller than
	-- its requisition by the user. Setting shrink to FALSE allows the
	-- application to set a minimum size. If resize is false for both
	-- children, then this is treated as if resize is true for both
	-- children.
	
	-- The application can set the position of the slider as if it were
	-- set by the user, by calling `set_position'.

inherit
	GTK_CONTAINER 
		-- GtkPaned implements AtkImplementorIface.

insert G_OBJECT_FACTORY [GTK_WIDGET]

feature {ANY}
	add1 (a_child: GTK_WIDGET)
			-- Adds a child to the top or left pane with default
			-- parameters. This is equivalent to pack1 (a_child, False,
			-- True).
		require valid_child: a_child/=Void
		do
			gtk_paned_add1 (handle, a_child.handle)
		end

	add2 (a_child: GTK_WIDGET)
			-- Adds a child to the bottom or right pane with default
			-- parameters. This is equivalent to pack (a_child, True,
			-- True).
		require valid_child: a_child/=Void
		do
			gtk_paned_add2 (handle, a_child.handle)
		end

	pack1 (a_child: GTK_WIDGET; resize, shrink: BOOLEAN)
			-- Adds  'a_child' to the top or left pane.

			-- 'a_child': the child to add

			-- resize : should this child expand when the paned widget is
			-- resized.

			-- shrink : can this child be made smaller than its
			-- requisition.
		require valid_child: a_child/=Void
		do
			gtk_paned_pack1 (handle, a_child.handle, resize.to_integer, shrink.to_integer)
		end

	pack2 (a_child: GTK_WIDGET; resize, shrink: BOOLEAN)
			-- Adds  'a_child' to the bottom or right pane.

			-- 'a_child': the child to add

			-- resize : should this child expand when the paned widget is
			-- resized.

			-- shrink : can this child be made smaller than its
			-- requisition.
		require valid_child: a_child/=Void
		do
			gtk_paned_pack2 (handle, a_child.handle, resize.to_integer, shrink.to_integer)
		end

	child1: GTK_WIDGET
			-- The first child of the paned widget; Void if not set.
		do
			Result := wrapper_or_void(gtk_paned_get_child1(handle))
		end

	child: GTK_WIDGET
			-- The second child of the paned widget; Void if not set.
		do
			Result := wrapper_or_void(gtk_paned_get_child1(handle))
		end

feature {ANY} -- Divider position
	unset_position
			-- Unsets the position of the divider between the two panes.
		do
			gtk_paned_set_position (handle, -1)
		end

	set_position (a_position: INTEGER)
			-- Sets the position of the divider between the two panes.
		require positive_position: a_position >= 0
		do
			gtk_paned_set_position (handle, a_position)
		ensure value_set: position = a_position
		end
	
	position: INTEGER
			-- the position of the divider between the two panes.
		do
			Result := gtk_paned_get_position (handle)
		end

feature {ANY} -- Properties

--   "max-position"         gint                  : Read
--   "min-position"         gint                  : Read
--   "position"             gint                  : Read / Write
--   "position-set"         gboolean              : Read / Write

-- Child Properties

--   "resize"               gboolean              : Read / Write
--   "shrink"               gboolean              : Read / Write

-- Style Properties

--   "handle-size"          gint                  : Read

	-- The "max-position" property

--   "max-position"         gint                  : Read

-- The largest possible value for the position property. This property is derived from the size and shrinkability of the widget's children.

-- Allowed values: >= 0

-- Default value: 2147483647

-- Since 2.4
-- The "min-position" property

--   "min-position"         gint                  : Read

-- The smallest possible value for the position property. This property is derived from the size and shrinkability of the widget's children.

-- Allowed values: >= 0

-- Default value: 0

-- Since 2.4
-- The "position" property

--   "position"             gint                  : Read / Write

-- Position of paned separator in pixels (0 means all the way to the left/top).

-- Allowed values: >= 0

-- Default value: 0
-- The "position-set" property

--   "position-set"         gboolean              : Read / Write

-- TRUE if the Position property should be used.

-- Default value: FALSE
-- Child Property Details
-- The "resize" child property

--   "resize"               gboolean              : Read / Write

-- The "resize" child property determines whether the child expands and shrinks along with the paned widget.

-- Default value: TRUE

-- Since 2.4
-- The "shrink" child property

--   "shrink"               gboolean              : Read / Write

-- The "shrink" child property determines whether the child can be made smaller than its requisition.

-- Default value: TRUE

-- Since 2.4
-- Style Property Details
-- The "handle-size" style property

--   "handle-size"          gint                  : Read

-- Width of handle.

-- Allowed values: >= 0

-- Default value: 5
feature {ANY} -- Signal Details
-- The "accept-position" signal

-- gboolean    user_function                  (GtkPaned *paned,
--                                             gpointer  user_data)      : Run last / Action

-- paned : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	
-- The "cancel-position" signal

-- gboolean    user_function                  (GtkPaned *paned,
--                                             gpointer  user_data)      : Run last / Action

-- paned : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	
-- The "cycle-child-focus" signal

-- gboolean    user_function                  (GtkPaned *paned,
--                                             gboolean  arg1,
--                                             gpointer  user_data)      : Run last / Action

-- paned : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	
-- The "cycle-handle-focus" signal

-- gboolean    user_function                  (GtkPaned *paned,
--                                             gboolean  arg1,
--                                             gpointer  user_data)      : Run last / Action

-- paned : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	
-- The "move-handle" signal

-- gboolean    user_function                  (GtkPaned      *paned,
--                                             GtkScrollType *arg1,
--                                             gpointer       user_data)      : Run last / Action

-- paned : 	the object which received the signal.
-- arg1 : 	
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	
-- The "toggle-handle-focus" signal

-- gboolean    user_function                  (GtkPaned *paned,
--                                             gpointer  user_data)      : Run last / Action

-- paned : 	the object which received the signal.
-- user_data : 	user data set when the signal handler was connected.
-- Returns : 	

-- Signals

-- "accept-position"
--             gboolean    user_function      (GtkPaned *paned, gpointer  user_data)      : Run last / Action
-- "cancel-position"
--             gboolean    user_function      (GtkPaned *paned, gpointer  user_data)      : Run last / Action
-- "cycle-child-focus"
--             gboolean    user_function      (GtkPaned *paned, gboolean  arg1, gpointer  user_data)      : Run last / Action
-- "cycle-handle-focus"
--             gboolean    user_function      (GtkPaned *paned, gboolean  arg1, gpointer  user_data)      : Run last / Action
-- "move-handle"
--             gboolean    user_function      (GtkPaned      *paned, GtkScrollType *arg1, gpointer       user_data)      : Run last / Action
-- "toggle-handle-focus"
--             gboolean    user_function      (GtkPaned *paned, gpointer  user_data)      : Run last / Action

feature {} -- External calls
	gtk_paned_add1 (a_paned, a_child: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_paned_add2 (a_paned, a_child: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_paned_pack1 (a_paned, a_child: POINTER; resize, shrink: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_paned_pack2 (a_paned, a_child: POINTER; resize, shrink: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_paned_get_child1 (a_paned: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_paned_get_child2 (a_paned: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_paned_set_position (a_paned: POINTER; a_position: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_paned_get_position (a_paned: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
end
