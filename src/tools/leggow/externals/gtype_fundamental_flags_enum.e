-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GTYPE_FUNDAMENTAL_FLAGS_ENUM

-- Wrapper of enum GTypeFundamentalFlags defined in file /usr/include/glib-2.0/gobject/gtype.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (classed_low_level | 
				deep_derivable_low_level | 
				derivable_low_level | 
				instantiatable_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_classed
               do
                       value := value.bit_or(classed_low_level)
               end

	unset_classed
               do
                       value := value.bit_xor(classed_low_level)
               end

	set_deep_derivable
               do
                       value := value.bit_or(deep_derivable_low_level)
               end

	unset_deep_derivable
               do
                       value := value.bit_xor(deep_derivable_low_level)
               end

	set_derivable
               do
                       value := value.bit_or(derivable_low_level)
               end

	unset_derivable
               do
                       value := value.bit_xor(derivable_low_level)
               end

	set_instantiatable
               do
                       value := value.bit_or(instantiatable_low_level)
               end

	unset_instantiatable
               do
                       value := value.bit_xor(instantiatable_low_level)
               end

feature {ANY} -- Queries
       is_classed: BOOLEAN
               do
                       Result := (value=classed_low_level)
               end

       is_deep_derivable: BOOLEAN
               do
                       Result := (value=deep_derivable_low_level)
               end

       is_derivable: BOOLEAN
               do
                       Result := (value=derivable_low_level)
               end

       is_instantiatable: BOOLEAN
               do
                       Result := (value=instantiatable_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     classed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TYPE_FLAG_CLASSED"
                       }"
               end

     deep_derivable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TYPE_FLAG_DEEP_DERIVABLE"
                       }"
               end

     derivable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TYPE_FLAG_DERIVABLE"
                       }"
               end

     instantiatable_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TYPE_FLAG_INSTANTIATABLE"
                       }"
               end


end -- class GTYPE_FUNDAMENTAL_FLAGS_ENUM
