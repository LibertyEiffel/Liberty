-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKADJUSTMENTCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkadjustmentclass_struct_set_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for changed field of GTKADJUSTMENTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustmentclass_struct_set_changed"
		}"
		end

	gtkadjustmentclass_struct_set_value_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value_changed field of GTKADJUSTMENTCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustmentclass_struct_set_value_changed"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkadjustmentclass_struct_get_changed (a_structure: POINTER): POINTER is
			-- Query for changed field of GTKADJUSTMENTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustmentclass_struct_get_changed"
		}"
		end

	gtkadjustmentclass_struct_get_value_changed (a_structure: POINTER): POINTER is
			-- Query for value_changed field of GTKADJUSTMENTCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkadjustmentclass_struct_get_value_changed"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAdjustmentClass"
		}"
		end

end -- class GTKADJUSTMENTCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

