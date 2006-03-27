indexing
	description: "High level version of GtkDialogFLags."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class DIALOG_FLAGS
inherit GTK_DIALOG_FLAGS
		rename
			gtk_dialog_modal as modal_dialog,
			gtk_dialog_destroy_with_parent as destroy_with_parent
			gtk_dialog_no_separator as no_separator 
		end
end
