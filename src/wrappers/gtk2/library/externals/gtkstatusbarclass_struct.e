-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSTATUSBARCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkstatusbarclass_struct_set_reserved (a_structure: POINTER; a_value: POINTER) is
			-- Setter for reserved field of GTKSTATUSBARCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkstatusbarclass_struct_set_reserved"
		}"
		end

	gtkstatusbarclass_struct_set_text_pushed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for text_pushed field of GTKSTATUSBARCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkstatusbarclass_struct_set_text_pushed"
		}"
		end

	gtkstatusbarclass_struct_set_text_popped (a_structure: POINTER; a_value: POINTER) is
			-- Setter for text_popped field of GTKSTATUSBARCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkstatusbarclass_struct_set_text_popped"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkstatusbarclass_struct_get_reserved (a_structure: POINTER): POINTER is
			-- Query for reserved field of GTKSTATUSBARCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkstatusbarclass_struct_get_reserved"
		}"
		end

	gtkstatusbarclass_struct_get_text_pushed (a_structure: POINTER): POINTER is
			-- Query for text_pushed field of GTKSTATUSBARCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkstatusbarclass_struct_get_text_pushed"
		}"
		end

	gtkstatusbarclass_struct_get_text_popped (a_structure: POINTER): POINTER is
			-- Query for text_popped field of GTKSTATUSBARCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkstatusbarclass_struct_get_text_popped"
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
			feature_name: "sizeof__GtkStatusbarClass"
		}"
		end

end -- class GTKSTATUSBARCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

