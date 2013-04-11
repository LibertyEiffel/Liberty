-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class UBUNTUMENUPROXYCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	ubuntumenuproxyclass_struct_set_insert_field (a_structure: POINTER; a_value: POINTER) is
			-- Setter for insert field of UBUNTUMENUPROXYCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxyclass_struct_set_insert_field"
		}"
		end

	ubuntumenuproxyclass_struct_set_show_local (a_structure: POINTER; a_value: POINTER) is
			-- Setter for show_local field of UBUNTUMENUPROXYCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxyclass_struct_set_show_local"
		}"
		end

	ubuntumenuproxyclass_struct_set_inserted (a_structure: POINTER; a_value: POINTER) is
			-- Setter for inserted field of UBUNTUMENUPROXYCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxyclass_struct_set_inserted"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	ubuntumenuproxyclass_struct_get_insert_field (a_structure: POINTER): POINTER is
			-- Query for insert field of UBUNTUMENUPROXYCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxyclass_struct_get_insert_field"
		}"
		end

	ubuntumenuproxyclass_struct_get_show_local (a_structure: POINTER): POINTER is
			-- Query for show_local field of UBUNTUMENUPROXYCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxyclass_struct_get_show_local"
		}"
		end

	ubuntumenuproxyclass_struct_get_inserted (a_structure: POINTER): POINTER is
			-- Query for inserted field of UBUNTUMENUPROXYCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntumenuproxyclass_struct_get_inserted"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__UbuntuMenuProxyClass"
		}"
		end

end -- class UBUNTUMENUPROXYCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

