note
	description: "GtkAspectFrame: A frame that constrains its child to a particular aspect ratio."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"
	
	
class GTK_ASPECT_FRAME
	-- The GtkAspectFrame is useful when you want pack a widget so that
	-- it can resize but always retains the same aspect ratio. For
	-- instance, one might be drawing a small preview of a larger
	-- image. GtkAspectFrame derives from GtkFrame, so it can draw a
	-- label and a frame around the child. The frame will be
	-- "shrink-wrapped" to the size of the child.

inherit
	GTK_FRAME
		redefine struct_size end
		-- GtkAspectFrame implements AtkImplementorIface.
insert
	GTK_ASPECT_FRAME_EXTERNALS

create {ANY} make, from_external_pointer

feature {ANY} 
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkAspectFrame)"
		end

feature {} -- Creation
	make (a_label: STRING; an_xalign, an_yalign, a_ratio: REAL_32; obey_child: BOOLEAN) is
			-- Create a new GtkAspectFrame. `an_xalign' ranges from 0.0
			-- (left aligned) to 1.0 (right aligned); `an_yalign' ranges
			-- from 0.0 (top aligned) to 1.0 (bottom aligned). When
			-- `obey_child' is True ratio is ignored, and the aspect
			-- ratio is taken from the requistion of the child.
		require
			valid_label: a_label/=Void
			valid_xalign: an_xalign.in_range ({REAL_32 0.0}, {REAL_32 1.0})
			valid_yalign: an_yalign.in_range ({REAL_32 0.0}, {REAL_32 1.0})
			valid_ratio: a_ratio.in_range ({REAL_32 1.0e-04},{REAL_32 10000.0})
		do
			from_external_pointer(gtk_aspect_frame_new (a_label.to_external,
																	  an_xalign, an_yalign, a_ratio,
																	  obey_child.to_integer))
		end


	set (an_xalign, an_yalign, a_ratio: REAL_32; obey_child: BOOLEAN) is
			-- Set parameters for an existing GtkAspectFrame. `an_xalign'
			-- ranges from 0.0 (left aligned) to 1.0 (right aligned);
			-- `an_yalign' ranges from 0.0 (top aligned) to 1.0 (bottom
			-- aligned). When `obey_child' is True ratio is ignored, and
			-- the aspect ratio is taken from the requistion of the
			-- child.
		require
			valid_xalign: an_xalign.in_range ({REAL_32 0.0}, {REAL_32 1.0})
			valid_yalign: an_yalign.in_range ({REAL_32 0.0}, {REAL_32 1.0})
			valid_ratio: a_ratio.in_range ({REAL_32 1.0e-04},{REAL_32 10000.0})
		do
			gtk_aspect_frame_set (handle, an_xalign, an_yalign, a_ratio,
										 obey_child.to_integer)
		end

feature {ANY} -- Property Details TODO
	
-- The "obey-child" property

--   "obey-child"           gboolean              : Read / Write

-- Force aspect ratio to match that of the frame's child.

-- Default value: TRUE
-- The "ratio" property

--   "ratio"                gfloat                : Read / Write

-- Aspect ratio if obey_child is FALSE.

-- Allowed values: [1e-04,10000]

-- Default value: 0.5
-- The "xalign" property

--   "xalign"               gfloat                : Read / Write

-- X alignment of the child.

-- Allowed values: [0,1]

-- Default value: 0.5
-- The "yalign" property

--   "yalign"               gfloat                : Read / Write

-- Y alignment of the child.

-- Allowed values: [0,1]

-- Default value: 0.5
	
end
