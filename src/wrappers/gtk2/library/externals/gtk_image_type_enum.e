-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_IMAGE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = empty_low_level)  or else
				(a_value = pixmap_low_level)  or else
				(a_value = image_low_level)  or else
				(a_value = pixbuf_low_level)  or else
				(a_value = stock_low_level)  or else
				(a_value = icon_set_low_level)  or else
				(a_value = animation_low_level)  or else
				(a_value = icon_name_low_level)  or else
				(a_value = gicon_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_empty is
		do
			value := empty_low_level
		end

	set_pixmap is
		do
			value := pixmap_low_level
		end

	set_image is
		do
			value := image_low_level
		end

	set_pixbuf is
		do
			value := pixbuf_low_level
		end

	set_stock is
		do
			value := stock_low_level
		end

	set_icon_set is
		do
			value := icon_set_low_level
		end

	set_animation is
		do
			value := animation_low_level
		end

	set_icon_name is
		do
			value := icon_name_low_level
		end

	set_gicon is
		do
			value := gicon_low_level
		end

feature {ANY} -- Queries
	empty: BOOLEAN is
		do
			Result := (value=empty_low_level)
		end

	pixmap: BOOLEAN is
		do
			Result := (value=pixmap_low_level)
		end

	image: BOOLEAN is
		do
			Result := (value=image_low_level)
		end

	pixbuf: BOOLEAN is
		do
			Result := (value=pixbuf_low_level)
		end

	stock: BOOLEAN is
		do
			Result := (value=stock_low_level)
		end

	icon_set: BOOLEAN is
		do
			Result := (value=icon_set_low_level)
		end

	animation: BOOLEAN is
		do
			Result := (value=animation_low_level)
		end

	icon_name: BOOLEAN is
		do
			Result := (value=icon_name_low_level)
		end

	gicon: BOOLEAN is
		do
			Result := (value=gicon_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_EMPTY"
 			}"
 		end

	pixmap_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_PIXMAP"
 			}"
 		end

	image_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_IMAGE"
 			}"
 		end

	pixbuf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_PIXBUF"
 			}"
 		end

	stock_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_STOCK"
 			}"
 		end

	icon_set_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_ICON_SET"
 			}"
 		end

	animation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_ANIMATION"
 			}"
 		end

	icon_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_ICON_NAME"
 			}"
 		end

	gicon_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IMAGE_GICON"
 			}"
 		end


end -- class GTK_IMAGE_TYPE_ENUM
