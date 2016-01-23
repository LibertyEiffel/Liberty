-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class UCHAR_ITERATOR_ORIGIN_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = current_low_level)  or else
				(a_value = length_low_level)  or else
				(a_value = limit_low_level)  or else
				(a_value = start_low_level)  or else
				(a_value = zero_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_current
               do
                       value := current_low_level
               end

	set_length
               do
                       value := length_low_level
               end

	set_limit
               do
                       value := limit_low_level
               end

	set_start
               do
                       value := start_low_level
               end

	set_zero
               do
                       value := zero_low_level
               end

feature {ANY} -- Queries
       is_current: BOOLEAN
               do
                       Result := (value=current_low_level)
               end

       is_length: BOOLEAN
               do
                       Result := (value=length_low_level)
               end

       is_limit: BOOLEAN
               do
                       Result := (value=limit_low_level)
               end

       is_start: BOOLEAN
               do
                       Result := (value=start_low_level)
               end

       is_zero: BOOLEAN
               do
                       Result := (value=zero_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     current_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UITER_CURRENT"
                       }"
               end

     length_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UITER_LENGTH"
                       }"
               end

     limit_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UITER_LIMIT"
                       }"
               end

     start_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UITER_START"
                       }"
               end

     zero_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UITER_ZERO"
                       }"
               end


end -- class UCHAR_ITERATOR_ORIGIN_ENUM
