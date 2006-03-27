indexing
	description: "External calls for GTK_ASPECT_FRAME"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ASPECT_FRAME_EXTERNALS

feature {NONE} -- External calls

	gtk_aspect_frame_new (a_label: POINTER; gfloat_xalign, gfloat_yalign, gfloat_ratio: REAL_32;
								 obey_child: INTEGER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_aspect_frame_set (an_aspect_frame: POINTER; gfloat_xalign, gfloat_yalign, gfloat_ratio: REAL_32;
								 obey_child: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
end
