note
	description: "GtkEventBox -- A widget used to catch events for widgets which do not have their own window."
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

class GTK_EVENT_BOX
	-- The GtkEventBox widget is a subclass of GtkBin which also has
	-- its own window. It is useful since it allows you to catch events
	-- for widgets which do not have their own window.

inherit GTK_BIN
-- GtkEventBox implements AtkImplementorIface.

insert GTK_EVENT_BOX_EXTERNALS

create {ANY} make, from_external_pointer


feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkEventBox)"
		end

feature {} -- Creation
	make
			-- Creates a new GtkEventBox.
		do
			from_external_pointer (gtk_event_box_new)
		end

feature {ANY} -- Operations

	set_above_child(above: BOOLEAN)
			-- Set whether the event box window is positioned above the
			-- windows of its child, as opposed to below it. If the
			-- window is above, all events inside the event box will
			-- go to the event box. If the window is below, events in
			-- windows of child widgets will first got to that widget,
			-- and then to its parents.
			--
			-- The default is to keep the window below the child.
		do
			gtk_event_box_set_above_child(handle, above.to_integer)
		end

	above_child: BOOLEAN
			-- Returns whether the event box window is above or below
			-- the windows of its child. See set_above_child() for details.
		do
			Result := gtk_event_box_get_above_child (handle).to_boolean
		end

	set_visible_window (a_visible: BOOLEAN)
			-- Set whether the event box uses a visible or invisible child
			-- window. The default is to use visible windows.
			--
			-- In an invisible window event box, the window that that the
			-- event box creates is a GDK_INPUT_ONLY window, which means
			-- that it is invisible and only serves to receive events.
			--
			-- A visible window event box creates a visible (GDK_INPUT_OUTPUT)
			-- window that acts as the parent window for all the widgets
			-- contained in the event box.
			--
			-- You should generally make your event box invisible if you
			-- just want to trap events. Creating a visible window may
			-- cause artifacts that are visible to the user, especially
			-- if the user is using a theme with gradients or pixmaps.
			--
			-- The main reason to create a non input-only event box is if
			-- you want to set the background to a different color or draw
			-- on it.
			--
			-- Note: There is one unexpected issue for an invisible event
			-- box that has its window below the child. (See set_above_child)
			-- Since the input-only window is not an ancestor window of any
			-- windows that descendent widgets of the event box create,
			-- events on these windows aren't propagated up by the windowing
			-- system, but only by GTK+. The practical effect of this is if
			-- an event isn't in the event mask for the descendant window
			-- (add_events()), it won't be received by the event box.
			--
			-- This problem doesn't occur for visible event boxes, because
			-- in that case, the event box window is actually the ancestor
			-- of the descendant windows, not just at the same place on the
			-- screen.
		do
			gtk_event_box_set_visible_window(handle, a_visible.to_integer)
		end

		visible_window: BOOLEAN
				-- Returns whether the event box has a visible window.
				-- See set_visible_window() for details.
			do
				Result := gtk_event_box_get_visible_window(handle).to_boolean
			end

end
