indexing
	description: "GtkVBox -- A vertical container box."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_VBOX
inherit
	GTK_BOX 
	GTK_VBOX_EXTERNALS
		-- GtkHBox implements AtkImplementorIface.
creation make, from_external_pointer

feature {NONE} -- Creation
	make (an_homogeneous: BOOLEAN; a_spacing: INTEGER) is
			-- Creates a new GtkVBox. If `an_homogeneous' is True all
			-- children are to be given equal space
			-- allotments. `a_spacing' is the number of pixels to place
			-- by default between children.
		do
			handle := gtk_vbox_new (an_homogeneous.to_integer, a_spacing)
			store_eiffel_wrapper
		end
end
