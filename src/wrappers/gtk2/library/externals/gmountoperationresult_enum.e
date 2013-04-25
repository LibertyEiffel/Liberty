-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMOUNTOPERATIONRESULT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_mount_operation_aborted_low_level)  or else
				(a_value = g_mount_operation_handled_low_level)  or else
				(a_value = g_mount_operation_unhandled_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_mount_operation_aborted is
		do
			value := g_mount_operation_aborted_low_level
		end

	set_g_mount_operation_handled is
		do
			value := g_mount_operation_handled_low_level
		end

	set_g_mount_operation_unhandled is
		do
			value := g_mount_operation_unhandled_low_level
		end

feature {ANY} -- Queries
	is_g_mount_operation_aborted: BOOLEAN is
		do
			Result := (value=g_mount_operation_aborted_low_level)
		end

	is_g_mount_operation_handled: BOOLEAN is
		do
			Result := (value=g_mount_operation_handled_low_level)
		end

	is_g_mount_operation_unhandled: BOOLEAN is
		do
			Result := (value=g_mount_operation_unhandled_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_mount_operation_aborted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MOUNT_OPERATION_ABORTED"
 			}"
 		end

	g_mount_operation_handled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MOUNT_OPERATION_HANDLED"
 			}"
 		end

	g_mount_operation_unhandled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MOUNT_OPERATION_UNHANDLED"
 			}"
 		end


end -- class GMOUNTOPERATIONRESULT_ENUM
