-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMAGE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_image_get_type: NATURAL_32 is
 		-- gtk_image_get_type (node at line 112)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_type()"
		}"
		end

	gtk_image_new_from_icon_set (an_icon_set: POINTER; a_size: INTEGER): POINTER is
 		-- gtk_image_new_from_icon_set (node at line 5793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_icon_set"
		}"
		end

	gtk_image_new: POINTER is
 		-- gtk_image_new (node at line 6993)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new()"
		}"
		end

	gtk_image_new_from_pixbuf (a_pixbuf: POINTER): POINTER is
 		-- gtk_image_new_from_pixbuf (node at line 7871)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_pixbuf"
		}"
		end

	gtk_image_set_from_icon_name (an_image: POINTER; an_icon_name: POINTER; a_size: INTEGER) is
 		-- gtk_image_set_from_icon_name (node at line 10083)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_icon_name"
		}"
		end

	gtk_image_set_from_file (an_image: POINTER; a_filename: POINTER) is
 		-- gtk_image_set_from_file (node at line 10306)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_file"
		}"
		end

	gtk_image_get_animation (an_image: POINTER): POINTER is
 		-- gtk_image_get_animation (node at line 12319)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_animation"
		}"
		end

	gtk_image_get_gicon (an_image: POINTER; a_gicon: POINTER; a_size: POINTER) is
 		-- gtk_image_get_gicon (node at line 12742)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_gicon"
		}"
		end

	gtk_image_get_storage_type (an_image: POINTER): INTEGER is
 		-- gtk_image_get_storage_type (node at line 14312)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_storage_type"
		}"
		end

	gtk_image_get_stock (an_image: POINTER; a_stock_id: POINTER; a_size: POINTER) is
 		-- gtk_image_get_stock (node at line 15995)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_stock"
		}"
		end

	gtk_image_get_pixel_size (an_image: POINTER): INTEGER_32 is
 		-- gtk_image_get_pixel_size (node at line 17561)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_pixel_size"
		}"
		end

	gtk_image_get_icon_set (an_image: POINTER; an_icon_set: POINTER; a_size: POINTER) is
 		-- gtk_image_get_icon_set (node at line 19011)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_icon_set"
		}"
		end

	gtk_image_get_pixmap (an_image: POINTER; a_pixmap: POINTER; a_mask: POINTER) is
 		-- gtk_image_get_pixmap (node at line 19100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_pixmap"
		}"
		end

	gtk_image_get_image (an_image: POINTER; a_gdk_image: POINTER; a_mask: POINTER) is
 		-- gtk_image_get_image (node at line 19288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_image"
		}"
		end

	gtk_image_new_from_animation (an_animation: POINTER): POINTER is
 		-- gtk_image_new_from_animation (node at line 19936)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_animation"
		}"
		end

	gtk_image_set (an_image: POINTER; a_val: POINTER; a_mask: POINTER) is
 		-- gtk_image_set (node at line 20101)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set"
		}"
		end

	gtk_image_set_from_gicon (an_image: POINTER; an_icon: POINTER; a_size: INTEGER) is
 		-- gtk_image_set_from_gicon (node at line 22698)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_gicon"
		}"
		end

	gtk_image_set_from_stock (an_image: POINTER; a_stock_id: POINTER; a_size: INTEGER) is
 		-- gtk_image_set_from_stock (node at line 25215)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_stock"
		}"
		end

	gtk_image_set_from_pixmap (an_image: POINTER; a_pixmap: POINTER; a_mask: POINTER) is
 		-- gtk_image_set_from_pixmap (node at line 25799)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_pixmap"
		}"
		end

	gtk_image_set_from_icon_set (an_image: POINTER; an_icon_set: POINTER; a_size: INTEGER) is
 		-- gtk_image_set_from_icon_set (node at line 25846)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_icon_set"
		}"
		end

	gtk_image_get (an_image: POINTER; a_val: POINTER; a_mask: POINTER) is
 		-- gtk_image_get (node at line 26577)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get"
		}"
		end

	gtk_image_get_pixbuf (an_image: POINTER): POINTER is
 		-- gtk_image_get_pixbuf (node at line 28926)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_pixbuf"
		}"
		end

	gtk_image_get_icon_name (an_image: POINTER; an_icon_name: POINTER; a_size: POINTER) is
 		-- gtk_image_get_icon_name (node at line 29059)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_get_icon_name"
		}"
		end

	gtk_image_set_from_image (an_image: POINTER; a_gdk_image: POINTER; a_mask: POINTER) is
 		-- gtk_image_set_from_image (node at line 29278)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_image"
		}"
		end

	gtk_image_new_from_gicon (an_icon: POINTER; a_size: INTEGER): POINTER is
 		-- gtk_image_new_from_gicon (node at line 29613)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_gicon"
		}"
		end

	gtk_image_set_from_animation (an_image: POINTER; an_animation: POINTER) is
 		-- gtk_image_set_from_animation (node at line 30421)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_animation"
		}"
		end

	gtk_image_new_from_file (a_filename: POINTER): POINTER is
 		-- gtk_image_new_from_file (node at line 32043)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_file"
		}"
		end

	gtk_image_new_from_stock (a_stock_id: POINTER; a_size: INTEGER): POINTER is
 		-- gtk_image_new_from_stock (node at line 32137)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_stock"
		}"
		end

	gtk_image_new_from_pixmap (a_pixmap: POINTER; a_mask: POINTER): POINTER is
 		-- gtk_image_new_from_pixmap (node at line 34984)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_pixmap"
		}"
		end

	gtk_image_set_from_pixbuf (an_image: POINTER; a_pixbuf: POINTER) is
 		-- gtk_image_set_from_pixbuf (node at line 35452)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_from_pixbuf"
		}"
		end

	gtk_image_new_from_image (an_image: POINTER; a_mask: POINTER): POINTER is
 		-- gtk_image_new_from_image (node at line 35614)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_image"
		}"
		end

	gtk_image_set_pixel_size (an_image: POINTER; a_pixel_size: INTEGER_32) is
 		-- gtk_image_set_pixel_size (node at line 35820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_set_pixel_size"
		}"
		end

	gtk_image_new_from_icon_name (an_icon_name: POINTER; a_size: INTEGER): POINTER is
 		-- gtk_image_new_from_icon_name (node at line 36074)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_new_from_icon_name"
		}"
		end

	gtk_image_clear (an_image: POINTER) is
 		-- gtk_image_clear (node at line 36681)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_image_clear"
		}"
		end


end -- class GTKIMAGE_EXTERNALS
