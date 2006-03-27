indexing
	description: "Enum GtkUpdateType"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_UPDATE_TYPE
feature  -- enum
	is_valid_gtk_update_type (an_update_type: INTEGER): BOOLEAN is
		do	
			Result:=((an_update_type=gtk_update_continuous) or else
						(an_update_type=gtk_update_discontinuous) or else
						(an_update_type=gtk_update_delayed))
		end

	gtk_update_continuous: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_CONTINUOUS"
		end

	gtk_update_discontinuous: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_DISCONTINUOUS"
		end

	gtk_update_delayed: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_DELAYED"
		end
end

