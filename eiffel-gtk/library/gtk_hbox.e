indexing
	description: "GtkHBox -- A horizontal container box."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- GtkHBox is a container that organizes child widgets into a
			-- single row. Use the GtkBox packing interface to determine
			-- the arrangement, spacing, width, and alignment of GtkHBox
			-- children. All children are allocated the same height.

class GTK_HBOX
inherit GTK_BOX -- GtkHBox also implements AtkImplementorIface.
insert GTK_HBOX_EXTERNALS
creation make, from_external_pointer

feature {NONE} -- Creation
	make (an_homogeneous: BOOLEAN; a_spacing: INTEGER) is
			-- Creates a new GtkHBox. If `an_homogeneous' is True all
			-- children are to be given equal space
			-- allotments. `a_spacing' is the number of pixels to place
			-- by default between children.
		do
			handle:=gtk_hbox_new (an_homogeneous.to_integer, a_spacing)
		end
end
