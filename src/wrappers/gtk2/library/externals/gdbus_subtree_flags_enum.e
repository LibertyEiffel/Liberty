-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_SUBTREE_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_dbus_subtree_flags_dispatch_to_unenumerated_nodes_low_level)  or else
				(a_value = g_dbus_subtree_flags_none_low_level) )
		end

feature -- Setters
	default_create,
	set_g_dbus_subtree_flags_dispatch_to_unenumerated_nodes is
		do
			value := g_dbus_subtree_flags_dispatch_to_unenumerated_nodes_low_level
		end

	set_g_dbus_subtree_flags_none is
		do
			value := g_dbus_subtree_flags_none_low_level
		end

feature -- Queries
	is_g_dbus_subtree_flags_dispatch_to_unenumerated_nodes: BOOLEAN is
		do
			Result := (value=g_dbus_subtree_flags_dispatch_to_unenumerated_nodes_low_level)
		end

	is_g_dbus_subtree_flags_none: BOOLEAN is
		do
			Result := (value=g_dbus_subtree_flags_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_dbus_subtree_flags_dispatch_to_unenumerated_nodes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_SUBTREE_FLAGS_DISPATCH_TO_UNENUMERATED_NODES"
 			}"
 		end

	g_dbus_subtree_flags_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_SUBTREE_FLAGS_NONE"
 			}"
 		end


end -- class GDBUS_SUBTREE_FLAGS_ENUM
