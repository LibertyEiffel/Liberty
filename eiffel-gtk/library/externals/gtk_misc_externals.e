indexing
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_MISC_EXTERNALS
feature {NONE} -- External calls

	gtk_misc_set_alignment (a_misc: POINTER; a_gfloat_xalign,a_gfloat_yalign: REAL) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_misc_set_padding (a_misc: POINTER; an_xpad, an_ypad: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_misc_get_alignment (a_misc,gfloat_xalign,gfloat_yalign: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_misc_get_padding (a_misc,gint_xpad,gint_ypad: POINTER) is
		external "C use <gtk/gtk.h>"
		end

feature -- accessing  GtkMisc structure
	get_xalign (a_gtk_misc: POINTER): REAL_32 is
		external "C struct GtkMisc get xalign use <gtk/gtk.h>"
		end
	
	get_yalign (a_gtk_misc: POINTER): REAL_32 is
		external "C struct GtkMisc get xalign use <gtk/gtk.h>"
		end

	get_xpad (a_gtk_misc: POINTER): INTEGER_16 is
			-- TODO shall be NATURAL_16
		external "C struct GtkMisc get xalign use <gtk/gtk.h>"
		end

	get_ypad (a_gtk_misc: POINTER): INTEGER_16 is
			-- TODO shall be NATURAL_16
		external "C struct GtkMisc get xalign use <gtk/gtk.h>"
		end
end

