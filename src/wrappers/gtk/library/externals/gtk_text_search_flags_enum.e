-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TEXT_SEARCH_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (visible_only_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_visible_only is
		do
			value := value.bit_or(visible_only_low_level)
		end

	unset_visible_only is
		do
			value := value.bit_xor(visible_only_low_level)
		end

feature -- Queries
	is_visible_only: BOOLEAN is
		do
			Result := (value=visible_only_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	visible_only_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TEXT_SEARCH_VISIBLE_ONLY"
 			}"
 		end


end -- class GTK_TEXT_SEARCH_FLAGS_ENUM
