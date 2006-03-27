indexing

	description: "The GtkAlignment widget externals."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$REvision:$"

class GTK_ALIGMENT_EXTERNALS

feature {NONE} -- external calls

	gtk_alignment_new (xalign, yalign, xscale, yscale: REAL_32): POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_alignment_set (alignment: POINTER, xalign, yalign, xscale, yscale: REAL_32) is
		external "C use <gtk/gtk.h>"
		end

	gtk_alignment_get_padding (alignment, guint_padding_top, guint_padding_bottom, guint_padding_left, guint_padding_right: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_alignment_set_padding (alignment: POINTER; guint_padding_top, guint_padding_bottom, guint_padding_left, guint_padding_right: INTEGER) is
			-- TODO all guint_* shall be NATURAL!
		external "C use <gtk/gtk.h>"
		end
end
