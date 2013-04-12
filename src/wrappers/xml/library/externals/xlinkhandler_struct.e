-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XLINKHANDLER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	LIBXML2_TYPES
feature {} -- Low-level setters

	xlinkhandler_struct_set_simple (a_structure: POINTER; a_value: POINTER) is
			-- Setter for simple field of XLINKHANDLER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlinkhandler_struct_set_simple"
		}"
		end

	xlinkhandler_struct_set_extended (a_structure: POINTER; a_value: POINTER) is
			-- Setter for extended field of XLINKHANDLER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlinkhandler_struct_set_extended"
		}"
		end

	xlinkhandler_struct_set_set (a_structure: POINTER; a_value: POINTER) is
			-- Setter for set field of XLINKHANDLER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlinkhandler_struct_set_set"
		}"
		end

feature {} -- Low-level queries

	xlinkhandler_struct_get_simple (a_structure: POINTER): POINTER is
			-- Query for simple field of XLINKHANDLER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlinkhandler_struct_get_simple"
		}"
		end

	xlinkhandler_struct_get_extended (a_structure: POINTER): POINTER is
			-- Query for extended field of XLINKHANDLER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlinkhandler_struct_get_extended"
		}"
		end

	xlinkhandler_struct_get_set (a_structure: POINTER): POINTER is
			-- Query for set field of XLINKHANDLER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlinkhandler_struct_get_set"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__xlinkHandler"
		}"
		end

end -- class XLINKHANDLER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

