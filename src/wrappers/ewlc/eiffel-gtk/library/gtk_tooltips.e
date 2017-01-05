note
	description: "GtkToolItem: the base class of widgets that can be added to GtkToolbar."
	copyright: "[
					Copyright (C) 2007-2017: Soluciones Informaticas Libres S.A.,
					eiffel-libraries team, GTK+ team
					
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

class GTK_TOOLTIPS
	-- Tooltips are the messages that appear next to a widget when the mouse
	-- pointer is held over it for a short amount of time. They are especially
	-- helpful for adding more verbose descriptions of things such as buttons
	-- in a toolbar.
	
	-- An individual tooltip belongs to a group of tooltips. A group is created
	-- with a creation call to make. Every tooltip in the group can then be
	-- turned off with a call to disable() and enabled with enable().
	
	-- The length of time the user must keep the mouse over a widget before the
	-- tip is shown, can be altered with set_delay(). This is set on a
	-- 'per group of tooltips' basis.
	
	-- To assign a tip to a particular GTK_WIDGET, set_tip() is used.
	
	-- Note:
	
	-- Tooltips can only be set on widgets which have their own X window and
	-- receive enter and leave events. To check if a widget has its own window
	-- use GTK_WIDGET_NO_WINDOW(). To add a tooltip to a widget that doesn't
	-- have its own window, place the widget inside a GTK_EVENT_BOX and add a
	-- tooltip to that instead.
	
	-- The default appearance of all tooltips in a program is determined by the
	-- current GTK+ theme that the user has selected.
	
	-- Information about the tooltip (if any) associated with an arbitrary
	-- widget can be retrieved using data_get().


inherit
	GTK_OBJECT

insert
	GTK_TOOLTIPS_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation

	make
			-- Creates an empty group of tooltips. This function initialises
			-- a GtkTooltips structure. Without at least one such structure,
			-- you can not add tips to your application.
		do
			from_external_pointer (gtk_tooltips_new)
		end

feature {ANY} -- Operations

	enable
			-- Allows the user to see your tooltips as they navigate your
			-- application.
		do
			gtk_tooltips_enable (handle)
		end

	disable
			-- Causes all tooltips in tooltips to become inactive. Any widgets
			-- that have tips associated with that group will no longer display
			-- their tips until they are enabled again with enable(). 
		do
			gtk_tooltips_disable (handle)
		end

	set_delay (a_delay: INTEGER)
			-- Sets the time between the user moving the mouse over a widget and
			-- the widget's tooltip appearing.
			-- 'a_delay' is in milliseconds
		obsolete
			"gtk_tooltips_set_delay is deprecated and should not be used in newly-written code."
		require
			a_delay >= 0
		do
			gtk_tooltips_set_delay (handle, a_delay)
		end

	set_tip (a_widget: GTK_WIDGET; a_tip_text, a_tip_private: STRING)
			-- Adds a tooltip containing the message tip_text to the specified
			-- GtkWidget.
			-- 'a_widget': the GtkWidget you wish to associate the tip with.
			-- 'a_tip_text': a string containing the tip itself.
			-- 'a_tip_private': a string of any further information that may be
			-- useful if the user gets stuck.
		do
			gtk_tooltips_set_tip (handle, a_widget.handle, a_tip_text.to_external,
										 a_tip_private.to_external)
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTooltips)"
		end

end
