-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_IMAGE_ANIMATION_DATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_image_animation_data_struct_set_anim (a_structure: POINTER; a_value: POINTER) is
			-- Setter for anim field of GTK_IMAGE_ANIMATION_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_animation_data_struct_set_anim"
		}"
		end

	gtk_image_animation_data_struct_set_iter (a_structure: POINTER; a_value: POINTER) is
			-- Setter for iter field of GTK_IMAGE_ANIMATION_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_animation_data_struct_set_iter"
		}"
		end

	gtk_image_animation_data_struct_set_frame_timeout (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for frame_timeout field of GTK_IMAGE_ANIMATION_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_animation_data_struct_set_frame_timeout"
		}"
		end

feature {} -- Low-level queries

	gtk_image_animation_data_struct_get_anim (a_structure: POINTER): POINTER is
			-- Query for anim field of GTK_IMAGE_ANIMATION_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_animation_data_struct_get_anim"
		}"
		end

	gtk_image_animation_data_struct_get_iter (a_structure: POINTER): POINTER is
			-- Query for iter field of GTK_IMAGE_ANIMATION_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_animation_data_struct_get_iter"
		}"
		end

	gtk_image_animation_data_struct_get_frame_timeout (a_structure: POINTER): NATURAL is
			-- Query for frame_timeout field of GTK_IMAGE_ANIMATION_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_animation_data_struct_get_frame_timeout"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkImageAnimationData"
		}"
		end

end -- class GTK_IMAGE_ANIMATION_DATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

