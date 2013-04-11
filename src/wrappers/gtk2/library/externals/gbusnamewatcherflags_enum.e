-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GBUSNAMEWATCHERFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_bus_name_watcher_flags_auto_start_low_level)  or else
				(a_value = g_bus_name_watcher_flags_none_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_bus_name_watcher_flags_auto_start is
		do
			value := g_bus_name_watcher_flags_auto_start_low_level
		end

	set_g_bus_name_watcher_flags_none is
		do
			value := g_bus_name_watcher_flags_none_low_level
		end

feature {ANY} -- Queries
	is_g_bus_name_watcher_flags_auto_start: BOOLEAN is
		do
			Result := (value=g_bus_name_watcher_flags_auto_start_low_level)
		end

	is_g_bus_name_watcher_flags_none: BOOLEAN is
		do
			Result := (value=g_bus_name_watcher_flags_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_bus_name_watcher_flags_auto_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BUS_NAME_WATCHER_FLAGS_AUTO_START"
 			}"
 		end

	g_bus_name_watcher_flags_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BUS_NAME_WATCHER_FLAGS_NONE"
 			}"
 		end


end -- class GBUSNAMEWATCHERFLAGS_ENUM
