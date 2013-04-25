-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKPIXBUFALPHAMODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_pixbuf_alpha_bilevel_low_level)  or else
				(a_value = gdk_pixbuf_alpha_full_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_pixbuf_alpha_bilevel is
		do
			value := gdk_pixbuf_alpha_bilevel_low_level
		end

	set_gdk_pixbuf_alpha_full is
		do
			value := gdk_pixbuf_alpha_full_low_level
		end

feature {ANY} -- Queries
	is_gdk_pixbuf_alpha_bilevel: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_alpha_bilevel_low_level)
		end

	is_gdk_pixbuf_alpha_full: BOOLEAN is
		do
			Result := (value=gdk_pixbuf_alpha_full_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_pixbuf_alpha_bilevel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ALPHA_BILEVEL"
 			}"
 		end

	gdk_pixbuf_alpha_full_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PIXBUF_ALPHA_FULL"
 			}"
 		end


end -- class GDKPIXBUFALPHAMODE_ENUM
