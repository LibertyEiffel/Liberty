-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPEC_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspec_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of GPARAMSPEC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_set_name"
		}"
		end

	gparamspec_struct_set_flags (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for flags field of GPARAMSPEC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_set_flags"
		}"
		end

	gparamspec_struct_set_value_type (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for value_type field of GPARAMSPEC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_set_value_type"
		}"
		end

	gparamspec_struct_set_owner_type (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for owner_type field of GPARAMSPEC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_set_owner_type"
		}"
		end

	gparamspec_struct_set_qdata (a_structure: POINTER; a_value: POINTER) is
			-- Setter for qdata field of GPARAMSPEC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_set_qdata"
		}"
		end

	gparamspec_struct_set_ref_count (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ref_count field of GPARAMSPEC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_set_ref_count"
		}"
		end

	gparamspec_struct_set_param_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for param_id field of GPARAMSPEC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_set_param_id"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field g_type_instance.
	gparamspec_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of GPARAMSPEC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_get_name"
		}"
		end

	gparamspec_struct_get_flags (a_structure: POINTER): INTEGER is
			-- Query for flags field of GPARAMSPEC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_get_flags"
		}"
		end

	gparamspec_struct_get_value_type (a_structure: POINTER): NATURAL_64 is
			-- Query for value_type field of GPARAMSPEC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_get_value_type"
		}"
		end

	gparamspec_struct_get_owner_type (a_structure: POINTER): NATURAL_64 is
			-- Query for owner_type field of GPARAMSPEC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_get_owner_type"
		}"
		end

	-- Unwrappable field _nick.
	-- Unwrappable field _blurb.
	gparamspec_struct_get_qdata (a_structure: POINTER): POINTER is
			-- Query for qdata field of GPARAMSPEC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_get_qdata"
		}"
		end

	gparamspec_struct_get_ref_count (a_structure: POINTER): NATURAL_32 is
			-- Query for ref_count field of GPARAMSPEC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_get_ref_count"
		}"
		end

	gparamspec_struct_get_param_id (a_structure: POINTER): NATURAL_32 is
			-- Query for param_id field of GPARAMSPEC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspec_struct_get_param_id"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpec"
		}"
		end

end -- class GPARAMSPEC_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

