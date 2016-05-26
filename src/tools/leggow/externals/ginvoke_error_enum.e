-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GINVOKE_ERROR_ENUM

-- Wrapper of enum GInvokeError defined in file /usr/include/gobject-introspection-1.0/gifunctioninfo.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = argument_mismatch_low_level)  or else
				(a_value = failed_low_level)  or else
				(a_value = symbol_not_found_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_argument_mismatch
               do
                       value := argument_mismatch_low_level
               end

	set_failed
               do
                       value := failed_low_level
               end

	set_symbol_not_found
               do
                       value := symbol_not_found_low_level
               end

feature {ANY} -- Queries
       is_argument_mismatch: BOOLEAN
               do
                       Result := (value=argument_mismatch_low_level)
               end

       is_failed: BOOLEAN
               do
                       Result := (value=failed_low_level)
               end

       is_symbol_not_found: BOOLEAN
               do
                       Result := (value=symbol_not_found_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     argument_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_INVOKE_ERROR_ARGUMENT_MISMATCH"
                       }"
               end

     failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_INVOKE_ERROR_FAILED"
                       }"
               end

     symbol_not_found_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_INVOKE_ERROR_SYMBOL_NOT_FOUND"
                       }"
               end


end -- class GINVOKE_ERROR_ENUM
