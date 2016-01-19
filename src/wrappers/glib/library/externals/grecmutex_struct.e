-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GRECMUTEX_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	grecmutex_struct_set_p (a_structure: POINTER; a_value: POINTER) is
			-- Setter for p field of GRECMUTEX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "grecmutex_struct_set_p"
		}"
		end

	grecmutex_struct_set_i (a_structure: POINTER; a_value: POINTER) is
			-- Setter for i field of GRECMUTEX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "grecmutex_struct_set_i"
		}"
		end

feature {} -- Low-level queries

	grecmutex_struct_get_p (a_structure: POINTER): POINTER is
			-- Query for p field of GRECMUTEX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "grecmutex_struct_get_p"
		}"
		end

	grecmutex_struct_get_i (a_structure: POINTER): POINTER is
			-- Query for i field of GRECMUTEX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "grecmutex_struct_get_i"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GRecMutex"
		}"
		end

end -- class GRECMUTEX_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

