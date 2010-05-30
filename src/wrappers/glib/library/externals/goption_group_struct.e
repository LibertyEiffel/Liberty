-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GOPTION_GROUP_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
	-- Fieldless structure
feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GOptionGroup"
		}"
		end

end -- class GOPTION_GROUP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

