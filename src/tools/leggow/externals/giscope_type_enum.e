-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GISCOPE_TYPE_ENUM

-- Wrapper of enum GIScopeType defined in file /usr/include/gobject-introspection-1.0/gitypes.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = async_low_level)  or else
				(a_value = call_low_level)  or else
				(a_value = invalid_low_level)  or else
				(a_value = notified_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_async
               do
                       value := async_low_level
               end

	set_call
               do
                       value := call_low_level
               end

	set_invalid
               do
                       value := invalid_low_level
               end

	set_notified
               do
                       value := notified_low_level
               end

feature {ANY} -- Queries
       is_async: BOOLEAN
               do
                       Result := (value=async_low_level)
               end

       is_call: BOOLEAN
               do
                       Result := (value=call_low_level)
               end

       is_invalid: BOOLEAN
               do
                       Result := (value=invalid_low_level)
               end

       is_notified: BOOLEAN
               do
                       Result := (value=notified_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     async_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_SCOPE_TYPE_ASYNC"
                       }"
               end

     call_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_SCOPE_TYPE_CALL"
                       }"
               end

     invalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_SCOPE_TYPE_INVALID"
                       }"
               end

     notified_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "GI_SCOPE_TYPE_NOTIFIED"
                       }"
               end


end -- class GISCOPE_TYPE_ENUM
