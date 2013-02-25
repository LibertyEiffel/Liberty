-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ATTACH_OPTIONS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (expand_low_level | 
				fill_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_expand is
		do
			value := value.bit_or(expand_low_level)
		end

	unset_expand is
		do
			value := value.bit_xor(expand_low_level)
		end

	set_fill is
		do
			value := value.bit_or(fill_low_level)
		end

	unset_fill is
		do
			value := value.bit_xor(fill_low_level)
		end

feature -- Queries
	is_expand: BOOLEAN is
		do
			Result := (value=expand_low_level)
		end

	is_fill: BOOLEAN is
		do
			Result := (value=fill_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	expand_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_EXPAND"
 			}"
 		end

	fill_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_FILL"
 			}"
 		end


end -- class GTK_ATTACH_OPTIONS_ENUM
