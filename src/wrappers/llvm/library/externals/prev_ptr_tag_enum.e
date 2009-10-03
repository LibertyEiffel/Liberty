-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PREV_PTR_TAG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = zerodigittag_low_level)  or else
				(a_value = stoptag_low_level)  or else
				(a_value = fullstoptag_low_level) )
		end

feature -- Setters
	default_create,
	set_zerodigittag is
		do
			value := zerodigittag_low_level
		end

	set_stoptag is
		do
			value := stoptag_low_level
		end

	set_fullstoptag is
		do
			value := fullstoptag_low_level
		end

feature -- Queries
	is_zerodigittag: BOOLEAN is
		do
			Result := (value=zerodigittag_low_level)
		end

	is_stoptag: BOOLEAN is
		do
			Result := (value=stoptag_low_level)
		end

	is_fullstoptag: BOOLEAN is
		do
			Result := (value=fullstoptag_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	zerodigittag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "zeroDigitTag"
 			}"
 		end

	stoptag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "stopTag"
 			}"
 		end

	fullstoptag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "fullStopTag"
 			}"
 		end


end -- class PREV_PTR_TAG_ENUM
