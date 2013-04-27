-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_VISIBILITY_STATE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_visibility_fully_obscured_low_level)  or else
				(a_value = gdk_visibility_partial_low_level)  or else
				(a_value = gdk_visibility_unobscured_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_visibility_fully_obscured is
		do
			value := gdk_visibility_fully_obscured_low_level
		end

	set_gdk_visibility_partial is
		do
			value := gdk_visibility_partial_low_level
		end

	set_gdk_visibility_unobscured is
		do
			value := gdk_visibility_unobscured_low_level
		end

feature -- Queries
	is_gdk_visibility_fully_obscured: BOOLEAN is
		do
			Result := (value=gdk_visibility_fully_obscured_low_level)
		end

	is_gdk_visibility_partial: BOOLEAN is
		do
			Result := (value=gdk_visibility_partial_low_level)
		end

	is_gdk_visibility_unobscured: BOOLEAN is
		do
			Result := (value=gdk_visibility_unobscured_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_visibility_fully_obscured_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISIBILITY_FULLY_OBSCURED"
 			}"
 		end

	gdk_visibility_partial_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISIBILITY_PARTIAL"
 			}"
 		end

	gdk_visibility_unobscured_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISIBILITY_UNOBSCURED"
 			}"
 		end


end -- class GDK_VISIBILITY_STATE_ENUM
