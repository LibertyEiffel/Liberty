-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CHECK_BUTTON_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field toggle_button.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCheckButton"
		}"
		end

end -- class GTK_CHECK_BUTTON_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

