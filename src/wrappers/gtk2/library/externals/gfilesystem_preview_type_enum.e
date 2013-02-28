-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILESYSTEM_PREVIEW_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = if_always_low_level)  or else
				(a_value = if_local_low_level)  or else
				(a_value = never_low_level) )
		end

feature -- Setters
	default_create,
	set_if_always is
		do
			value := if_always_low_level
		end

	set_if_local is
		do
			value := if_local_low_level
		end

	set_never is
		do
			value := never_low_level
		end

feature -- Queries
	if_always: BOOLEAN is
		do
			Result := (value=if_always_low_level)
		end

	if_local: BOOLEAN is
		do
			Result := (value=if_local_low_level)
		end

	never: BOOLEAN is
		do
			Result := (value=never_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	if_always_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILESYSTEM_PREVIEW_TYPE_IF_ALWAYS"
 			}"
 		end

	if_local_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILESYSTEM_PREVIEW_TYPE_IF_LOCAL"
 			}"
 		end

	never_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILESYSTEM_PREVIEW_TYPE_NEVER"
 			}"
 		end


end -- class GFILESYSTEM_PREVIEW_TYPE_ENUM
