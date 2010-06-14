-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_BUTTONS_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = ok_low_level)  or else
				(a_value = close_low_level)  or else
				(a_value = cancel_low_level)  or else
				(a_value = yes_no_low_level)  or else
				(a_value = ok_cancel_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_ok is
		do
			value := ok_low_level
		end

	set_close is
		do
			value := close_low_level
		end

	set_cancel is
		do
			value := cancel_low_level
		end

	set_yes_no is
		do
			value := yes_no_low_level
		end

	set_ok_cancel is
		do
			value := ok_cancel_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_ok: BOOLEAN is
		do
			Result := (value=ok_low_level)
		end

	is_close: BOOLEAN is
		do
			Result := (value=close_low_level)
		end

	is_cancel: BOOLEAN is
		do
			Result := (value=cancel_low_level)
		end

	is_yes_no: BOOLEAN is
		do
			Result := (value=yes_no_low_level)
		end

	is_ok_cancel: BOOLEAN is
		do
			Result := (value=ok_cancel_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_NONE"
 			}"
 		end

	ok_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_OK"
 			}"
 		end

	close_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_CLOSE"
 			}"
 		end

	cancel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_CANCEL"
 			}"
 		end

	yes_no_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_YES_NO"
 			}"
 		end

	ok_cancel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONS_OK_CANCEL"
 			}"
 		end


end -- class GTK_BUTTONS_TYPE_ENUM
