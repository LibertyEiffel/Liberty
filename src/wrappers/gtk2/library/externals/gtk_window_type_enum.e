-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_WINDOW_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = toplevel_low_level)  or else
				(a_value = popup_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_toplevel is
		do
			value := toplevel_low_level
		end

	set_popup is
		do
			value := popup_low_level
		end

feature {ANY} -- Queries
	toplevel: BOOLEAN is
		do
			Result := (value=toplevel_low_level)
		end

	popup: BOOLEAN is
		do
			Result := (value=popup_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	toplevel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WINDOW_TOPLEVEL"
 			}"
 		end

	popup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WINDOW_POPUP"
 			}"
 		end


end -- class GTK_WINDOW_TYPE_ENUM
