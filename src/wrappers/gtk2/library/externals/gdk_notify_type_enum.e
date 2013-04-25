-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_NOTIFY_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ancestor_low_level)  or else
				(a_value = virtual_low_level)  or else
				(a_value = inferior_low_level)  or else
				(a_value = nonlinear_low_level)  or else
				(a_value = nonlinear_virtual_low_level)  or else
				(a_value = unknown_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_ancestor is
		do
			value := ancestor_low_level
		end

	set_virtual is
		do
			value := virtual_low_level
		end

	set_inferior is
		do
			value := inferior_low_level
		end

	set_nonlinear is
		do
			value := nonlinear_low_level
		end

	set_nonlinear_virtual is
		do
			value := nonlinear_virtual_low_level
		end

	set_unknown is
		do
			value := unknown_low_level
		end

feature {ANY} -- Queries
	ancestor: BOOLEAN is
		do
			Result := (value=ancestor_low_level)
		end

	virtual: BOOLEAN is
		do
			Result := (value=virtual_low_level)
		end

	inferior: BOOLEAN is
		do
			Result := (value=inferior_low_level)
		end

	nonlinear: BOOLEAN is
		do
			Result := (value=nonlinear_low_level)
		end

	nonlinear_virtual: BOOLEAN is
		do
			Result := (value=nonlinear_virtual_low_level)
		end

	unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ancestor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_ANCESTOR"
 			}"
 		end

	virtual_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_VIRTUAL"
 			}"
 		end

	inferior_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_INFERIOR"
 			}"
 		end

	nonlinear_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_NONLINEAR"
 			}"
 		end

	nonlinear_virtual_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_NONLINEAR_VIRTUAL"
 			}"
 		end

	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_UNKNOWN"
 			}"
 		end


end -- class GDK_NOTIFY_TYPE_ENUM
