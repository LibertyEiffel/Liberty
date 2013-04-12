-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKAPPLAUNCHCONTEXT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GDK_TYPES
feature {} -- Low-level setters

	gdkapplaunchcontext_struct_set_priv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv field of GDKAPPLAUNCHCONTEXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkapplaunchcontext_struct_set_priv"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gdkapplaunchcontext_struct_get_priv (a_structure: POINTER): POINTER is
			-- Query for priv field of GDKAPPLAUNCHCONTEXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdkapplaunchcontext_struct_get_priv"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_GdkAppLaunchContext"
		}"
		end

end -- class GDKAPPLAUNCHCONTEXT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

