-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIDIRECTION_ENUM

-- Wrapper of enum GIDirection defined in file /usr/include/gobject-introspection-1.0/gitypes.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = in_low_level)  or else
				(a_value = inout_low_level)  or else
				(a_value = out_external_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_in
               do
                       value := in_low_level
               end

	set_inout
               do
                       value := inout_low_level
               end

	set_out_external
               do
                       value := out_external_low_level
               end

feature {ANY} -- Queries
       is_in: BOOLEAN
               do
                       Result := (value=in_low_level)
               end

       is_inout: BOOLEAN
               do
                       Result := (value=inout_low_level)
               end

       is_out_external: BOOLEAN
               do
                       Result := (value=out_external_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     in_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_DIRECTION_IN"
                       }"
               end

     inout_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_DIRECTION_INOUT"
                       }"
               end

     out_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_DIRECTION_OUT"
                       }"
               end


end -- class GIDIRECTION_ENUM
