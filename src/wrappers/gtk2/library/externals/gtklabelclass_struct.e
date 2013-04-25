-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLABELCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtklabelclass_struct_set_move_cursor (a_structure: POINTER; a_value: POINTER) is
			-- Setter for move_cursor field of GTKLABELCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtklabelclass_struct_set_move_cursor"
		}"
		end

	gtklabelclass_struct_set_copy_clipboard (a_structure: POINTER; a_value: POINTER) is
			-- Setter for copy_clipboard field of GTKLABELCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtklabelclass_struct_set_copy_clipboard"
		}"
		end

	gtklabelclass_struct_set_populate_popup (a_structure: POINTER; a_value: POINTER) is
			-- Setter for populate_popup field of GTKLABELCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtklabelclass_struct_set_populate_popup"
		}"
		end

	gtklabelclass_struct_set_activate_link (a_structure: POINTER; a_value: POINTER) is
			-- Setter for activate_link field of GTKLABELCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtklabelclass_struct_set_activate_link"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtklabelclass_struct_get_move_cursor (a_structure: POINTER): POINTER is
			-- Query for move_cursor field of GTKLABELCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtklabelclass_struct_get_move_cursor"
		}"
		end

	gtklabelclass_struct_get_copy_clipboard (a_structure: POINTER): POINTER is
			-- Query for copy_clipboard field of GTKLABELCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtklabelclass_struct_get_copy_clipboard"
		}"
		end

	gtklabelclass_struct_get_populate_popup (a_structure: POINTER): POINTER is
			-- Query for populate_popup field of GTKLABELCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtklabelclass_struct_get_populate_popup"
		}"
		end

	gtklabelclass_struct_get_activate_link (a_structure: POINTER): POINTER is
			-- Query for activate_link field of GTKLABELCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtklabelclass_struct_get_activate_link"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkLabelClass"
		}"
		end

end -- class GTKLABELCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

