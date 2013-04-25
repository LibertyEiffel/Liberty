-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CELL_RENDERER_STATE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (selected_low_level | 
				insensitive_low_level | 
				sorted_low_level | 
				focused_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_selected is
		do
			value := value.bit_or(selected_low_level)
		end

	unset_selected is
		do
			value := value.bit_xor(selected_low_level)
		end

	set_insensitive is
		do
			value := value.bit_or(insensitive_low_level)
		end

	unset_insensitive is
		do
			value := value.bit_xor(insensitive_low_level)
		end

	set_sorted is
		do
			value := value.bit_or(sorted_low_level)
		end

	unset_sorted is
		do
			value := value.bit_xor(sorted_low_level)
		end

	set_focused is
		do
			value := value.bit_or(focused_low_level)
		end

	unset_focused is
		do
			value := value.bit_xor(focused_low_level)
		end

feature {ANY} -- Queries
	is_selected: BOOLEAN is
		do
			Result := (value=selected_low_level)
		end

	is_insensitive: BOOLEAN is
		do
			Result := (value=insensitive_low_level)
		end

	is_sorted: BOOLEAN is
		do
			Result := (value=sorted_low_level)
		end

	is_focused: BOOLEAN is
		do
			Result := (value=focused_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	selected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CELL_RENDERER_SELECTED"
 			}"
 		end

	insensitive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CELL_RENDERER_INSENSITIVE"
 			}"
 		end

	sorted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CELL_RENDERER_SORTED"
 			}"
 		end

	focused_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CELL_RENDERER_FOCUSED"
 			}"
 		end


end -- class GTK_CELL_RENDERER_STATE_ENUM
