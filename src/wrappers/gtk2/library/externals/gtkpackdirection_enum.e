-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKPACKDIRECTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_pack_direction_btt_low_level)  or else
				(a_value = gtk_pack_direction_ltr_low_level)  or else
				(a_value = gtk_pack_direction_rtl_low_level)  or else
				(a_value = gtk_pack_direction_ttb_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_pack_direction_btt is
		do
			value := gtk_pack_direction_btt_low_level
		end

	set_gtk_pack_direction_ltr is
		do
			value := gtk_pack_direction_ltr_low_level
		end

	set_gtk_pack_direction_rtl is
		do
			value := gtk_pack_direction_rtl_low_level
		end

	set_gtk_pack_direction_ttb is
		do
			value := gtk_pack_direction_ttb_low_level
		end

feature {ANY} -- Queries
	is_gtk_pack_direction_btt: BOOLEAN is
		do
			Result := (value=gtk_pack_direction_btt_low_level)
		end

	is_gtk_pack_direction_ltr: BOOLEAN is
		do
			Result := (value=gtk_pack_direction_ltr_low_level)
		end

	is_gtk_pack_direction_rtl: BOOLEAN is
		do
			Result := (value=gtk_pack_direction_rtl_low_level)
		end

	is_gtk_pack_direction_ttb: BOOLEAN is
		do
			Result := (value=gtk_pack_direction_ttb_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_pack_direction_btt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PACK_DIRECTION_BTT"
 			}"
 		end

	gtk_pack_direction_ltr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PACK_DIRECTION_LTR"
 			}"
 		end

	gtk_pack_direction_rtl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PACK_DIRECTION_RTL"
 			}"
 		end

	gtk_pack_direction_ttb_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PACK_DIRECTION_TTB"
 			}"
 		end


end -- class GTKPACKDIRECTION_ENUM
