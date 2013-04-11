-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PACK_DIRECTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ltr_low_level)  or else
				(a_value = rtl_low_level)  or else
				(a_value = ttb_low_level)  or else
				(a_value = btt_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_ltr is
		do
			value := ltr_low_level
		end

	set_rtl is
		do
			value := rtl_low_level
		end

	set_ttb is
		do
			value := ttb_low_level
		end

	set_btt is
		do
			value := btt_low_level
		end

feature {ANY} -- Queries
	ltr: BOOLEAN is
		do
			Result := (value=ltr_low_level)
		end

	rtl: BOOLEAN is
		do
			Result := (value=rtl_low_level)
		end

	ttb: BOOLEAN is
		do
			Result := (value=ttb_low_level)
		end

	btt: BOOLEAN is
		do
			Result := (value=btt_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ltr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PACK_DIRECTION_LTR"
 			}"
 		end

	rtl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PACK_DIRECTION_RTL"
 			}"
 		end

	ttb_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PACK_DIRECTION_TTB"
 			}"
 		end

	btt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PACK_DIRECTION_BTT"
 			}"
 		end


end -- class GTK_PACK_DIRECTION_ENUM
