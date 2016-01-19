-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSOURCEFUNCS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gsourcefuncs_struct_set_prepare (a_structure: POINTER; a_value: POINTER) is
			-- Setter for prepare field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_set_prepare"
		}"
		end

	gsourcefuncs_struct_set_check_field (a_structure: POINTER; a_value: POINTER) is
			-- Setter for check field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_set_check_field"
		}"
		end

	gsourcefuncs_struct_set_dispatch (a_structure: POINTER; a_value: POINTER) is
			-- Setter for dispatch field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_set_dispatch"
		}"
		end

	gsourcefuncs_struct_set_finalize (a_structure: POINTER; a_value: POINTER) is
			-- Setter for finalize field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_set_finalize"
		}"
		end

	gsourcefuncs_struct_set_closure_callback (a_structure: POINTER; a_value: POINTER) is
			-- Setter for closure_callback field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_set_closure_callback"
		}"
		end

	gsourcefuncs_struct_set_closure_marshal (a_structure: POINTER; a_value: POINTER) is
			-- Setter for closure_marshal field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_set_closure_marshal"
		}"
		end

feature {} -- Low-level queries

	gsourcefuncs_struct_get_prepare (a_structure: POINTER): POINTER is
			-- Query for prepare field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_get_prepare"
		}"
		end

	gsourcefuncs_struct_get_check_field (a_structure: POINTER): POINTER is
			-- Query for check field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_get_check_field"
		}"
		end

	gsourcefuncs_struct_get_dispatch (a_structure: POINTER): POINTER is
			-- Query for dispatch field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_get_dispatch"
		}"
		end

	gsourcefuncs_struct_get_finalize (a_structure: POINTER): POINTER is
			-- Query for finalize field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_get_finalize"
		}"
		end

	gsourcefuncs_struct_get_closure_callback (a_structure: POINTER): POINTER is
			-- Query for closure_callback field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_get_closure_callback"
		}"
		end

	gsourcefuncs_struct_get_closure_marshal (a_structure: POINTER): POINTER is
			-- Query for closure_marshal field of GSOURCEFUNCS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsourcefuncs_struct_get_closure_marshal"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GSourceFuncs"
		}"
		end

end -- class GSOURCEFUNCS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

