-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_BUTTONS_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_buttons_cancel_low_level)  or else
				(a_value = gtk_buttons_close_low_level)  or else
				(a_value = gtk_buttons_none_low_level)  or else
				(a_value = gtk_buttons_ok_low_level)  or else
				(a_value = gtk_buttons_ok_cancel_low_level)  or else
				(a_value = gtk_buttons_yes_no_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_buttons_cancel is
		do
			value := gtk_buttons_cancel_low_level
		end

	set_gtk_buttons_close is
		do
			value := gtk_buttons_close_low_level
		end

	set_gtk_buttons_none is
		do
			value := gtk_buttons_none_low_level
		end

	set_gtk_buttons_ok is
		do
			value := gtk_buttons_ok_low_level
		end

	set_gtk_buttons_ok_cancel is
		do
			value := gtk_buttons_ok_cancel_low_level
		end

	set_gtk_buttons_yes_no is
		do
			value := gtk_buttons_yes_no_low_level
		end

feature -- Queries
	is_gtk_buttons_cancel: BOOLEAN is
		do
			Result := (value=gtk_buttons_cancel_low_level)
		end

	is_gtk_buttons_close: BOOLEAN is
		do
			Result := (value=gtk_buttons_close_low_level)
		end

	is_gtk_buttons_none: BOOLEAN is
		do
			Result := (value=gtk_buttons_none_low_level)
		end

	is_gtk_buttons_ok: BOOLEAN is
		do
			Result := (value=gtk_buttons_ok_low_level)
		end

	is_gtk_buttons_ok_cancel: BOOLEAN is
		do
			Result := (value=gtk_buttons_ok_cancel_low_level)
		end

	is_gtk_buttons_yes_no: BOOLEAN is
		do
			Result := (value=gtk_buttons_yes_no_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_buttons_cancel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_CANCEL"
 			}"
 		end

	gtk_buttons_close_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_CLOSE"
 			}"
 		end

	gtk_buttons_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_NONE"
 			}"
 		end

	gtk_buttons_ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_OK"
 			}"
 		end

	gtk_buttons_ok_cancel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_OK_CANCEL"
 			}"
 		end

	gtk_buttons_yes_no_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_YES_NO"
 			}"
 		end


end -- class GTK_BUTTONS_TYPE_ENUM
