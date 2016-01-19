-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_HYPERLINK_STATE_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (atk_hyperlink_is_inline_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_atk_hyperlink_is_inline is
		do
			value := value.bit_or(atk_hyperlink_is_inline_low_level)
		end

	unset_atk_hyperlink_is_inline is
		do
			value := value.bit_xor(atk_hyperlink_is_inline_low_level)
		end

feature -- Queries
	is_atk_hyperlink_is_inline: BOOLEAN is
		do
			Result := (value=atk_hyperlink_is_inline_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	atk_hyperlink_is_inline_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ATK_HYPERLINK_IS_INLINE"
 			}"
 		end


end -- class ATK_HYPERLINK_STATE_FLAGS_ENUM
