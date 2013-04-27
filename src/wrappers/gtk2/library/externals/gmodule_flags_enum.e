-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMODULE_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_module_bind_lazy_low_level)  or else
				(a_value = g_module_bind_local_low_level)  or else
				(a_value = g_module_bind_mask_low_level) )
		end

feature -- Setters
	default_create,
	set_g_module_bind_lazy is
		do
			value := g_module_bind_lazy_low_level
		end

	set_g_module_bind_local is
		do
			value := g_module_bind_local_low_level
		end

	set_g_module_bind_mask is
		do
			value := g_module_bind_mask_low_level
		end

feature -- Queries
	is_g_module_bind_lazy: BOOLEAN is
		do
			Result := (value=g_module_bind_lazy_low_level)
		end

	is_g_module_bind_local: BOOLEAN is
		do
			Result := (value=g_module_bind_local_low_level)
		end

	is_g_module_bind_mask: BOOLEAN is
		do
			Result := (value=g_module_bind_mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_module_bind_lazy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MODULE_BIND_LAZY"
 			}"
 		end

	g_module_bind_local_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MODULE_BIND_LOCAL"
 			}"
 		end

	g_module_bind_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MODULE_BIND_MASK"
 			}"
 		end


end -- class GMODULE_FLAGS_ENUM
