-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSCROLLEDWINDOWCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkscrolledwindowclass_struct_set_scrollbar_spacing (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for scrollbar_spacing field of GTKSCROLLEDWINDOWCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscrolledwindowclass_struct_set_scrollbar_spacing"
		}"
		end

	gtkscrolledwindowclass_struct_set_scroll_child (a_structure: POINTER; a_value: POINTER) is
			-- Setter for scroll_child field of GTKSCROLLEDWINDOWCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscrolledwindowclass_struct_set_scroll_child"
		}"
		end

	gtkscrolledwindowclass_struct_set_move_focus_out (a_structure: POINTER; a_value: POINTER) is
			-- Setter for move_focus_out field of GTKSCROLLEDWINDOWCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscrolledwindowclass_struct_set_move_focus_out"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkscrolledwindowclass_struct_get_scrollbar_spacing (a_structure: POINTER): INTEGER_32 is
			-- Query for scrollbar_spacing field of GTKSCROLLEDWINDOWCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscrolledwindowclass_struct_get_scrollbar_spacing"
		}"
		end

	gtkscrolledwindowclass_struct_get_scroll_child (a_structure: POINTER): POINTER is
			-- Query for scroll_child field of GTKSCROLLEDWINDOWCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscrolledwindowclass_struct_get_scroll_child"
		}"
		end

	gtkscrolledwindowclass_struct_get_move_focus_out (a_structure: POINTER): POINTER is
			-- Query for move_focus_out field of GTKSCROLLEDWINDOWCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscrolledwindowclass_struct_get_move_focus_out"
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
			feature_name: "sizeof__GtkScrolledWindowClass"
		}"
		end

end -- class GTKSCROLLEDWINDOWCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

