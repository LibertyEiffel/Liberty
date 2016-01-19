-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GBUS_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_bus_type_none_low_level)  or else
				(a_value = g_bus_type_session_low_level)  or else
				(a_value = g_bus_type_starter_low_level)  or else
				(a_value = g_bus_type_system_low_level) )
		end

feature -- Setters
	default_create,
	set_g_bus_type_none is
		do
			value := g_bus_type_none_low_level
		end

	set_g_bus_type_session is
		do
			value := g_bus_type_session_low_level
		end

	set_g_bus_type_starter is
		do
			value := g_bus_type_starter_low_level
		end

	set_g_bus_type_system is
		do
			value := g_bus_type_system_low_level
		end

feature -- Queries
	is_g_bus_type_none: BOOLEAN is
		do
			Result := (value=g_bus_type_none_low_level)
		end

	is_g_bus_type_session: BOOLEAN is
		do
			Result := (value=g_bus_type_session_low_level)
		end

	is_g_bus_type_starter: BOOLEAN is
		do
			Result := (value=g_bus_type_starter_low_level)
		end

	is_g_bus_type_system: BOOLEAN is
		do
			Result := (value=g_bus_type_system_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_bus_type_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BUS_TYPE_NONE"
 			}"
 		end

	g_bus_type_session_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BUS_TYPE_SESSION"
 			}"
 		end

	g_bus_type_starter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BUS_TYPE_STARTER"
 			}"
 		end

	g_bus_type_system_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BUS_TYPE_SYSTEM"
 			}"
 		end


end -- class GBUS_TYPE_ENUM
