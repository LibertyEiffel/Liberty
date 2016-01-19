-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GEMBLEM_ORIGIN_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_emblem_origin_device_low_level)  or else
				(a_value = g_emblem_origin_livemetadata_low_level)  or else
				(a_value = g_emblem_origin_tag_low_level)  or else
				(a_value = g_emblem_origin_unknown_low_level) )
		end

feature -- Setters
	default_create,
	set_g_emblem_origin_device is
		do
			value := g_emblem_origin_device_low_level
		end

	set_g_emblem_origin_livemetadata is
		do
			value := g_emblem_origin_livemetadata_low_level
		end

	set_g_emblem_origin_tag is
		do
			value := g_emblem_origin_tag_low_level
		end

	set_g_emblem_origin_unknown is
		do
			value := g_emblem_origin_unknown_low_level
		end

feature -- Queries
	is_g_emblem_origin_device: BOOLEAN is
		do
			Result := (value=g_emblem_origin_device_low_level)
		end

	is_g_emblem_origin_livemetadata: BOOLEAN is
		do
			Result := (value=g_emblem_origin_livemetadata_low_level)
		end

	is_g_emblem_origin_tag: BOOLEAN is
		do
			Result := (value=g_emblem_origin_tag_low_level)
		end

	is_g_emblem_origin_unknown: BOOLEAN is
		do
			Result := (value=g_emblem_origin_unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_emblem_origin_device_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_EMBLEM_ORIGIN_DEVICE"
 			}"
 		end

	g_emblem_origin_livemetadata_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_EMBLEM_ORIGIN_LIVEMETADATA"
 			}"
 		end

	g_emblem_origin_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_EMBLEM_ORIGIN_TAG"
 			}"
 		end

	g_emblem_origin_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_EMBLEM_ORIGIN_UNKNOWN"
 			}"
 		end


end -- class GEMBLEM_ORIGIN_ENUM
