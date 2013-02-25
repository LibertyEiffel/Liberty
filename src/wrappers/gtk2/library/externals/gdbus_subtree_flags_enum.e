-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_SUBTREE_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = dispatch_to_unenumerated_nodes_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_dispatch_to_unenumerated_nodes is
		do
			value := dispatch_to_unenumerated_nodes_low_level
		end

feature -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	dispatch_to_unenumerated_nodes: BOOLEAN is
		do
			Result := (value=dispatch_to_unenumerated_nodes_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_SUBTREE_FLAGS_NONE"
 			}"
 		end

	dispatch_to_unenumerated_nodes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_SUBTREE_FLAGS_DISPATCH_TO_UNENUMERATED_NODES"
 			}"
 		end


end -- class GDBUS_SUBTREE_FLAGS_ENUM
