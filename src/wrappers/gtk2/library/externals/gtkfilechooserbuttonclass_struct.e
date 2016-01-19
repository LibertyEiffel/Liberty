-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILECHOOSERBUTTONCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkfilechooserbuttonclass_struct_set_file_set (a_structure: POINTER; a_value: POINTER) is
			-- Setter for file_set field of GTKFILECHOOSERBUTTONCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilechooserbuttonclass_struct_set_file_set"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkfilechooserbuttonclass_struct_get_file_set (a_structure: POINTER): POINTER is
			-- Query for file_set field of GTKFILECHOOSERBUTTONCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilechooserbuttonclass_struct_get_file_set"
		}"
		end

	-- Unwrappable field __gtk_reserved1.
	-- Unwrappable field __gtk_reserved2.
	-- Unwrappable field __gtk_reserved3.
	-- Unwrappable field __gtk_reserved4.
	-- Unwrappable field __gtk_reserved5.
	-- Unwrappable field __gtk_reserved6.
	-- Unwrappable field __gtk_reserved7.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkFileChooserButtonClass"
		}"
		end

end -- class GTKFILECHOOSERBUTTONCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

