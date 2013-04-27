-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMOUNT_MOUNT_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_mount_mount_none_low_level) )
		end

feature -- Setters
	default_create,
	set_g_mount_mount_none is
		do
			value := g_mount_mount_none_low_level
		end

feature -- Queries
	is_g_mount_mount_none: BOOLEAN is
		do
			Result := (value=g_mount_mount_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_mount_mount_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MOUNT_MOUNT_NONE"
 			}"
 		end


end -- class GMOUNT_MOUNT_FLAGS_ENUM
