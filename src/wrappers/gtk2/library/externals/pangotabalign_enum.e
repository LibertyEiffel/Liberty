-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGOTABALIGN_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_tab_left_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_pango_tab_left is
		do
			value := pango_tab_left_low_level
		end

feature {ANY} -- Queries
	is_pango_tab_left: BOOLEAN is
		do
			Result := (value=pango_tab_left_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_tab_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_TAB_LEFT"
 			}"
 		end


end -- class PANGOTABALIGN_ENUM
