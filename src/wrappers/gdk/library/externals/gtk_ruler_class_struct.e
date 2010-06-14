-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_RULER_CLASS_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_ruler_class_struct_set_draw_ticks (a_structure: POINTER; a_value: POINTER) is
			-- Setter for draw_ticks field of GTK_RULER_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ruler_class_struct_set_draw_ticks"
		}"
		end

	gtk_ruler_class_struct_set_draw_pos (a_structure: POINTER; a_value: POINTER) is
			-- Setter for draw_pos field of GTK_RULER_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ruler_class_struct_set_draw_pos"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_ruler_class_struct_get_draw_ticks (a_structure: POINTER): POINTER is
			-- Query for draw_ticks field of GTK_RULER_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ruler_class_struct_get_draw_ticks"
		}"
		end

	gtk_ruler_class_struct_get_draw_pos (a_structure: POINTER): POINTER is
			-- Query for draw_pos field of GTK_RULER_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ruler_class_struct_get_draw_pos"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRulerClass"
		}"
		end

end -- class GTK_RULER_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

