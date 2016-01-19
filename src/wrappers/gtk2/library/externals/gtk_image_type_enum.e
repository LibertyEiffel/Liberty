-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_IMAGE_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_image_animation_low_level)  or else
				(a_value = gtk_image_empty_low_level)  or else
				(a_value = gtk_image_gicon_low_level)  or else
				(a_value = gtk_image_icon_name_low_level)  or else
				(a_value = gtk_image_icon_set_low_level)  or else
				(a_value = gtk_image_image_low_level)  or else
				(a_value = gtk_image_pixbuf_low_level)  or else
				(a_value = gtk_image_pixmap_low_level)  or else
				(a_value = gtk_image_stock_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_image_animation is
		do
			value := gtk_image_animation_low_level
		end

	set_gtk_image_empty is
		do
			value := gtk_image_empty_low_level
		end

	set_gtk_image_gicon is
		do
			value := gtk_image_gicon_low_level
		end

	set_gtk_image_icon_name is
		do
			value := gtk_image_icon_name_low_level
		end

	set_gtk_image_icon_set is
		do
			value := gtk_image_icon_set_low_level
		end

	set_gtk_image_image is
		do
			value := gtk_image_image_low_level
		end

	set_gtk_image_pixbuf is
		do
			value := gtk_image_pixbuf_low_level
		end

	set_gtk_image_pixmap is
		do
			value := gtk_image_pixmap_low_level
		end

	set_gtk_image_stock is
		do
			value := gtk_image_stock_low_level
		end

feature -- Queries
	is_gtk_image_animation: BOOLEAN is
		do
			Result := (value=gtk_image_animation_low_level)
		end

	is_gtk_image_empty: BOOLEAN is
		do
			Result := (value=gtk_image_empty_low_level)
		end

	is_gtk_image_gicon: BOOLEAN is
		do
			Result := (value=gtk_image_gicon_low_level)
		end

	is_gtk_image_icon_name: BOOLEAN is
		do
			Result := (value=gtk_image_icon_name_low_level)
		end

	is_gtk_image_icon_set: BOOLEAN is
		do
			Result := (value=gtk_image_icon_set_low_level)
		end

	is_gtk_image_image: BOOLEAN is
		do
			Result := (value=gtk_image_image_low_level)
		end

	is_gtk_image_pixbuf: BOOLEAN is
		do
			Result := (value=gtk_image_pixbuf_low_level)
		end

	is_gtk_image_pixmap: BOOLEAN is
		do
			Result := (value=gtk_image_pixmap_low_level)
		end

	is_gtk_image_stock: BOOLEAN is
		do
			Result := (value=gtk_image_stock_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_image_animation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_ANIMATION"
 			}"
 		end

	gtk_image_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_EMPTY"
 			}"
 		end

	gtk_image_gicon_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_GICON"
 			}"
 		end

	gtk_image_icon_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_ICON_NAME"
 			}"
 		end

	gtk_image_icon_set_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_ICON_SET"
 			}"
 		end

	gtk_image_image_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_IMAGE"
 			}"
 		end

	gtk_image_pixbuf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_PIXBUF"
 			}"
 		end

	gtk_image_pixmap_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_PIXMAP"
 			}"
 		end

	gtk_image_stock_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_STOCK"
 			}"
 		end


end -- class GTK_IMAGE_TYPE_ENUM
