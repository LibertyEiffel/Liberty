-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPROGRESSCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkprogressclass_struct_set_paint (a_structure: POINTER; a_value: POINTER) is
			-- Setter for paint field of GTKPROGRESSCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogressclass_struct_set_paint"
		}"
		end

	gtkprogressclass_struct_set_update (a_structure: POINTER; a_value: POINTER) is
			-- Setter for update field of GTKPROGRESSCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogressclass_struct_set_update"
		}"
		end

	gtkprogressclass_struct_set_act_mode_enter (a_structure: POINTER; a_value: POINTER) is
			-- Setter for act_mode_enter field of GTKPROGRESSCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogressclass_struct_set_act_mode_enter"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkprogressclass_struct_get_paint (a_structure: POINTER): POINTER is
			-- Query for paint field of GTKPROGRESSCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogressclass_struct_get_paint"
		}"
		end

	gtkprogressclass_struct_get_update (a_structure: POINTER): POINTER is
			-- Query for update field of GTKPROGRESSCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogressclass_struct_get_update"
		}"
		end

	gtkprogressclass_struct_get_act_mode_enter (a_structure: POINTER): POINTER is
			-- Query for act_mode_enter field of GTKPROGRESSCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogressclass_struct_get_act_mode_enter"
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
			feature_name: "sizeof__GtkProgressClass"
		}"
		end

end -- class GTKPROGRESSCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

