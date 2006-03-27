indexing
	description: "enum GtkButtonsType -- Prebuilt sets of buttons for the dialog. If none of these choices are appropriate, simply use GTK_BUTTONS_NONE then call gtk_dialog_add_buttons()."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class BUTTONS_TYPES
inherit GTK_BUTTONS_TYPE
		rename
			gtk_buttons_none as no_buttons,
			gtk_buttons_ok as ok_button,
			gtk_buttons_close as close_button,
			gtk_buttons_cancel as cancel_button,
			gtk_buttons_yes_no as yes_no_buttons,
			gtk_buttons_ok_cancel as ok_cancel_buttons
		end
end
