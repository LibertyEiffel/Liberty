indexing
	description: "GtkMisc -- Base class for widgets with alignments and padding."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
-- Description

-- The GtkMisc widget is an abstract widget which is not useful itself, but is used to derive subclasses which have alignment and padding attributes.

-- The horizontal and vertical padding attributes allows extra space to be added around the widget.

-- The horizontal and vertical alignment attributes enable the widget to be positioned within its allocated area. Note that if the widget is added to a container in such a way that it expands automatically to fill its allocated area, the alignment settings will not alter the widgets position.

deferred class GTK_MISC
inherit
	GTK_WIDGET 
		-- Implemented Interfaces: GtkMisc implements
		-- AtkImplementorIface.
	GTK_MISC_EXTERNALS

-- feature {NONE} -- size size: INTEGER is external "C inline use
-- <gtk/gtk.h>" alias "sizeof(GtkMisc)" end

feature --
	xalign: REAL is
			--	the horizontal alignment, from 0 (left) to 1 (right).
		do
			Result:=get_xalign(handle)
		ensure valid: Result.in_range (0.0,1.0)
		end

	yalign: REAL is
			-- the vertical alignment, from 0 (top) to 1 (bottom).
		do
			Result:=get_yalign(handle)
		ensure valid: Result.in_range (0.0,1.0)
		end

	xpad: INTEGER is
			-- the amount of space to add on the left and right of the
			-- widget, in pixels. TODO: shall be NATURAL_16
		do
			Result:=get_xpad(handle)
		ensure valid: Result>0
		end

	ypad: INTEGER is
			-- the amount of space to add on the top and bottom of the widget, in pixels. TODO shall be NATURAL_16
		do
			Result:=get_ypad(handle)
		ensure valid: Result>0
		end

	set_alignment (an_xalign, an_yalign: REAL) is
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

	set_padding (an_xpad, an_ypad: INTEGER) is
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
