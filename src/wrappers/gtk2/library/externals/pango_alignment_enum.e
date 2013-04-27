-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_ALIGNMENT_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_align_center_low_level)  or else
				(a_value = pango_align_left_low_level)  or else
				(a_value = pango_align_right_low_level) )
		end

feature -- Setters
	default_create,
	set_pango_align_center is
		do
			value := pango_align_center_low_level
		end

	set_pango_align_left is
		do
			value := pango_align_left_low_level
		end

	set_pango_align_right is
		do
			value := pango_align_right_low_level
		end

feature -- Queries
	is_pango_align_center: BOOLEAN is
		do
			Result := (value=pango_align_center_low_level)
		end

	is_pango_align_left: BOOLEAN is
		do
			Result := (value=pango_align_left_low_level)
		end

	is_pango_align_right: BOOLEAN is
		do
			Result := (value=pango_align_right_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_align_center_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ALIGN_CENTER"
 			}"
 		end

	pango_align_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ALIGN_LEFT"
 			}"
 		end

	pango_align_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ALIGN_RIGHT"
 			}"
 		end


end -- class PANGO_ALIGNMENT_ENUM
