-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKVISUAL_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_list_visuals: POINTER is
 		-- gdk_list_visuals
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_list_visuals()"
		}"
		end

	gdk_query_depths (a_depths: POINTER; a_count: POINTER) is
 		-- gdk_query_depths
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_query_depths"
		}"
		end

	gdk_query_visual_types (a_visual_types: POINTER; a_count: POINTER) is
 		-- gdk_query_visual_types
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_query_visual_types"
		}"
		end

	gdk_visual_get_best: POINTER is
 		-- gdk_visual_get_best
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_best()"
		}"
		end

	gdk_visual_get_best_depth: INTEGER_32 is
 		-- gdk_visual_get_best_depth
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_best_depth()"
		}"
		end

	gdk_visual_get_best_type: INTEGER is
 		-- gdk_visual_get_best_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_best_type()"
		}"
		end

	gdk_visual_get_best_with_both (a_depth: INTEGER_32; a_visual_type: INTEGER): POINTER is
 		-- gdk_visual_get_best_with_both
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_best_with_both"
		}"
		end

	gdk_visual_get_best_with_depth (a_depth: INTEGER_32): POINTER is
 		-- gdk_visual_get_best_with_depth
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_best_with_depth"
		}"
		end

	gdk_visual_get_best_with_type (a_visual_type: INTEGER): POINTER is
 		-- gdk_visual_get_best_with_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_best_with_type"
		}"
		end

	gdk_visual_get_bits_per_rgb (a_visual: POINTER): INTEGER_32 is
 		-- gdk_visual_get_bits_per_rgb
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_bits_per_rgb"
		}"
		end

	gdk_visual_get_blue_pixel_details (a_visual: POINTER; a_mask: POINTER; a_shift: POINTER; a_precision: POINTER) is
 		-- gdk_visual_get_blue_pixel_details
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_blue_pixel_details"
		}"
		end

	gdk_visual_get_byte_order (a_visual: POINTER): INTEGER is
 		-- gdk_visual_get_byte_order
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_byte_order"
		}"
		end

	gdk_visual_get_colormap_size (a_visual: POINTER): INTEGER_32 is
 		-- gdk_visual_get_colormap_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_colormap_size"
		}"
		end

	gdk_visual_get_depth (a_visual: POINTER): INTEGER_32 is
 		-- gdk_visual_get_depth
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_depth"
		}"
		end

	gdk_visual_get_green_pixel_details (a_visual: POINTER; a_mask: POINTER; a_shift: POINTER; a_precision: POINTER) is
 		-- gdk_visual_get_green_pixel_details
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_green_pixel_details"
		}"
		end

	gdk_visual_get_red_pixel_details (a_visual: POINTER; a_mask: POINTER; a_shift: POINTER; a_precision: POINTER) is
 		-- gdk_visual_get_red_pixel_details
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_red_pixel_details"
		}"
		end

	gdk_visual_get_screen (a_visual: POINTER): POINTER is
 		-- gdk_visual_get_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_screen"
		}"
		end

	gdk_visual_get_system: POINTER is
 		-- gdk_visual_get_system
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_system()"
		}"
		end

	gdk_visual_get_type: NATURAL_64 is
 		-- gdk_visual_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_type()"
		}"
		end

	gdk_visual_get_visual_type (a_visual: POINTER): INTEGER is
 		-- gdk_visual_get_visual_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_visual_get_visual_type"
		}"
		end


end -- class GDKVISUAL_EXTERNALS
