-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTRAVERSE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = in__order_low_level)  or else
				(a_value = post__order_low_level)  or else
				(a_value = level__order_low_level) )
		end

feature -- Setters
	default_create,
	set_in__order is
		do
			value := in__order_low_level
		end

	set_post__order is
		do
			value := post__order_low_level
		end

	set_level__order is
		do
			value := level__order_low_level
		end

feature -- Queries
	is_in__order: BOOLEAN is
		do
			Result := (value=in__order_low_level)
		end

	is_post__order: BOOLEAN is
		do
			Result := (value=post__order_low_level)
		end

	is_level__order: BOOLEAN is
		do
			Result := (value=level__order_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	in__order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IN_ORDER"
 			}"
 		end

	post__order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_POST_ORDER"
 			}"
 		end

	level__order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LEVEL_ORDER"
 			}"
 		end


end -- class GTRAVERSE_TYPE_ENUM
