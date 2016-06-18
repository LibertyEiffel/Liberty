note
	description: "GtkMisc -- Base class for widgets with alignments and padding."
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

deferred class GTK_MISC
	-- The GtkMisc widget is an abstract widget which is not useful
	-- itself, but is used to derive subclasses which have alignment
	-- and padding attributes.

	-- The horizontal and vertical padding attributes allows extra
	-- space to be added around the widget.

	-- The horizontal and vertical alignment attributes enable the
	-- widget to be positioned within its allocated area. Note that if
	-- the widget is added to a container in such a way that it expands
	-- automatically to fill its allocated area, the alignment settings
	-- will not alter the widgets position.

inherit
	GTK_WIDGET
		-- Implemented Interfaces: GtkMisc implements
		-- AtkImplementorIface.
	
insert GTK_MISC_EXTERNALS

-- feature {} -- size size: INTEGER is external "C inline use
-- <gtk/gtk.h>" alias "sizeof(GtkMisc)" end

feature {ANY} --
	xalign: REAL
			--	the horizontal alignment, from 0 (left) to 1 (right).
		do
			Result:=get_xalign(handle)
		ensure valid: Result.in_range (0.0,1.0)
		end

	yalign: REAL
			-- the vertical alignment, from 0 (top) to 1 (bottom).
		do
			Result:=get_yalign(handle)
		ensure valid: Result.in_range (0.0,1.0)
		end

	xpad: INTEGER
			-- the amount of space to add on the left and right of the
			-- widget, in pixels. TODO: shall be NATURAL_16
		do
			Result:=get_xpad(handle)
		ensure valid: Result>0
		end

	ypad: INTEGER
			-- the amount of space to add on the top and bottom of the widget, in pixels. TODO shall be NATURAL_16
		do
			Result:=get_ypad(handle)
		ensure valid: Result>0
		end

	set_alignment (an_xalign, an_yalign: REAL)
			-- Sets the alignment of the widget. `an_xalign0' is the
			-- horizontal alignment, from 0 (left) to 1 (right),
			-- `an_yalign' is the vertical alignment, from 0 (top) to 1
			-- (bottom).
		require
			valid_x_align: an_xalign.in_range (0.0,1.0)
			valid_y_align: an_yalign.in_range (0.0,1.0)
		do
			gtk_misc_set_alignment (handle, an_xalign, an_yalign);
		end

	set_padding (an_xpad, an_ypad: INTEGER)
			-- Sets the amount of space to add around the widget.
			-- `an_xpad' is the amount of space to add on the left and
			-- right of the widget, in pixels. `an_ypad' is the amount of
			-- space to add on the top and bottom of the widget, in
			-- pixels.
		do
			gtk_misc_set_padding (handle, an_xpad, an_ypad)
		end


	-- TODO: are gtk_misc_get_alignment and gtk_misc_get_padding to be
	-- wrapped? they seems to be another way to implement
	-- xalign,yalign, xpad and ypad. Idem for properties
	
	-- Property Details
	-- The "xalign" property
	
	--   "xalign"               gfloat                : Read / Write
	
	-- The horizontal alignment, from 0 (left) to 1 (right). Reversed for RTL layouts.

	-- Allowed values: [0,1]
	
	-- Default value: 0.5
	-- The "xpad" property
	
	--   "xpad"                 gint                  : Read / Write
	
	-- The amount of space to add on the left and right of the widget, in pixels.
	
	-- Allowed values: >= 0
	
	-- Default value: 0
	-- The "yalign" property

	--   "yalign"               gfloat                : Read / Write

	-- The vertical alignment, from 0 (top) to 1 (bottom).

	-- Allowed values: [0,1]

	-- Default value: 0.5
	-- The "ypad" property

	--   "ypad"                 gint                  : Read / Write

	-- The amount of space to add on the top and bottom of the widget, in pixels.

	-- Allowed values: >= 0

	-- Default value: 0

end
