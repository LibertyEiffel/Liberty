-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GSIGNAL_MATCH_TYPE_ENUM

-- Wrapper of enum GSignalMatchType defined in file /usr/include/glib-2.0/gobject/gsignal.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (closure_low_level | 
				data_low_level | 
				detail_low_level | 
				func_low_level | 
				id_low_level | 
				unblocked_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_closure
               do
                       value := value.bit_or(closure_low_level)
               end

	unset_closure
               do
                       value := value.bit_xor(closure_low_level)
               end

	set_data
               do
                       value := value.bit_or(data_low_level)
               end

	unset_data
               do
                       value := value.bit_xor(data_low_level)
               end

	set_detail
               do
                       value := value.bit_or(detail_low_level)
               end

	unset_detail
               do
                       value := value.bit_xor(detail_low_level)
               end

	set_func
               do
                       value := value.bit_or(func_low_level)
               end

	unset_func
               do
                       value := value.bit_xor(func_low_level)
               end

	set_id
               do
                       value := value.bit_or(id_low_level)
               end

	unset_id
               do
                       value := value.bit_xor(id_low_level)
               end

	set_unblocked
               do
                       value := value.bit_or(unblocked_low_level)
               end

	unset_unblocked
               do
                       value := value.bit_xor(unblocked_low_level)
               end

feature {ANY} -- Queries
       is_closure: BOOLEAN
               do
                       Result := (value.bit_and(closure_low_level).to_boolean)
               end

       is_data: BOOLEAN
               do
                       Result := (value.bit_and(data_low_level).to_boolean)
               end

       is_detail: BOOLEAN
               do
                       Result := (value.bit_and(detail_low_level).to_boolean)
               end

       is_func: BOOLEAN
               do
                       Result := (value.bit_and(func_low_level).to_boolean)
               end

       is_id: BOOLEAN
               do
                       Result := (value.bit_and(id_low_level).to_boolean)
               end

       is_unblocked: BOOLEAN
               do
                       Result := (value.bit_and(unblocked_low_level).to_boolean)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     closure_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_MATCH_CLOSURE"
                       }"
               end

     data_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_MATCH_DATA"
                       }"
               end

     detail_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_MATCH_DETAIL"
                       }"
               end

     func_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_MATCH_FUNC"
                       }"
               end

     id_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_MATCH_ID"
                       }"
               end

     unblocked_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SIGNAL_MATCH_UNBLOCKED"
                       }"
               end


end -- class GSIGNAL_MATCH_TYPE_ENUM
