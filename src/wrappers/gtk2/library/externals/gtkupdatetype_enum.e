-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKUPDATETYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_update_continuous_low_level)  or else
				(a_value = gtk_update_delayed_low_level)  or else
				(a_value = gtk_update_discontinuous_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_update_continuous is
		do
			value := gtk_update_continuous_low_level
		end

	set_gtk_update_delayed is
		do
			value := gtk_update_delayed_low_level
		end

	set_gtk_update_discontinuous is
		do
			value := gtk_update_discontinuous_low_level
		end

feature {ANY} -- Queries
	is_gtk_update_continuous: BOOLEAN is
		do
			Result := (value=gtk_update_continuous_low_level)
		end

	is_gtk_update_delayed: BOOLEAN is
		do
			Result := (value=gtk_update_delayed_low_level)
		end

	is_gtk_update_discontinuous: BOOLEAN is
		do
			Result := (value=gtk_update_discontinuous_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_update_continuous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UPDATE_CONTINUOUS"
 			}"
 		end

	gtk_update_delayed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UPDATE_DELAYED"
 			}"
 		end

	gtk_update_discontinuous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UPDATE_DISCONTINUOUS"
 			}"
 		end


end -- class GTKUPDATETYPE_ENUM
