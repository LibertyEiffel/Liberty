-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKDRAWABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_drawable_get_clip_region (a_drawable: POINTER): POINTER is
 		-- gdk_drawable_get_clip_region
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drawable_get_clip_region"
		}"
		end

	gdk_drawable_get_colormap (a_drawable: POINTER): POINTER is
 		-- gdk_drawable_get_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drawable_get_colormap"
		}"
		end

	gdk_drawable_get_depth (a_drawable: POINTER): INTEGER_32 is
 		-- gdk_drawable_get_depth
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drawable_get_depth"
		}"
		end

	gdk_drawable_get_type: NATURAL_64 is
 		-- gdk_drawable_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drawable_get_type()"
		}"
		end

	gdk_drawable_get_visible_region (a_drawable: POINTER): POINTER is
 		-- gdk_drawable_get_visible_region
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drawable_get_visible_region"
		}"
		end

	gdk_drawable_set_colormap (a_drawable: POINTER; a_colormap: POINTER) is
 		-- gdk_drawable_set_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_drawable_set_colormap"
		}"
		end


end -- class GDKDRAWABLE_EXTERNALS
