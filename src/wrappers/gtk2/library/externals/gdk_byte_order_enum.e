-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_BYTE_ORDER_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = lsb_first_low_level)  or else
				(a_value = msb_first_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_lsb_first is
		do
			value := lsb_first_low_level
		end

	set_msb_first is
		do
			value := msb_first_low_level
		end

feature {ANY} -- Queries
	lsb_first: BOOLEAN is
		do
			Result := (value=lsb_first_low_level)
		end

	msb_first: BOOLEAN is
		do
			Result := (value=msb_first_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	lsb_first_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LSB_FIRST"
 			}"
 		end

	msb_first_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MSB_FIRST"
 			}"
 		end


end -- class GDK_BYTE_ORDER_ENUM
