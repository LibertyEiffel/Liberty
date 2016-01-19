-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTRAVERSETYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_in_order_low_level)  or else
				(a_value = g_level_order_low_level)  or else
				(a_value = g_post_order_low_level)  or else
				(a_value = g_pre_order_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_in_order is
		do
			value := g_in_order_low_level
		end

	set_g_level_order is
		do
			value := g_level_order_low_level
		end

	set_g_post_order is
		do
			value := g_post_order_low_level
		end

	set_g_pre_order is
		do
			value := g_pre_order_low_level
		end

feature {ANY} -- Queries
	is_g_in_order: BOOLEAN is
		do
			Result := (value=g_in_order_low_level)
		end

	is_g_level_order: BOOLEAN is
		do
			Result := (value=g_level_order_low_level)
		end

	is_g_post_order: BOOLEAN is
		do
			Result := (value=g_post_order_low_level)
		end

	is_g_pre_order: BOOLEAN is
		do
			Result := (value=g_pre_order_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_in_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IN_ORDER"
 			}"
 		end

	g_level_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LEVEL_ORDER"
 			}"
 		end

	g_post_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_POST_ORDER"
 			}"
 		end

	g_pre_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PRE_ORDER"
 			}"
 		end


end -- class GTRAVERSETYPE_ENUM
