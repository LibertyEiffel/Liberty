-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKJOINSTYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_join_bevel_low_level)  or else
				(a_value = gdk_join_miter_low_level)  or else
				(a_value = gdk_join_round_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_join_bevel is
		do
			value := gdk_join_bevel_low_level
		end

	set_gdk_join_miter is
		do
			value := gdk_join_miter_low_level
		end

	set_gdk_join_round is
		do
			value := gdk_join_round_low_level
		end

feature {ANY} -- Queries
	is_gdk_join_bevel: BOOLEAN is
		do
			Result := (value=gdk_join_bevel_low_level)
		end

	is_gdk_join_miter: BOOLEAN is
		do
			Result := (value=gdk_join_miter_low_level)
		end

	is_gdk_join_round: BOOLEAN is
		do
			Result := (value=gdk_join_round_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_join_bevel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_JOIN_BEVEL"
 			}"
 		end

	gdk_join_miter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_JOIN_MITER"
 			}"
 		end

	gdk_join_round_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_JOIN_ROUND"
 			}"
 		end


end -- class GDKJOINSTYLE_ENUM
