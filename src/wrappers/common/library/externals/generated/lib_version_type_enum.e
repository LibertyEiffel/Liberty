-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class LIB_VERSION_TYPE_ENUM

-- Wrapper of enum _LIB_VERSION_TYPE defined in file /usr/include/math.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = ieee_low_level)  or else
				(a_value = isoc_low_level)  or else
				(a_value = posix_low_level)  or else
				(a_value = svid_low_level)  or else
				(a_value = xopen_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_ieee
               do
                       value := ieee_low_level
               end

	set_isoc
               do
                       value := isoc_low_level
               end

	set_posix
               do
                       value := posix_low_level
               end

	set_svid
               do
                       value := svid_low_level
               end

	set_xopen
               do
                       value := xopen_low_level
               end

feature {ANY} -- Queries
       is_ieee: BOOLEAN
               do
                       Result := (value=ieee_low_level)
               end

       is_isoc: BOOLEAN
               do
                       Result := (value=isoc_low_level)
               end

       is_posix: BOOLEAN
               do
                       Result := (value=posix_low_level)
               end

       is_svid: BOOLEAN
               do
                       Result := (value=svid_low_level)
               end

       is_xopen: BOOLEAN
               do
                       Result := (value=xopen_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     ieee_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "_IEEE_"
                       }"
               end

     isoc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "_ISOC_"
                       }"
               end

     posix_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "_POSIX_"
                       }"
               end

     svid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "_SVID_"
                       }"
               end

     xopen_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "_XOPEN_"
                       }"
               end


end -- class LIB_VERSION_TYPE_ENUM
