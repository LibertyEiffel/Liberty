indexing
	description: "Enum GtkAttachOptions - Denotes the expansion properties that a widget will have when it (or its parent) is resized."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ATTACH_OPTIONS
feature  -- enum
	are_valid_gtk_attach_options (an_attach_options: INTEGER): BOOLEAN is
		do	
			Result:=((an_attach_options & gtk_expand) |
						(an_attach_options & gtk_shrink) |
						(an_attach_options & gtk_fill)).to_boolean 

		end

	gtk_expand: INTEGER is
			-- the widget should expand to take up any extra space in its container
			-- that has been allocated.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_EXPAND"
		end
	
	gtk_shrink: INTEGER is
			-- the widget should shrink as and when possible.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHRINK"
		end
	
	gtk_fill: INTEGER is
			-- the widget should fill the space allocated to it.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILL"
		end
end
