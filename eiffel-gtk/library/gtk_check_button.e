indexing
	description: "."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GTK_CHECK_BUTTON
inherit
	GTK_TOGGLE_BUTTON redefine make,with_label,with_mnemonic end
	GTK_CHECK_BUTTON_EXTERNALS
	
creation make,with_label,with_mnemonic
feature {NONE} -- Creation

	make is
			-- Creates a new GtkCheckButton.
		do
			handle :=  gtk_check_button_new
		end

	with_label (a_label: STRING) is
			-- Creates a new GtkCheckButton with a GtkLabel to the right of it.
		do
			handle :=  gtk_check_button_new_with_label (a_label.to_external)
		end
	
	with_mnemonic (a_label: STRING) is
			-- Creates a new GtkCheckButton containing a label. The label
			-- will be created using GTK_LABEL.with_mnemonic(), so
			-- underscores in label indicate the mnemonic for the check
			-- button.
		do
			handle := gtk_check_button_new_with_mnemonic (a_label.to_external)
		end

feature -- Style Properties TODO
-- The "indicator-size" style property

--   "indicator-size"       gint                  : Read

-- Size of check or radio indicator.

-- Allowed values: >= 0

-- Default value: 13
-- The "indicator-spacing" style property

--   "indicator-spacing"    gint                  : Read

-- Spacing around check or radio indicator.

-- Allowed values: >= 0

-- Default value: 2
-- See Also
end
