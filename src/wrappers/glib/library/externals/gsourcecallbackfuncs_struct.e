-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSOURCECALLBACKFUNCS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gsourcecallbackfuncs_struct_set_ref (a_structure: POINTER; a_value: POINTER) is
			-- Setter for ref field of GSOURCECALLBACKFUNCS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcecallbackfuncs_struct_set_ref"
		}"
		end

	gsourcecallbackfuncs_struct_set_unref (a_structure: POINTER; a_value: POINTER) is
			-- Setter for unref field of GSOURCECALLBACKFUNCS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcecallbackfuncs_struct_set_unref"
		}"
		end

	gsourcecallbackfuncs_struct_set_get (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get field of GSOURCECALLBACKFUNCS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcecallbackfuncs_struct_set_get"
		}"
		end

feature {} -- Low-level queries

	gsourcecallbackfuncs_struct_get_ref (a_structure: POINTER): POINTER is
			-- Query for ref field of GSOURCECALLBACKFUNCS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcecallbackfuncs_struct_get_ref"
		}"
		end

	gsourcecallbackfuncs_struct_get_unref (a_structure: POINTER): POINTER is
			-- Query for unref field of GSOURCECALLBACKFUNCS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcecallbackfuncs_struct_get_unref"
		}"
		end

	gsourcecallbackfuncs_struct_get_get (a_structure: POINTER): POINTER is
			-- Query for get field of GSOURCECALLBACKFUNCS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcecallbackfuncs_struct_get_get"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GSourceCallbackFuncs"
		}"
		end

end -- class GSOURCECALLBACKFUNCS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

