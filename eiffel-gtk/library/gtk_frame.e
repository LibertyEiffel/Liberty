indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_FRAME
inherit
	GTK_BIN redefine make end
	GTK_FRAME_EXTERNALS
	SHARED_C_STRUCT
	
creation make

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkFrame)"
		end

feature {NONE} -- Creation
	make (a_label: STRING) is
			-- Creates a new GtkFrame, with optional `a_label' (if Void,
			-- the label is omitted).
		do
			handle := gtk_frame_new (a_label.to_external)
			store_eiffel_wrapper
		end

feature -- label
	label: STRING is
			-- the text to use as the label of the frame
		local ptr: POINTER
		do
			ptr:=gtk_frame_get_label (handle)
			if ptr.is_not_null
			then create Result.from_external_copy (ptr)
			end
		end

	remove_label is
		do
			gtk_frame_set_label (handle, Null)
		end
	
	set_label (a_label: STRING) is
			-- Sets the text of the label.
		do
			gtk_frame_set_label (handle,a_label.to_external)
		end


feature -- label widget
	-- TODO label_widget: GTK_WIDGET is -- The label widget for the frame.
	
	set_label_widget (a_widget: GTK_WIDGET) is
			-- Sets the label widget for the frame. This is the widget
			-- that will appear embedded in the top edge of the frame as
			-- a title.
		require valid_widget: a_widget /= Void
		do
			gtk_frame_set_label_widget (handle,a_widget.handle)
		end


	set_label_align (an_xalign, an_yalign: REAL) is
			-- Sets the alignment of the frame widget's label. The
			-- default values for a newly created frame are 0.0 and 0.5.
			-- `an_xalign' : The position of the label along the top edge
			-- of the widget. A value of 0.0 represents left alignment;
			-- 1.0 represents right alignment.  `an_yalign': The y
			-- alignment of the label. A value of 0.0 aligns under the
			-- frame; 1.0 aligns above the frame.
		do
			gtk_frame_set_label_align (handle,an_xalign,an_yalign)
		end

feature -- shadow
	shadow_type: INTEGER is
		do
			Result := gtk_frame_get_shadow_type (handle)
		ensure valid: is_valid_gtk_shadow_type (Result)
		end

	set_shadow_type (a_shadow_type: INTEGER) is
			-- Sets the shadow type for frame.
		require is_valid_gtk_shadow_type (a_shadow_type)
		do
			gtk_frame_set_shadow_type (handle,a_shadow_type)
		end

feature -- Alignments
	alignments: TUPLE[REAL,REAL] is
			-- the X and Y alignment of the frame's label.
		local xal,yal: REAL_32
		do
			-- TODO clean this types uglyness
			gtk_frame_get_label_align (handle, $xal,$yal)
			create Result.make_2 (xal.force_to_real_32,yal.force_to_real_32)
			-- TODO postconditions
		end

	x_alignment: REAL is
			-- the X alignement
		local al: REAL_32
		do
			gtk_frame_get_label_align (handle, $al,Null)
			Result := al.force_to_real_32
			-- TODO postcondition
		end
	
	y_alignment: REAL is
			-- the Y alignement
		local al: REAL_32
		do
			gtk_frame_get_label_align (handle, $al,Null)
			Result := al.force_to_real_32
			-- TODO postcondition
		end

feature -- TODO Property Details
-- The "label" property

--   "label"                gchararray            : Read / Write

-- Text of the frame's label.

-- Default value: NULL
-- The "label-widget" property

--   "label-widget"         GtkWidget             : Read / Write

-- A widget to display in place of the usual frame label.
-- The "label-xalign" property

--   "label-xalign"         gfloat                : Read / Write

-- The horizontal alignment of the label.

-- Allowed values: [0,1]

-- Default value: 0.5
-- The "label-yalign" property

--   "label-yalign"         gfloat                : Read / Write

-- The vertical alignment of the label.

-- Allowed values: [0,1]

-- Default value: 0.5
-- The "shadow" property

--   "shadow"               GtkShadowType         : Read / Write

-- Deprecated property, use shadow_type instead.

-- Default value: GTK_SHADOW_ETCHED_IN
-- The "shadow-type" property

--   "shadow-type"          GtkShadowType         : Read / Write

-- Appearance of the frame border.

-- Default value: GTK_SHADOW_ETCHED_IN

end
