-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIFIELD_INFO_FLAGS_ENUM

-- Wrapper of enum GIFieldInfoFlags defined in file /usr/include/gobject-introspection-1.0/gitypes.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (readable_low_level | 
				writable_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_readable
               do
                       value := value.bit_or(readable_low_level)
               end

	unset_readable
               do
                       value := value.bit_xor(readable_low_level)
               end

	set_writable
               do
                       value := value.bit_or(writable_low_level)
               end

	unset_writable
               do
                       value := value.bit_xor(writable_low_level)
               end

feature {ANY} -- Queries
       is_readable: BOOLEAN
               do
                       Result := (value=readable_low_level)
               end

       is_writable: BOOLEAN
               do
                       Result := (value=writable_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     readable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_FIELD_IS_READABLE"
                       }"
               end

     writable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_FIELD_IS_WRITABLE"
                       }"
               end


end -- class GIFIELD_INFO_FLAGS_ENUM
