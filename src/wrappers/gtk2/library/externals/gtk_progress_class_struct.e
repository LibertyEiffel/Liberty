-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_PROGRESS_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_progress_class_struct_set_paint (a_structure: POINTER; a_value: POINTER) is
			-- Setter for paint field of GTK_PROGRESS_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_class_struct_set_paint"
		}"
		end

	gtk_progress_class_struct_set_update (a_structure: POINTER; a_value: POINTER) is
			-- Setter for update field of GTK_PROGRESS_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_class_struct_set_update"
		}"
		end

	gtk_progress_class_struct_set_act_mode_enter (a_structure: POINTER; a_value: POINTER) is
			-- Setter for act_mode_enter field of GTK_PROGRESS_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_class_struct_set_act_mode_enter"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_progress_class_struct_get_paint (a_structure: POINTER): POINTER is
			-- Query for paint field of GTK_PROGRESS_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_class_struct_get_paint"
		}"
		end

	gtk_progress_class_struct_get_update (a_structure: POINTER): POINTER is
			-- Query for update field of GTK_PROGRESS_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_class_struct_get_update"
		}"
		end

	gtk_progress_class_struct_get_act_mode_enter (a_structure: POINTER): POINTER is
			-- Query for act_mode_enter field of GTK_PROGRESS_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_class_struct_get_act_mode_enter"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkProgressClass"
		}"
		end

end -- class GTK_PROGRESS_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

