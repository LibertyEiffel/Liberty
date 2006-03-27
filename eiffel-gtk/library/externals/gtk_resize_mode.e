indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"


deferred class GTK_RESIZE_MODE

feature -- Enum
	
	gtk_resize_parent: INTEGER is
			--  Pass resize request to the parent
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESIZE_PARENT"
		end

	gtk_resize_queue: INTEGER is
			-- Queue resizes on this widget
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESIZE_QUEUE"
		end

	is_valid_gtk_resize_mode (a_mode: INTEGER): BOOLEAN is
		do
			Result:=((a_mode=gtk_resize_parent) or else
						(a_mode=gtk_resize_queue))
		end
end
  
