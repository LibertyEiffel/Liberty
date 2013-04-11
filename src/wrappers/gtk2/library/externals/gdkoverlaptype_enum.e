-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKOVERLAPTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_overlap_rectangle_in_low_level)  or else
				(a_value = gdk_overlap_rectangle_out_low_level)  or else
				(a_value = gdk_overlap_rectangle_part_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_overlap_rectangle_in is
		do
			value := gdk_overlap_rectangle_in_low_level
		end

	set_gdk_overlap_rectangle_out is
		do
			value := gdk_overlap_rectangle_out_low_level
		end

	set_gdk_overlap_rectangle_part is
		do
			value := gdk_overlap_rectangle_part_low_level
		end

feature {ANY} -- Queries
	is_gdk_overlap_rectangle_in: BOOLEAN is
		do
			Result := (value=gdk_overlap_rectangle_in_low_level)
		end

	is_gdk_overlap_rectangle_out: BOOLEAN is
		do
			Result := (value=gdk_overlap_rectangle_out_low_level)
		end

	is_gdk_overlap_rectangle_part: BOOLEAN is
		do
			Result := (value=gdk_overlap_rectangle_part_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_overlap_rectangle_in_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OVERLAP_RECTANGLE_IN"
 			}"
 		end

	gdk_overlap_rectangle_out_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OVERLAP_RECTANGLE_OUT"
 			}"
 		end

	gdk_overlap_rectangle_part_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OVERLAP_RECTANGLE_PART"
 			}"
 		end


end -- class GDKOVERLAPTYPE_ENUM
