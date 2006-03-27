indexing
	description: "Enum GtkMessageType -- The type of message being displayed in the dialog."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_MESSAGE_TYPE
feature  -- enum
	is_valid_gtk_message_type (a_gtk_message_type :INTEGER): BOOLEAN is
		do	
			Result:=((a_gtk_message_type = gtk_message_info) or else
						(a_gtk_message_type = gtk_message_warning) or else
						(a_gtk_message_type = gtk_message_question) or else
						(a_gtk_message_type = gtk_message_error))
		end
	
	gtk_message_info: INTEGER is
			-- 	Informational message 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MESSAGE_INFO"
		end

	gtk_message_warning: INTEGER is
			-- 	Nonfatal warning message 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MESSAGE_WARNING"
		end
	
	gtk_message_question: INTEGER is
			-- 	Question requiring a choice 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MESSAGE_QUESTION"
		end

	gtk_message_error: INTEGER is
			-- 	Fatal error message 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MESSAGE_ERROR"
		end
end

