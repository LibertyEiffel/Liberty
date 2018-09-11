-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GCONNECT_FLAGS_ENUM

-- Wrapper of enum GConnectFlags defined in file /usr/include/glib-2.0/gobject/gsignal.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (after_low_level | 
				swapped_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_after
               do
                       value := value.bit_or(after_low_level)
               end

	unset_after
               do
                       value := value.bit_xor(after_low_level)
               end

	set_swapped
               do
                       value := value.bit_or(swapped_low_level)
               end

	unset_swapped
               do
                       value := value.bit_xor(swapped_low_level)
               end

feature {ANY} -- Queries
       is_after: BOOLEAN
               do
                       Result := (value.bit_and(after_low_level).to_boolean)
               end

       is_swapped: BOOLEAN
               do
                       Result := (value.bit_and(swapped_low_level).to_boolean)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     after_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CONNECT_AFTER"
                       }"
               end

     swapped_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_CONNECT_SWAPPED"
                       }"
               end


end -- class GCONNECT_FLAGS_ENUM
