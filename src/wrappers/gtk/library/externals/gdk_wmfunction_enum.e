-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_WMFUNCTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (all_low_level | 
				move_low_level | 
				minimize_low_level | 
				maximize_low_level | 
				close_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_all is
		do
			value := value.bit_or(all_low_level)
		end

	unset_all is
		do
			value := value.bit_xor(all_low_level)
		end

	set_move is
		do
			value := value.bit_or(move_low_level)
		end

	unset_move is
		do
			value := value.bit_xor(move_low_level)
		end

	set_minimize is
		do
			value := value.bit_or(minimize_low_level)
		end

	unset_minimize is
		do
			value := value.bit_xor(minimize_low_level)
		end

	set_maximize is
		do
			value := value.bit_or(maximize_low_level)
		end

	unset_maximize is
		do
			value := value.bit_xor(maximize_low_level)
		end

	set_close is
		do
			value := value.bit_or(close_low_level)
		end

	unset_close is
		do
			value := value.bit_xor(close_low_level)
		end

feature -- Queries
	is_all: BOOLEAN is
		do
			Result := (value=all_low_level)
		end

	is_move: BOOLEAN is
		do
			Result := (value=move_low_level)
		end

	is_minimize: BOOLEAN is
		do
			Result := (value=minimize_low_level)
		end

	is_maximize: BOOLEAN is
		do
			Result := (value=maximize_low_level)
		end

	is_close: BOOLEAN is
		do
			Result := (value=close_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_FUNC_ALL"
 			}"
 		end

	move_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_FUNC_MOVE"
 			}"
 		end

	minimize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_FUNC_MINIMIZE"
 			}"
 		end

	maximize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_FUNC_MAXIMIZE"
 			}"
 		end

	close_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_FUNC_CLOSE"
 			}"
 		end


end -- class GDK_WMFUNCTION_ENUM
