-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGEANIMATIONDATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkimageanimationdata_struct_set_anim (a_structure: POINTER; a_value: POINTER) is
			-- Setter for anim field of GTKIMAGEANIMATIONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageanimationdata_struct_set_anim"
		}"
		end

	gtkimageanimationdata_struct_set_iter (a_structure: POINTER; a_value: POINTER) is
			-- Setter for iter field of GTKIMAGEANIMATIONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageanimationdata_struct_set_iter"
		}"
		end

	gtkimageanimationdata_struct_set_frame_timeout (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for frame_timeout field of GTKIMAGEANIMATIONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageanimationdata_struct_set_frame_timeout"
		}"
		end

feature {} -- Low-level queries

	gtkimageanimationdata_struct_get_anim (a_structure: POINTER): POINTER is
			-- Query for anim field of GTKIMAGEANIMATIONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageanimationdata_struct_get_anim"
		}"
		end

	gtkimageanimationdata_struct_get_iter (a_structure: POINTER): POINTER is
			-- Query for iter field of GTKIMAGEANIMATIONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageanimationdata_struct_get_iter"
		}"
		end

	gtkimageanimationdata_struct_get_frame_timeout (a_structure: POINTER): NATURAL_32 is
			-- Query for frame_timeout field of GTKIMAGEANIMATIONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimageanimationdata_struct_get_frame_timeout"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkImageAnimationData"
		}"
		end

end -- class GTKIMAGEANIMATIONDATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

