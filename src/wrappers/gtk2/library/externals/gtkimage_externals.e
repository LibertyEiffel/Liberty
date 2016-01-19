-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_image_clear (an_image: POINTER) is
 		-- gtk_image_clear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_clear"
		}"
		end

	gtk_image_get_animation (an_image: POINTER): POINTER is
 		-- gtk_image_get_animation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_animation"
		}"
		end

	gtk_image_get_gicon (an_image: POINTER; a_gicon: POINTER; a_size: POINTER) is
 		-- gtk_image_get_gicon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_gicon"
		}"
		end

	gtk_image_get_icon_name (an_image: POINTER; an_icon_name: POINTER; a_size: POINTER) is
 		-- gtk_image_get_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_icon_name"
		}"
		end

	gtk_image_get_icon_set (an_image: POINTER; an_icon_set: POINTER; a_size: POINTER) is
 		-- gtk_image_get_icon_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_icon_set"
		}"
		end

	gtk_image_get_image (an_image: POINTER; a_gdk_image: POINTER; a_mask: POINTER) is
 		-- gtk_image_get_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_image"
		}"
		end

	gtk_image_get_pixbuf (an_image: POINTER): POINTER is
 		-- gtk_image_get_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_pixbuf"
		}"
		end

	gtk_image_get_pixel_size (an_image: POINTER): INTEGER is
 		-- gtk_image_get_pixel_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_pixel_size"
		}"
		end

	gtk_image_get_pixmap (an_image: POINTER; a_pixmap: POINTER; a_mask: POINTER) is
 		-- gtk_image_get_pixmap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_pixmap"
		}"
		end

	gtk_image_get_stock (an_image: POINTER; a_stock_id: POINTER; a_size: POINTER) is
 		-- gtk_image_get_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_stock"
		}"
		end

	gtk_image_get_storage_type (an_image: POINTER): INTEGER is
 		-- gtk_image_get_storage_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_storage_type"
		}"
		end

	gtk_image_get_type: like long_unsigned is
 		-- gtk_image_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_type()"
		}"
		end

	gtk_image_new: POINTER is
 		-- gtk_image_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new()"
		}"
		end

	gtk_image_new_from_animation (an_animation: POINTER): POINTER is
 		-- gtk_image_new_from_animation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_animation"
		}"
		end

	gtk_image_new_from_file (a_filename: POINTER): POINTER is
 		-- gtk_image_new_from_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_file"
		}"
		end

	gtk_image_new_from_gicon (an_icon: POINTER; a_size: INTEGER): POINTER is
 		-- gtk_image_new_from_gicon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_gicon"
		}"
		end

	gtk_image_new_from_icon_name (an_icon_name: POINTER; a_size: INTEGER): POINTER is
 		-- gtk_image_new_from_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_icon_name"
		}"
		end

	gtk_image_new_from_icon_set (an_icon_set: POINTER; a_size: INTEGER): POINTER is
 		-- gtk_image_new_from_icon_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_icon_set"
		}"
		end

	gtk_image_new_from_image (an_image: POINTER; a_mask: POINTER): POINTER is
 		-- gtk_image_new_from_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_image"
		}"
		end

	gtk_image_new_from_pixbuf (a_pixbuf: POINTER): POINTER is
 		-- gtk_image_new_from_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_pixbuf"
		}"
		end

	gtk_image_new_from_pixmap (a_pixmap: POINTER; a_mask: POINTER): POINTER is
 		-- gtk_image_new_from_pixmap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_pixmap"
		}"
		end

	gtk_image_new_from_stock (a_stock_id: POINTER; a_size: INTEGER): POINTER is
 		-- gtk_image_new_from_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_stock"
		}"
		end

	gtk_image_set_from_animation (an_image: POINTER; an_animation: POINTER) is
 		-- gtk_image_set_from_animation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_animation"
		}"
		end

	gtk_image_set_from_file (an_image: POINTER; a_filename: POINTER) is
 		-- gtk_image_set_from_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_file"
		}"
		end

	gtk_image_set_from_gicon (an_image: POINTER; an_icon: POINTER; a_size: INTEGER) is
 		-- gtk_image_set_from_gicon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_gicon"
		}"
		end

	gtk_image_set_from_icon_name (an_image: POINTER; an_icon_name: POINTER; a_size: INTEGER) is
 		-- gtk_image_set_from_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_icon_name"
		}"
		end

	gtk_image_set_from_icon_set (an_image: POINTER; an_icon_set: POINTER; a_size: INTEGER) is
 		-- gtk_image_set_from_icon_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_icon_set"
		}"
		end

	gtk_image_set_from_image (an_image: POINTER; a_gdk_image: POINTER; a_mask: POINTER) is
 		-- gtk_image_set_from_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_image"
		}"
		end

	gtk_image_set_from_pixbuf (an_image: POINTER; a_pixbuf: POINTER) is
 		-- gtk_image_set_from_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_pixbuf"
		}"
		end

	gtk_image_set_from_pixmap (an_image: POINTER; a_pixmap: POINTER; a_mask: POINTER) is
 		-- gtk_image_set_from_pixmap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_pixmap"
		}"
		end

	gtk_image_set_from_stock (an_image: POINTER; a_stock_id: POINTER; a_size: INTEGER) is
 		-- gtk_image_set_from_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_stock"
		}"
		end

	gtk_image_set_pixel_size (an_image: POINTER; a_pixel_size: INTEGER) is
 		-- gtk_image_set_pixel_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_pixel_size"
		}"
		end


end -- class GTKIMAGE_EXTERNALS
