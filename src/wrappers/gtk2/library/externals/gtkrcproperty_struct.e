-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRCPROPERTY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkrcproperty_struct_set_type_name (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for type_name field of GTKRCPROPERTY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrcproperty_struct_set_type_name"
		}"
		end

	gtkrcproperty_struct_set_property_name (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for property_name field of GTKRCPROPERTY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrcproperty_struct_set_property_name"
		}"
		end

	gtkrcproperty_struct_set_origin (a_structure: POINTER; a_value: POINTER) is
			-- Setter for origin field of GTKRCPROPERTY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrcproperty_struct_set_origin"
		}"
		end

feature {} -- Low-level queries

	gtkrcproperty_struct_get_type_name (a_structure: POINTER): NATURAL_32 is
			-- Query for type_name field of GTKRCPROPERTY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrcproperty_struct_get_type_name"
		}"
		end

	gtkrcproperty_struct_get_property_name (a_structure: POINTER): NATURAL_32 is
			-- Query for property_name field of GTKRCPROPERTY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrcproperty_struct_get_property_name"
		}"
		end

	gtkrcproperty_struct_get_origin (a_structure: POINTER): POINTER is
			-- Query for origin field of GTKRCPROPERTY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrcproperty_struct_get_origin"
		}"
		end

	-- Unwrappable field value.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRcProperty"
		}"
		end

end -- class GTKRCPROPERTY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

