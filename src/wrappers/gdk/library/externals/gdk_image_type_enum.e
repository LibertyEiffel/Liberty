-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_IMAGE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = normal_low_level)  or else
				(a_value = shared_low_level)  or else
				(a_value = fastest_low_level) )
		end

feature -- Setters
	default_create,
	set_normal is
		do
			value := normal_low_level
		end

	set_shared is
		do
			value := shared_low_level
		end

	set_fastest is
		do
			value := fastest_low_level
		end

feature -- Queries
	is_normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	is_shared: BOOLEAN is
		do
			Result := (value=shared_low_level)
		end

	is_fastest: BOOLEAN is
		do
			Result := (value=fastest_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_IMAGE_NORMAL"
 			}"
 		end

	shared_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_IMAGE_SHARED"
 			}"
 		end

	fastest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_IMAGE_FASTEST"
 			}"
 		end


end -- class GDK_IMAGE_TYPE_ENUM
