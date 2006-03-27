indexing
	description: "Enum GtkPackType -- Represents the packing location GtkBox children. (See: GtkVBox, GtkHBox, and GtkButtonBox)."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_PACK_TYPE
feature  -- enum
	is_valid_pack_type (a_pack_type:INTEGER): BOOLEAN is
		do	
			Result := ((a_pack_type=gtk_pack_start) or else (a_pack_type=gtk_pack_end))
		end

	gtk_pack_start: INTEGER is
			-- The child is packed into the start of the box
		external "C macro use <gtk/gth.h>"
		alias "GTK_PACK_START"
		end
	gtk_pack_end: INTEGER is
			-- The child is packed into the end of the box
		external "C macro use <gtk/gth.h>"
		alias "GTK_PACK_END"
		end

end
			
