-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RECENT_SORT_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = mru_low_level)  or else
				(a_value = lru_low_level)  or else
				(a_value = custom_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_mru is
		do
			value := mru_low_level
		end

	set_lru is
		do
			value := lru_low_level
		end

	set_custom is
		do
			value := custom_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_mru: BOOLEAN is
		do
			Result := (value=mru_low_level)
		end

	is_lru: BOOLEAN is
		do
			Result := (value=lru_low_level)
		end

	is_custom: BOOLEAN is
		do
			Result := (value=custom_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_SORT_NONE"
 			}"
 		end

	mru_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_SORT_MRU"
 			}"
 		end

	lru_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_SORT_LRU"
 			}"
 		end

	custom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RECENT_SORT_CUSTOM"
 			}"
 		end


end -- class GTK_RECENT_SORT_TYPE_ENUM
