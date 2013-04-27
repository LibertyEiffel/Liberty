-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SPIN_BUTTON_UPDATE_POLICY_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_update_always_low_level)  or else
				(a_value = gtk_update_if_valid_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_update_always is
		do
			value := gtk_update_always_low_level
		end

	set_gtk_update_if_valid is
		do
			value := gtk_update_if_valid_low_level
		end

feature -- Queries
	is_gtk_update_always: BOOLEAN is
		do
			Result := (value=gtk_update_always_low_level)
		end

	is_gtk_update_if_valid: BOOLEAN is
		do
			Result := (value=gtk_update_if_valid_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_update_always_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UPDATE_ALWAYS"
 			}"
 		end

	gtk_update_if_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UPDATE_IF_VALID"
 			}"
 		end


end -- class GTK_SPIN_BUTTON_UPDATE_POLICY_ENUM
