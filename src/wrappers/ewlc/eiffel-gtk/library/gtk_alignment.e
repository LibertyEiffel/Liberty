note
	description: "The GtkAlignment widget controls the alignment and size of its child widget. It has four settings: xscale, yscale, xalign, and yalign."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$REvision:$"


class GTK_ALIGNMENT
	-- The GtkAlignment widget controls the alignment and size of its
	-- child widget. It has four settings: xscale, yscale, xalign, and
	-- yalign.

	-- The scale settings are used to specify how much the child widget
	-- should expand to fill the space allocated to the
	-- GtkAlignment. The values can range from 0 (meaning the child
	-- doesn't expand at all) to 1 (meaning the child expands to fill
	-- all of the available space).
	
	-- The align settings are used to place the child widget within the
	-- available area. The values range from 0 (top or left) to 1
	-- (bottom or right). Of course, if the scale settings are both set
	-- to 1, the alignment settings have no effect.
inherit
	GTK_BIN 
			-- TODO: GtkAlignment implements AtkImplementorIface.

insert
	GTK_ALIGNMENT_EXTERNALS
	
create {ANY} make, from_external_pointer

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkAlignment)"
		end

feature {} -- Creation
	make (xalign, yalign, xscale, yscale: REAL_32)
			-- Creates a new GtkAlignment.  `xalign' : the horizontal
			-- alignment of the child widget, from 0 (left) to 1 (right).
			-- `yalign' : the vertical alignment of the child widget,
			-- from 0 (top) to 1 (bottom).  `xscale' : the amount that
			-- the child widget expands horizontally to fill up unused
			-- space, from 0 to 1. A value of 0 indicates that the child
			-- widget should never expand. A value of 1 indicates that
			-- the child widget will expand to fill all of the space
			-- allocated for the GtkAlignment.  `yscale' : the amount
			-- that the child widget expands vertically to fill up unused
			-- space, from 0 to 1. The values are similar to xscale.
		do
			from_external_pointer(gtk_alignment_new (xalign,yalign,xscale,yscale))
		end

feature {ANY} -- Scaling and alignment 
	set (xalign, yalign, xscale, yscale: REAL_32)
			-- Sets the GtkAlignment values.  `xalign' : the horizontal
			-- alignment of the child widget, from 0 (left) to 1 (right).
			-- `yalign' : the vertical alignment of the child widget, from
			-- 0 (top) to 1 (bottom).  `xscale' : the amount that the child
			-- widget expands horizontally to fill up unused space, from
			-- 0 to 1. A value of 0 indicates that the child widget
			-- should never expand. A value of 1 indicates that the child
			-- widget will expand to fill all of the space allocated for
			-- the GtkAlignment.  yscale : the amount that the child
			-- widget expands vertically to fill up unused space, from 0
			-- to 1. The values are similar to xscale.
		do
			gtk_alignment_set (handle,xalign,yalign,xscale,yscale)
		end
	
-- The "xalign" property

--   "xalign"               gfloat                : Read / Write

-- Horizontal position of child in available space. 0.0 is left aligned, 1.0 is right aligned.

-- Allowed values: [0,1]

-- Default value: 0.5
-- The "xscale" property

--   "xscale"               gfloat                : Read / Write

-- If available horizontal space is bigger than needed for the child, how much of it to use for the child. 0.0 means none, 1.0 means all.

-- Allowed values: [0,1]

-- Default value: 1
-- The "yalign" property

--   "yalign"               gfloat                : Read / Write

-- Vertical position of child in available space. 0.0 is top aligned, 1.0 is bottom aligned.

-- Allowed values: [0,1]

-- Default value: 0.5
-- The "yscale" property

--   "yscale"               gfloat                : Read / Write

-- If available vertical space is bigger than needed for the child, how much of it to use for the child. 0.0 means none, 1.0 means all.

-- Allowed values: [0,1]

-- Default value: 1
feature {ANY} -- paddings

	paddings: TUPLE[INTEGER,INTEGER,INTEGER,INTEGER]
			-- Top, bottom, left and right padding. TODO shall be NATURAL
		local
			guint_padding_top,guint_padding_bottom,guint_padding_left,guint_padding_right: INTEGER
		do
			gtk_alignment_get_padding (handle,
												$guint_padding_top, $guint_padding_bottom,
												$guint_padding_left, $guint_padding_right)
			create Result.make_4 (guint_padding_top,guint_padding_bottom,
										 guint_padding_left,guint_padding_right)
		end

	top_padding: INTEGER
			-- Top padding
		do
			gtk_alignment_get_padding (handle,$Result, default_pointer, default_pointer, default_pointer)
		ensure positive: Result>=0
		end
	
	bottom_padding: INTEGER
			-- Bottom padding
		do
			gtk_alignment_get_padding (handle, default_pointer,$Result, default_pointer, default_pointer)
		ensure positive: Result>=0
		end

	left_padding: INTEGER
			-- Left padding
		do
			gtk_alignment_get_padding (handle, default_pointer, default_pointer,$Result, default_pointer)
		ensure positive: Result>=0
		end
	right_padding: INTEGER
			-- Right padding
		do
			gtk_alignment_get_padding (handle, default_pointer, default_pointer, default_pointer, $Result)
		ensure positive: Result>=0
		end


	set_paddings (padding_top,padding_bottom,padding_left,padding_right: INTEGER)
		-- Sets the padding on the different sides of the widget. The
		-- padding adds blank space to the sides of the widget. For
		-- instance, this can be used to indent the child widget towards
		-- the right by adding padding on the left.  TODO
		-- padding_top,padding_bottom,padding_left,padding_right are
		-- guint therefore shall be NATURAL
		do
			gtk_alignment_set_padding (handle, padding_top,padding_bottom,padding_left,padding_right)
		end
end
