-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTTAGTABLECLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktexttagtableclass_struct_set_tag_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tag_changed field of GTKTEXTTAGTABLECLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtableclass_struct_set_tag_changed"
		}"
		end

	gtktexttagtableclass_struct_set_tag_added (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tag_added field of GTKTEXTTAGTABLECLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtableclass_struct_set_tag_added"
		}"
		end

	gtktexttagtableclass_struct_set_tag_removed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tag_removed field of GTKTEXTTAGTABLECLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtableclass_struct_set_tag_removed"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtktexttagtableclass_struct_get_tag_changed (a_structure: POINTER): POINTER is
			-- Query for tag_changed field of GTKTEXTTAGTABLECLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtableclass_struct_get_tag_changed"
		}"
		end

	gtktexttagtableclass_struct_get_tag_added (a_structure: POINTER): POINTER is
			-- Query for tag_added field of GTKTEXTTAGTABLECLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtableclass_struct_get_tag_added"
		}"
		end

	gtktexttagtableclass_struct_get_tag_removed (a_structure: POINTER): POINTER is
			-- Query for tag_removed field of GTKTEXTTAGTABLECLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktexttagtableclass_struct_get_tag_removed"
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
			feature_name: "sizeof__GtkTextTagTableClass"
		}"
		end

end -- class GTKTEXTTAGTABLECLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

