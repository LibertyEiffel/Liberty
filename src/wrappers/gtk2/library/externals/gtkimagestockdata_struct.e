-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGESTOCKDATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkimagestockdata_struct_set_stock_id (a_structure: POINTER; a_value: POINTER) is
			-- Setter for stock_id field of GTKIMAGESTOCKDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagestockdata_struct_set_stock_id"
		}"
		end

feature {} -- Low-level queries

	gtkimagestockdata_struct_get_stock_id (a_structure: POINTER): POINTER is
			-- Query for stock_id field of GTKIMAGESTOCKDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimagestockdata_struct_get_stock_id"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkImageStockData"
		}"
		end

end -- class GTKIMAGESTOCKDATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

