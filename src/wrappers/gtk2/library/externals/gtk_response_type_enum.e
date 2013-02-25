-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RESPONSE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = reject_low_level)  or else
				(a_value = accept_low_level)  or else
				(a_value = delete_event_low_level)  or else
				(a_value = ok_low_level)  or else
				(a_value = cancel_low_level)  or else
				(a_value = close_low_level)  or else
				(a_value = yes_low_level)  or else
				(a_value = no_low_level)  or else
				(a_value = apply_low_level)  or else
				(a_value = help_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_reject is
		do
			value := reject_low_level
		end

	set_accept is
		do
			value := accept_low_level
		end

	set_delete_event is
		do
			value := delete_event_low_level
		end

	set_ok is
		do
			value := ok_low_level
		end

	set_cancel is
		do
			value := cancel_low_level
		end

	set_close is
		do
			value := close_low_level
		end

	set_yes is
		do
			value := yes_low_level
		end

	set_no is
		do
			value := no_low_level
		end

	set_apply is
		do
			value := apply_low_level
		end

	set_help is
		do
			value := help_low_level
		end

feature -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	reject: BOOLEAN is
		do
			Result := (value=reject_low_level)
		end

	accept: BOOLEAN is
		do
			Result := (value=accept_low_level)
		end

	delete_event: BOOLEAN is
		do
			Result := (value=delete_event_low_level)
		end

	ok: BOOLEAN is
		do
			Result := (value=ok_low_level)
		end

	cancel: BOOLEAN is
		do
			Result := (value=cancel_low_level)
		end

	close: BOOLEAN is
		do
			Result := (value=close_low_level)
		end

	yes: BOOLEAN is
		do
			Result := (value=yes_low_level)
		end

	no: BOOLEAN is
		do
			Result := (value=no_low_level)
		end

	apply: BOOLEAN is
		do
			Result := (value=apply_low_level)
		end

	help: BOOLEAN is
		do
			Result := (value=help_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_NONE"
 			}"
 		end

	reject_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_REJECT"
 			}"
 		end

	accept_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_ACCEPT"
 			}"
 		end

	delete_event_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_DELETE_EVENT"
 			}"
 		end

	ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_OK"
 			}"
 		end

	cancel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_CANCEL"
 			}"
 		end

	close_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_CLOSE"
 			}"
 		end

	yes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_YES"
 			}"
 		end

	no_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_NO"
 			}"
 		end

	apply_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_APPLY"
 			}"
 		end

	help_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RESPONSE_HELP"
 			}"
 		end


end -- class GTK_RESPONSE_TYPE_ENUM
