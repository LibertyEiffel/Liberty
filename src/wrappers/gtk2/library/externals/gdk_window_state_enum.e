-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_WINDOW_STATE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (withdrawn_low_level | 
				maximized_low_level | 
				sticky_low_level | 
				fullscreen_low_level | 
				above_low_level | 
				below_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_withdrawn is
		do
			value := value.bit_or(withdrawn_low_level)
		end

	unset_withdrawn is
		do
			value := value.bit_xor(withdrawn_low_level)
		end

	set_maximized is
		do
			value := value.bit_or(maximized_low_level)
		end

	unset_maximized is
		do
			value := value.bit_xor(maximized_low_level)
		end

	set_sticky is
		do
			value := value.bit_or(sticky_low_level)
		end

	unset_sticky is
		do
			value := value.bit_xor(sticky_low_level)
		end

	set_fullscreen is
		do
			value := value.bit_or(fullscreen_low_level)
		end

	unset_fullscreen is
		do
			value := value.bit_xor(fullscreen_low_level)
		end

	set_above is
		do
			value := value.bit_or(above_low_level)
		end

	unset_above is
		do
			value := value.bit_xor(above_low_level)
		end

	set_below is
		do
			value := value.bit_or(below_low_level)
		end

	unset_below is
		do
			value := value.bit_xor(below_low_level)
		end

feature {ANY} -- Queries
	is_withdrawn: BOOLEAN is
		do
			Result := (value=withdrawn_low_level)
		end

	is_maximized: BOOLEAN is
		do
			Result := (value=maximized_low_level)
		end

	is_sticky: BOOLEAN is
		do
			Result := (value=sticky_low_level)
		end

	is_fullscreen: BOOLEAN is
		do
			Result := (value=fullscreen_low_level)
		end

	is_above: BOOLEAN is
		do
			Result := (value=above_low_level)
		end

	is_below: BOOLEAN is
		do
			Result := (value=below_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	withdrawn_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_WITHDRAWN"
 			}"
 		end

	maximized_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_MAXIMIZED"
 			}"
 		end

	sticky_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_STICKY"
 			}"
 		end

	fullscreen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_FULLSCREEN"
 			}"
 		end

	above_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_ABOVE"
 			}"
 		end

	below_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WINDOW_STATE_BELOW"
 			}"
 		end


end -- class GDK_WINDOW_STATE_ENUM
