-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSIGNALMATCHTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (g_signal_match_closure_low_level | 
				g_signal_match_detail_low_level | 
				g_signal_match_func_low_level | 
				g_signal_match_id_low_level | 
				g_signal_match_unblocked_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_g_signal_match_closure is
		do
			value := value.bit_or(g_signal_match_closure_low_level)
		end

	unset_g_signal_match_closure is
		do
			value := value.bit_xor(g_signal_match_closure_low_level)
		end

	set_g_signal_match_detail is
		do
			value := value.bit_or(g_signal_match_detail_low_level)
		end

	unset_g_signal_match_detail is
		do
			value := value.bit_xor(g_signal_match_detail_low_level)
		end

	set_g_signal_match_func is
		do
			value := value.bit_or(g_signal_match_func_low_level)
		end

	unset_g_signal_match_func is
		do
			value := value.bit_xor(g_signal_match_func_low_level)
		end

	set_g_signal_match_id is
		do
			value := value.bit_or(g_signal_match_id_low_level)
		end

	unset_g_signal_match_id is
		do
			value := value.bit_xor(g_signal_match_id_low_level)
		end

	set_g_signal_match_unblocked is
		do
			value := value.bit_or(g_signal_match_unblocked_low_level)
		end

	unset_g_signal_match_unblocked is
		do
			value := value.bit_xor(g_signal_match_unblocked_low_level)
		end

feature {ANY} -- Queries
	is_g_signal_match_closure: BOOLEAN is
		do
			Result := (value=g_signal_match_closure_low_level)
		end

	is_g_signal_match_detail: BOOLEAN is
		do
			Result := (value=g_signal_match_detail_low_level)
		end

	is_g_signal_match_func: BOOLEAN is
		do
			Result := (value=g_signal_match_func_low_level)
		end

	is_g_signal_match_id: BOOLEAN is
		do
			Result := (value=g_signal_match_id_low_level)
		end

	is_g_signal_match_unblocked: BOOLEAN is
		do
			Result := (value=g_signal_match_unblocked_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_signal_match_closure_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MATCH_CLOSURE"
 			}"
 		end

	g_signal_match_detail_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MATCH_DETAIL"
 			}"
 		end

	g_signal_match_func_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MATCH_FUNC"
 			}"
 		end

	g_signal_match_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MATCH_ID"
 			}"
 		end

	g_signal_match_unblocked_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MATCH_UNBLOCKED"
 			}"
 		end


end -- class GSIGNALMATCHTYPE_ENUM
