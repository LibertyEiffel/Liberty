-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_FILL_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_opaque_stippled_low_level)  or else
				(a_value = gdk_solid_low_level)  or else
				(a_value = gdk_stippled_low_level)  or else
				(a_value = gdk_tiled_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_opaque_stippled is
		do
			value := gdk_opaque_stippled_low_level
		end

	set_gdk_solid is
		do
			value := gdk_solid_low_level
		end

	set_gdk_stippled is
		do
			value := gdk_stippled_low_level
		end

	set_gdk_tiled is
		do
			value := gdk_tiled_low_level
		end

feature -- Queries
	is_gdk_opaque_stippled: BOOLEAN is
		do
			Result := (value=gdk_opaque_stippled_low_level)
		end

	is_gdk_solid: BOOLEAN is
		do
			Result := (value=gdk_solid_low_level)
		end

	is_gdk_stippled: BOOLEAN is
		do
			Result := (value=gdk_stippled_low_level)
		end

	is_gdk_tiled: BOOLEAN is
		do
			Result := (value=gdk_tiled_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_opaque_stippled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OPAQUE_STIPPLED"
 			}"
 		end

	gdk_solid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SOLID"
 			}"
 		end

	gdk_stippled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_STIPPLED"
 			}"
 		end

	gdk_tiled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TILED"
 			}"
 		end


end -- class GDK_FILL_ENUM
