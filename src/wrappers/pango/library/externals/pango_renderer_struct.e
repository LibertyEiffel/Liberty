-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_RENDERER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_renderer_struct_set_underline (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for underline field of PANGO_RENDERER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_struct_set_underline"
		}"
		end

	pango_renderer_struct_set_strikethrough (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for strikethrough field of PANGO_RENDERER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_struct_set_strikethrough"
		}"
		end

	pango_renderer_struct_set_active_count (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for active_count field of PANGO_RENDERER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_struct_set_active_count"
		}"
		end

	pango_renderer_struct_set_matrix (a_structure: POINTER; a_value: POINTER) is
			-- Setter for matrix field of PANGO_RENDERER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_struct_set_matrix"
		}"
		end

	pango_renderer_struct_set_priv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv field of PANGO_RENDERER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_struct_set_priv"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	pango_renderer_struct_get_underline (a_structure: POINTER): INTEGER is
			-- Query for underline field of PANGO_RENDERER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_struct_get_underline"
		}"
		end

	pango_renderer_struct_get_strikethrough (a_structure: POINTER): INTEGER_32 is
			-- Query for strikethrough field of PANGO_RENDERER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_struct_get_strikethrough"
		}"
		end

	pango_renderer_struct_get_active_count (a_structure: POINTER): INTEGER_32 is
			-- Query for active_count field of PANGO_RENDERER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_struct_get_active_count"
		}"
		end

	pango_renderer_struct_get_matrix (a_structure: POINTER): POINTER is
			-- Query for matrix field of PANGO_RENDERER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_struct_get_matrix"
		}"
		end

	pango_renderer_struct_get_priv (a_structure: POINTER): POINTER is
			-- Query for priv field of PANGO_RENDERER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_renderer_struct_get_priv"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoRenderer"
		}"
		end

end -- class PANGO_RENDERER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

