indexing
	description: "External calls for GTK_FILE_CHOOSER_DIALOG"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FILE_CHOOSER_DIALOG_EXTERNALS
feature {NONE} -- External calls
	
	gtk_file_chooser_dialog_new (a_title, a_parent: POINTER; a_gtkfilechooseraction: INTEGER;
										  first_button_text: POINTER): POINTER is
			-- Note variadic call wrapped as non variadic
		external "C use <gtk/gtk.h>"
		end

	gtk_file_chooser_dialog_new_with_backend  (a_title, a_parent: POINTER; a_gtkfilechooseraction: INTEGER;
															 a_backend, first_button_text: POINTER): POINTER is
			-- Note variadic call wrapped as non variadic
		external "C use <gtk/gtk.h>"
		end
end


