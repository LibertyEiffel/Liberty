-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TOOL_PALETTE_DRAG_TARGETS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (items_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_items is
		do
			value := value.bit_or(items_low_level)
		end

	unset_items is
		do
			value := value.bit_xor(items_low_level)
		end

feature {ANY} -- Queries
	is_items: BOOLEAN is
		do
			Result := (value=items_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	items_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TOOL_PALETTE_DRAG_ITEMS"
 			}"
 		end


end -- class GTK_TOOL_PALETTE_DRAG_TARGETS_ENUM
