-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_OWNER_CHANGE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = new_owner_low_level)  or else
				(a_value = destroy_low_level)  or else
				(a_value = close_low_level) )
		end

feature -- Setters
	default_create,
	set_new_owner is
		do
			value := new_owner_low_level
		end

	set_destroy is
		do
			value := destroy_low_level
		end

	set_close is
		do
			value := close_low_level
		end

feature -- Queries
	is_new_owner: BOOLEAN is
		do
			Result := (value=new_owner_low_level)
		end

	is_destroy: BOOLEAN is
		do
			Result := (value=destroy_low_level)
		end

	is_close: BOOLEAN is
		do
			Result := (value=close_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	new_owner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OWNER_CHANGE_NEW_OWNER"
 			}"
 		end

	destroy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OWNER_CHANGE_DESTROY"
 			}"
 		end

	close_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OWNER_CHANGE_CLOSE"
 			}"
 		end


end -- class GDK_OWNER_CHANGE_ENUM
