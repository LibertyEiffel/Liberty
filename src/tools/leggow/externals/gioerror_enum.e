-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIOERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = again_low_level)  or else
				(a_value = inval_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = unknown_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_again
               do
                       value := again_low_level
               end

	set_inval
               do
                       value := inval_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_unknown
               do
                       value := unknown_low_level
               end

feature {ANY} -- Queries
       is_again: BOOLEAN
               do
                       Result := (value=again_low_level)
               end

       is_inval: BOOLEAN
               do
                       Result := (value=inval_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_unknown: BOOLEAN
               do
                       Result := (value=unknown_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     again_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_ERROR_AGAIN"
                       }"
               end

     inval_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_ERROR_INVAL"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_ERROR_NONE"
                       }"
               end

     unknown_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_ERROR_UNKNOWN"
                       }"
               end


end -- class GIOERROR_ENUM
