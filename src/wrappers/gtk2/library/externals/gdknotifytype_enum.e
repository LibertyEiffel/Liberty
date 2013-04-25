-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKNOTIFYTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_notify_ancestor_low_level)  or else
				(a_value = gdk_notify_inferior_low_level)  or else
				(a_value = gdk_notify_nonlinear_low_level)  or else
				(a_value = gdk_notify_nonlinear_virtual_low_level)  or else
				(a_value = gdk_notify_unknown_low_level)  or else
				(a_value = gdk_notify_virtual_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_notify_ancestor is
		do
			value := gdk_notify_ancestor_low_level
		end

	set_gdk_notify_inferior is
		do
			value := gdk_notify_inferior_low_level
		end

	set_gdk_notify_nonlinear is
		do
			value := gdk_notify_nonlinear_low_level
		end

	set_gdk_notify_nonlinear_virtual is
		do
			value := gdk_notify_nonlinear_virtual_low_level
		end

	set_gdk_notify_unknown is
		do
			value := gdk_notify_unknown_low_level
		end

	set_gdk_notify_virtual is
		do
			value := gdk_notify_virtual_low_level
		end

feature {ANY} -- Queries
	is_gdk_notify_ancestor: BOOLEAN is
		do
			Result := (value=gdk_notify_ancestor_low_level)
		end

	is_gdk_notify_inferior: BOOLEAN is
		do
			Result := (value=gdk_notify_inferior_low_level)
		end

	is_gdk_notify_nonlinear: BOOLEAN is
		do
			Result := (value=gdk_notify_nonlinear_low_level)
		end

	is_gdk_notify_nonlinear_virtual: BOOLEAN is
		do
			Result := (value=gdk_notify_nonlinear_virtual_low_level)
		end

	is_gdk_notify_unknown: BOOLEAN is
		do
			Result := (value=gdk_notify_unknown_low_level)
		end

	is_gdk_notify_virtual: BOOLEAN is
		do
			Result := (value=gdk_notify_virtual_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_notify_ancestor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_ANCESTOR"
 			}"
 		end

	gdk_notify_inferior_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_INFERIOR"
 			}"
 		end

	gdk_notify_nonlinear_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_NONLINEAR"
 			}"
 		end

	gdk_notify_nonlinear_virtual_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_NONLINEAR_VIRTUAL"
 			}"
 		end

	gdk_notify_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_UNKNOWN"
 			}"
 		end

	gdk_notify_virtual_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTIFY_VIRTUAL"
 			}"
 		end


end -- class GDKNOTIFYTYPE_ENUM
