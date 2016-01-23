-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class UCONVERTER_PLATFORM_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = ibm_low_level)  or else
				(a_value = unknown_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_ibm
               do
                       value := ibm_low_level
               end

	set_unknown
               do
                       value := unknown_low_level
               end

feature {ANY} -- Queries
       is_ibm: BOOLEAN
               do
                       Result := (value=ibm_low_level)
               end

       is_unknown: BOOLEAN
               do
                       Result := (value=unknown_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     ibm_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_IBM"
                       }"
               end

     unknown_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_UNKNOWN"
                       }"
               end


end -- class UCONVERTER_PLATFORM_ENUM
