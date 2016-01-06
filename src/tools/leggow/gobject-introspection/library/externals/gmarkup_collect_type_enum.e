-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GMARKUP_COLLECT_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = boolean_low_level)  or else
				(a_value = invalid_low_level)  or else
				(a_value = optional_low_level)  or else
				(a_value = strdup_low_level)  or else
				(a_value = string_low_level)  or else
				(a_value = tristate_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_boolean
               do
                       value := boolean_low_level
               end

	set_invalid
               do
                       value := invalid_low_level
               end

	set_optional
               do
                       value := optional_low_level
               end

	set_strdup
               do
                       value := strdup_low_level
               end

	set_string
               do
                       value := string_low_level
               end

	set_tristate
               do
                       value := tristate_low_level
               end

feature {ANY} -- Queries
       is_boolean: BOOLEAN
               do
                       Result := (value=boolean_low_level)
               end

       is_invalid: BOOLEAN
               do
                       Result := (value=invalid_low_level)
               end

       is_optional: BOOLEAN
               do
                       Result := (value=optional_low_level)
               end

       is_strdup: BOOLEAN
               do
                       Result := (value=strdup_low_level)
               end

       is_string: BOOLEAN
               do
                       Result := (value=string_low_level)
               end

       is_tristate: BOOLEAN
               do
                       Result := (value=tristate_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     boolean_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_COLLECT_BOOLEAN"
                       }"
               end

     invalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_COLLECT_INVALID"
                       }"
               end

     optional_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_COLLECT_OPTIONAL"
                       }"
               end

     strdup_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_COLLECT_STRDUP"
                       }"
               end

     string_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_COLLECT_STRING"
                       }"
               end

     tristate_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MARKUP_COLLECT_TRISTATE"
                       }"
               end


end -- class GMARKUP_COLLECT_TYPE_ENUM
