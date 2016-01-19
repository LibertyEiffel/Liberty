-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RESPONSE_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_response_accept_low_level)  or else
				(a_value = gtk_response_apply_low_level)  or else
				(a_value = gtk_response_cancel_low_level)  or else
				(a_value = gtk_response_close_low_level)  or else
				(a_value = gtk_response_delete_event_low_level)  or else
				(a_value = gtk_response_help_low_level)  or else
				(a_value = gtk_response_no_low_level)  or else
				(a_value = gtk_response_none_low_level)  or else
				(a_value = gtk_response_ok_low_level)  or else
				(a_value = gtk_response_reject_low_level)  or else
				(a_value = gtk_response_yes_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_response_accept is
		do
			value := gtk_response_accept_low_level
		end

	set_gtk_response_apply is
		do
			value := gtk_response_apply_low_level
		end

	set_gtk_response_cancel is
		do
			value := gtk_response_cancel_low_level
		end

	set_gtk_response_close is
		do
			value := gtk_response_close_low_level
		end

	set_gtk_response_delete_event is
		do
			value := gtk_response_delete_event_low_level
		end

	set_gtk_response_help is
		do
			value := gtk_response_help_low_level
		end

	set_gtk_response_no is
		do
			value := gtk_response_no_low_level
		end

	set_gtk_response_none is
		do
			value := gtk_response_none_low_level
		end

	set_gtk_response_ok is
		do
			value := gtk_response_ok_low_level
		end

	set_gtk_response_reject is
		do
			value := gtk_response_reject_low_level
		end

	set_gtk_response_yes is
		do
			value := gtk_response_yes_low_level
		end

feature -- Queries
	is_gtk_response_accept: BOOLEAN is
		do
			Result := (value=gtk_response_accept_low_level)
		end

	is_gtk_response_apply: BOOLEAN is
		do
			Result := (value=gtk_response_apply_low_level)
		end

	is_gtk_response_cancel: BOOLEAN is
		do
			Result := (value=gtk_response_cancel_low_level)
		end

	is_gtk_response_close: BOOLEAN is
		do
			Result := (value=gtk_response_close_low_level)
		end

	is_gtk_response_delete_event: BOOLEAN is
		do
			Result := (value=gtk_response_delete_event_low_level)
		end

	is_gtk_response_help: BOOLEAN is
		do
			Result := (value=gtk_response_help_low_level)
		end

	is_gtk_response_no: BOOLEAN is
		do
			Result := (value=gtk_response_no_low_level)
		end

	is_gtk_response_none: BOOLEAN is
		do
			Result := (value=gtk_response_none_low_level)
		end

	is_gtk_response_ok: BOOLEAN is
		do
			Result := (value=gtk_response_ok_low_level)
		end

	is_gtk_response_reject: BOOLEAN is
		do
			Result := (value=gtk_response_reject_low_level)
		end

	is_gtk_response_yes: BOOLEAN is
		do
			Result := (value=gtk_response_yes_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_response_accept_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_ACCEPT"
 			}"
 		end

	gtk_response_apply_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_APPLY"
 			}"
 		end

	gtk_response_cancel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_CANCEL"
 			}"
 		end

	gtk_response_close_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_CLOSE"
 			}"
 		end

	gtk_response_delete_event_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_DELETE_EVENT"
 			}"
 		end

	gtk_response_help_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_HELP"
 			}"
 		end

	gtk_response_no_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_NO"
 			}"
 		end

	gtk_response_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_NONE"
 			}"
 		end

	gtk_response_ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_OK"
 			}"
 		end

	gtk_response_reject_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_REJECT"
 			}"
 		end

	gtk_response_yes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_YES"
 			}"
 		end


end -- class GTK_RESPONSE_TYPE_ENUM
