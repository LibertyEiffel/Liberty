-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERERPROGRESS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcellrendererprogress_struct_set_priv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv field of GTKCELLRENDERERPROGRESS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendererprogress_struct_set_priv"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtkcellrendererprogress_struct_get_priv (a_structure: POINTER): POINTER is
			-- Query for priv field of GTKCELLRENDERERPROGRESS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcellrendererprogress_struct_get_priv"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellRendererProgress"
		}"
		end

end -- class GTKCELLRENDERERPROGRESS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

