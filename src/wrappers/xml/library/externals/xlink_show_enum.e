-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XLINK_SHOW_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = xlink_show_embed_low_level)  or else
				(a_value = xlink_show_new_low_level)  or else
				(a_value = xlink_show_none_low_level)  or else
				(a_value = xlink_show_replace_low_level) )
		end

feature -- Setters
	default_create,
	set_xlink_show_embed is
		do
			value := xlink_show_embed_low_level
		end

	set_xlink_show_new is
		do
			value := xlink_show_new_low_level
		end

	set_xlink_show_none is
		do
			value := xlink_show_none_low_level
		end

	set_xlink_show_replace is
		do
			value := xlink_show_replace_low_level
		end

feature -- Queries
	is_xlink_show_embed: BOOLEAN is
		do
			Result := (value=xlink_show_embed_low_level)
		end

	is_xlink_show_new: BOOLEAN is
		do
			Result := (value=xlink_show_new_low_level)
		end

	is_xlink_show_none: BOOLEAN is
		do
			Result := (value=xlink_show_none_low_level)
		end

	is_xlink_show_replace: BOOLEAN is
		do
			Result := (value=xlink_show_replace_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xlink_show_embed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_SHOW_EMBED"
 			}"
 		end

	xlink_show_new_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_SHOW_NEW"
 			}"
 		end

	xlink_show_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_SHOW_NONE"
 			}"
 		end

	xlink_show_replace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XLINK_SHOW_REPLACE"
 			}"
 		end


end -- class XLINK_SHOW_ENUM
