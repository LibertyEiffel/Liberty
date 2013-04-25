-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ANALYSIS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	PANGO_TYPES
feature {} -- Low-level setters

	pango_analysis_struct_set_shape_engine (a_structure: POINTER; a_value: POINTER) is
			-- Setter for shape_engine field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_set_shape_engine"
		}"
		end

	pango_analysis_struct_set_lang_engine (a_structure: POINTER; a_value: POINTER) is
			-- Setter for lang_engine field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_set_lang_engine"
		}"
		end

	pango_analysis_struct_set_font (a_structure: POINTER; a_value: POINTER) is
			-- Setter for font field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_set_font"
		}"
		end

	pango_analysis_struct_set_level (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for level field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_set_level"
		}"
		end

	pango_analysis_struct_set_gravity (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for gravity field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_set_gravity"
		}"
		end

	pango_analysis_struct_set_flags (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for flags field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_set_flags"
		}"
		end

	pango_analysis_struct_set_script (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for script field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_set_script"
		}"
		end

	pango_analysis_struct_set_language (a_structure: POINTER; a_value: POINTER) is
			-- Setter for language field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_set_language"
		}"
		end

	pango_analysis_struct_set_extra_attrs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for extra_attrs field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_set_extra_attrs"
		}"
		end

feature {} -- Low-level queries

	pango_analysis_struct_get_shape_engine (a_structure: POINTER): POINTER is
			-- Query for shape_engine field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_get_shape_engine"
		}"
		end

	pango_analysis_struct_get_lang_engine (a_structure: POINTER): POINTER is
			-- Query for lang_engine field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_get_lang_engine"
		}"
		end

	pango_analysis_struct_get_font (a_structure: POINTER): POINTER is
			-- Query for font field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_get_font"
		}"
		end

	pango_analysis_struct_get_level (a_structure: POINTER): CHARACTER is
			-- Query for level field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_get_level"
		}"
		end

	pango_analysis_struct_get_gravity (a_structure: POINTER): CHARACTER is
			-- Query for gravity field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_get_gravity"
		}"
		end

	pango_analysis_struct_get_flags (a_structure: POINTER): CHARACTER is
			-- Query for flags field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_get_flags"
		}"
		end

	pango_analysis_struct_get_script (a_structure: POINTER): CHARACTER is
			-- Query for script field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_get_script"
		}"
		end

	pango_analysis_struct_get_language (a_structure: POINTER): POINTER is
			-- Query for language field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_get_language"
		}"
		end

	pango_analysis_struct_get_extra_attrs (a_structure: POINTER): POINTER is
			-- Query for extra_attrs field of PANGO_ANALYSIS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_analysis_struct_get_extra_attrs"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__PangoAnalysis"
		}"
		end

end -- class PANGO_ANALYSIS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

