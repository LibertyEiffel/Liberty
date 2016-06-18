note
	description: "."
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

class GTK_FRAME
inherit
	GTK_BIN
insert
	GTK_FRAME_EXTERNALS
	
create {ANY} from_label, from_external_pointer

feature {WRAPPER, WRAPPER_HANDLER} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkFrame)"
		end

feature {} -- Creation
	from_label (a_label: STRING)
			-- Creates a new GtkFrame, with optional `a_label' (if Void,
			-- the label is omitted).
		require gtk_initialized: gtk.is_initialized
		do
			from_external_pointer (gtk_frame_new (a_label.to_external))
		end

feature {ANY} -- label
	label: STRING
			-- the text to use as the label of the frame
		local ptr: POINTER
		do
			ptr:=gtk_frame_get_label (handle)
			if ptr.is_not_null
			then create Result.from_external_copy (ptr)
			end
		end

	remove_label
		do
			gtk_frame_set_label (handle, default_pointer)
		end
	
	set_label (a_label: STRING)
			-- Sets the text of the label.
		do
			gtk_frame_set_label (handle,a_label.to_external)
		end


feature {ANY} -- label widget
	-- TODO label_widget: GTK_WIDGET is -- The label widget for the frame.
	
	set_label_widget (a_widget: GTK_WIDGET)
			-- Sets the label widget for the frame. This is the widget
			-- that will appear embedded in the top edge of the frame as
			-- a title.
		require valid_widget: a_widget /= Void
		do
			gtk_frame_set_label_widget (handle,a_widget.handle)
		end


	set_label_align (an_xalign, an_yalign: REAL)
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

feature {ANY} -- shadow
	shadow_type: INTEGER
		do
			Result := gtk_frame_get_shadow_type (handle)
		ensure valid: is_valid_gtk_shadow_type (Result)
		end

	set_shadow_type (a_shadow_type: INTEGER)
			-- Sets the shadow type for frame.
		require is_valid_gtk_shadow_type (a_shadow_type)
		do
			gtk_frame_set_shadow_type (handle,a_shadow_type)
		end

feature {ANY} -- Alignments
	alignments: TUPLE[REAL,REAL]
			-- the X and Y alignment of the frame's label.
		local xal,yal: REAL_32
		do
			-- TODO clean this types uglyness
			gtk_frame_get_label_align (handle, $xal,$yal)
			create Result.make_2 (xal, yal)
			-- TODO postconditions
		end

	x_alignment: REAL
			-- the X alignement
		do
			gtk_frame_get_label_align (handle, $Result, default_pointer)
			-- TODO postcondition
		end
	
	y_alignment: REAL
			-- the Y alignement
		do
			gtk_frame_get_label_align (handle, $Result, default_pointer)
			-- TODO postcondition
		end

feature {ANY} -- TODO Property Details
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
