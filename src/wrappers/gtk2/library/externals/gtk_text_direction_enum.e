-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TEXT_DIRECTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = ltr_low_level)  or else
				(a_value = rtl_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_ltr is
		do
			value := ltr_low_level
		end

	set_rtl is
		do
			value := rtl_low_level
		end

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	ltr: BOOLEAN is
		do
			Result := (value=ltr_low_level)
		end

	rtl: BOOLEAN is
		do
			Result := (value=rtl_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_DIR_NONE"
 			}"
 		end

	ltr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_DIR_LTR"
 			}"
 		end

	rtl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_DIR_RTL"
 			}"
 		end


end -- class GTK_TEXT_DIRECTION_ENUM
