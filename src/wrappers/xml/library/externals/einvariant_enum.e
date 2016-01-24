-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class EINVARIANT_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = k_invariant_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_k_invariant
               do
                       value := k_invariant_low_level
               end

feature {ANY} -- Queries
       is_k_invariant: BOOLEAN
               do
                       Result := (value=k_invariant_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     k_invariant_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "kInvariant"
                       }"
               end


end -- class EINVARIANT_ENUM
