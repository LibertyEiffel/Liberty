-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class RTL_OPT_PASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GCC_4_9_PLUGIN_TYPES
	-- Fieldless structure
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_rtl_opt_pass"
               }"
               end

end -- class RTL_OPT_PASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
