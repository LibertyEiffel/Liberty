-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_JOIN_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = miter_low_level)  or else
				(a_value = round_low_level)  or else
				(a_value = bevel_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_miter is
		do
			value := miter_low_level
		end

	set_round is
		do
			value := round_low_level
		end

	set_bevel is
		do
			value := bevel_low_level
		end

feature {ANY} -- Queries
	miter: BOOLEAN is
		do
			Result := (value=miter_low_level)
		end

	round: BOOLEAN is
		do
			Result := (value=round_low_level)
		end

	bevel: BOOLEAN is
		do
			Result := (value=bevel_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	miter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_JOIN_MITER"
 			}"
 		end

	round_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_JOIN_ROUND"
 			}"
 		end

	bevel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_JOIN_BEVEL"
 			}"
 		end


end -- class GDK_JOIN_STYLE_ENUM
