-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKFILTERRETURN_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_filter_continue_low_level)  or else
				(a_value = gdk_filter_remove_low_level)  or else
				(a_value = gdk_filter_translate_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_filter_continue is
		do
			value := gdk_filter_continue_low_level
		end

	set_gdk_filter_remove is
		do
			value := gdk_filter_remove_low_level
		end

	set_gdk_filter_translate is
		do
			value := gdk_filter_translate_low_level
		end

feature {ANY} -- Queries
	is_gdk_filter_continue: BOOLEAN is
		do
			Result := (value=gdk_filter_continue_low_level)
		end

	is_gdk_filter_remove: BOOLEAN is
		do
			Result := (value=gdk_filter_remove_low_level)
		end

	is_gdk_filter_translate: BOOLEAN is
		do
			Result := (value=gdk_filter_translate_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_filter_continue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FILTER_CONTINUE"
 			}"
 		end

	gdk_filter_remove_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FILTER_REMOVE"
 			}"
 		end

	gdk_filter_translate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FILTER_TRANSLATE"
 			}"
 		end


end -- class GDKFILTERRETURN_ENUM
