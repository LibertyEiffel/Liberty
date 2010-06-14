-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMOUNT_OPERATION_RESULT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = handled_low_level)  or else
				(a_value = aborted_low_level)  or else
				(a_value = unhandled_low_level) )
		end

feature -- Setters
	default_create,
	set_handled is
		do
			value := handled_low_level
		end

	set_aborted is
		do
			value := aborted_low_level
		end

	set_unhandled is
		do
			value := unhandled_low_level
		end

feature -- Queries
	is_handled: BOOLEAN is
		do
			Result := (value=handled_low_level)
		end

	is_aborted: BOOLEAN is
		do
			Result := (value=aborted_low_level)
		end

	is_unhandled: BOOLEAN is
		do
			Result := (value=unhandled_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	handled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MOUNT_OPERATION_HANDLED"
 			}"
 		end

	aborted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MOUNT_OPERATION_ABORTED"
 			}"
 		end

	unhandled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MOUNT_OPERATION_UNHANDLED"
 			}"
 		end


end -- class GMOUNT_OPERATION_RESULT_ENUM
