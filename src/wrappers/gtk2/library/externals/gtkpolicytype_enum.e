-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKPOLICYTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_policy_always_low_level)  or else
				(a_value = gtk_policy_automatic_low_level)  or else
				(a_value = gtk_policy_never_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_policy_always is
		do
			value := gtk_policy_always_low_level
		end

	set_gtk_policy_automatic is
		do
			value := gtk_policy_automatic_low_level
		end

	set_gtk_policy_never is
		do
			value := gtk_policy_never_low_level
		end

feature {ANY} -- Queries
	is_gtk_policy_always: BOOLEAN is
		do
			Result := (value=gtk_policy_always_low_level)
		end

	is_gtk_policy_automatic: BOOLEAN is
		do
			Result := (value=gtk_policy_automatic_low_level)
		end

	is_gtk_policy_never: BOOLEAN is
		do
			Result := (value=gtk_policy_never_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_policy_always_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_POLICY_ALWAYS"
 			}"
 		end

	gtk_policy_automatic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_POLICY_AUTOMATIC"
 			}"
 		end

	gtk_policy_never_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_POLICY_NEVER"
 			}"
 		end


end -- class GTKPOLICYTYPE_ENUM
