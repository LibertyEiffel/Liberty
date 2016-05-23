-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_FILL_RULE_T_ENUM

-- Wrapper of enum _cairo_fill_rule defined in file /usr/include/cairo/cairo.h line 745
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = even_odd_low_level)  or else
				(a_value = winding_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_even_odd
               do
                       value := even_odd_low_level
               end

	set_winding
               do
                       value := winding_low_level
               end

feature {ANY} -- Queries
       is_even_odd: BOOLEAN
               do
                       Result := (value=even_odd_low_level)
               end

       is_winding: BOOLEAN
               do
                       Result := (value=winding_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     even_odd_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FILL_RULE_EVEN_ODD"
                       }"
               end

     winding_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FILL_RULE_WINDING"
                       }"
               end


end -- class CAIRO_FILL_RULE_T_ENUM
