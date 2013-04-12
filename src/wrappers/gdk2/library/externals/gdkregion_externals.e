-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKREGION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_region_copy (a_region: POINTER): POINTER is
 		-- gdk_region_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_copy"
		}"
		end

	gdk_region_destroy (a_region: POINTER) is
 		-- gdk_region_destroy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_destroy"
		}"
		end

	gdk_region_empty (a_region: POINTER): INTEGER_32 is
 		-- gdk_region_empty
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_empty"
		}"
		end

	gdk_region_equal (a_region1: POINTER; a_region2: POINTER): INTEGER_32 is
 		-- gdk_region_equal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_equal"
		}"
		end

	gdk_region_get_clipbox (a_region: POINTER; a_rectangle: POINTER) is
 		-- gdk_region_get_clipbox
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_get_clipbox"
		}"
		end

	gdk_region_get_rectangles (a_region: POINTER; a_rectangles: POINTER; a_n_rectangles: POINTER) is
 		-- gdk_region_get_rectangles
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_get_rectangles"
		}"
		end

	gdk_region_intersect (a_source1: POINTER; a_source2: POINTER) is
 		-- gdk_region_intersect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_intersect"
		}"
		end

	gdk_region_new: POINTER is
 		-- gdk_region_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_new()"
		}"
		end

	gdk_region_offset (a_region: POINTER; a_dx: INTEGER_32; a_dy: INTEGER_32) is
 		-- gdk_region_offset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_offset"
		}"
		end

	gdk_region_point_in (a_region: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): INTEGER_32 is
 		-- gdk_region_point_in
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_point_in"
		}"
		end

	gdk_region_rect_in (a_region: POINTER; a_rectangle: POINTER): INTEGER is
 		-- gdk_region_rect_in
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_rect_in"
		}"
		end

	gdk_region_rectangle (a_rectangle: POINTER): POINTER is
 		-- gdk_region_rectangle
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_rectangle"
		}"
		end

	gdk_region_subtract (a_source1: POINTER; a_source2: POINTER) is
 		-- gdk_region_subtract
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_subtract"
		}"
		end

	gdk_region_union (a_source1: POINTER; a_source2: POINTER) is
 		-- gdk_region_union
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_union"
		}"
		end

	gdk_region_union_with_rect (a_region: POINTER; a_rect: POINTER) is
 		-- gdk_region_union_with_rect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_union_with_rect"
		}"
		end

	gdk_region_xor (a_source1: POINTER; a_source2: POINTER) is
 		-- gdk_region_xor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_region_xor"
		}"
		end


end -- class GDKREGION_EXTERNALS
