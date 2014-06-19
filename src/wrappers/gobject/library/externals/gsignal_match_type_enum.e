-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSIGNAL_MATCH_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value & (g_signal_match_closure_low_level | 
				g_signal_match_detail_low_level | 
				g_signal_match_func_low_level | 
				g_signal_match_id_low_level | 
				g_signal_match_unblocked_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_g_signal_match_closure
		do
			value := value.bit_or(g_signal_match_closure_low_level)
		end

	unset_g_signal_match_closure
		do
			value := value.bit_xor(g_signal_match_closure_low_level)
		end

	set_g_signal_match_detail
		do
			value := value.bit_or(g_signal_match_detail_low_level)
		end

	unset_g_signal_match_detail
		do
			value := value.bit_xor(g_signal_match_detail_low_level)
		end

	set_g_signal_match_func
		do
			value := value.bit_or(g_signal_match_func_low_level)
		end

	unset_g_signal_match_func
		do
			value := value.bit_xor(g_signal_match_func_low_level)
		end

	set_g_signal_match_id
		do
			value := value.bit_or(g_signal_match_id_low_level)
		end

	unset_g_signal_match_id
		do
			value := value.bit_xor(g_signal_match_id_low_level)
		end

	set_g_signal_match_unblocked
		do
			value := value.bit_or(g_signal_match_unblocked_low_level)
		end

	unset_g_signal_match_unblocked
		do
			value := value.bit_xor(g_signal_match_unblocked_low_level)
		end

feature {ANY} -- Queries
	is_g_signal_match_closure: BOOLEAN
		do
			Result := (value=g_signal_match_closure_low_level)
		end

	is_g_signal_match_detail: BOOLEAN
		do
			Result := (value=g_signal_match_detail_low_level)
		end

	is_g_signal_match_func: BOOLEAN
		do
			Result := (value=g_signal_match_func_low_level)
		end

	is_g_signal_match_id: BOOLEAN
		do
			Result := (value=g_signal_match_id_low_level)
		end

	is_g_signal_match_unblocked: BOOLEAN
		do
			Result := (value=g_signal_match_unblocked_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_signal_match_closure_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MATCH_CLOSURE"
 			}"
 		end

	g_signal_match_detail_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MATCH_DETAIL"
 			}"
 		end

	g_signal_match_func_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MATCH_FUNC"
 			}"
 		end

	g_signal_match_id_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MATCH_ID"
 			}"
 		end

	g_signal_match_unblocked_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "G_SIGNAL_MATCH_UNBLOCKED"
 			}"
 		end


end -- class GSIGNAL_MATCH_TYPE_ENUM
