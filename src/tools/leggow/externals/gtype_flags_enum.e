-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GTYPE_FLAGS_ENUM

-- Wrapper of enum GTypeFlags defined in file /usr/include/glib-2.0/gobject/gtype.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (abstract_low_level | 
				value_abstract_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_abstract
               do
                       value := value.bit_or(abstract_low_level)
               end

	unset_abstract
               do
                       value := value.bit_xor(abstract_low_level)
               end

	set_value_abstract
               do
                       value := value.bit_or(value_abstract_low_level)
               end

	unset_value_abstract
               do
                       value := value.bit_xor(value_abstract_low_level)
               end

feature {ANY} -- Queries
       is_abstract: BOOLEAN
               do
                       Result := (value.bit_and(abstract_low_level).to_boolean)
               end

       is_value_abstract: BOOLEAN
               do
                       Result := (value.bit_and(value_abstract_low_level).to_boolean)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     abstract_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TYPE_FLAG_ABSTRACT"
                       }"
               end

     value_abstract_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TYPE_FLAG_VALUE_ABSTRACT"
                       }"
               end


end -- class GTYPE_FLAGS_ENUM
