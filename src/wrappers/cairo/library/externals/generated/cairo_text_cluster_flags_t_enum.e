-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_TEXT_CLUSTER_FLAGS_T_ENUM

-- Wrapper of enum _cairo_text_cluster_flags defined in file /usr/include/cairo/cairo.h line 1141
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := (a_value=0 or (a_value & (cairo_text_cluster_flag_backward_low_level)).to_boolean)
		end

feature {ANY} -- Setters
	default_create,
	set_cairo_text_cluster_flag_backward
               do
                       value := value.bit_or(cairo_text_cluster_flag_backward_low_level)
               end

	unset_cairo_text_cluster_flag_backward
               do
                       value := value.bit_xor(cairo_text_cluster_flag_backward_low_level)
               end

feature {ANY} -- Queries
       is_cairo_text_cluster_flag_backward: BOOLEAN
               do
                       Result := (value=cairo_text_cluster_flag_backward_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     cairo_text_cluster_flag_backward_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_TEXT_CLUSTER_FLAG_BACKWARD"
                       }"
               end


end -- class CAIRO_TEXT_CLUSTER_FLAGS_T_ENUM
