-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class EVENT_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = copyfmt_event_low_level)  or else
				(a_value = erase_event_low_level)  or else
				(a_value = imbue_event_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_copyfmt_event
		do
			value := copyfmt_event_low_level
		end

	set_erase_event
		do
			value := erase_event_low_level
		end

	set_imbue_event
		do
			value := imbue_event_low_level
		end

feature {ANY} -- Queries
	is_copyfmt_event: BOOLEAN
		do
			Result := (value=copyfmt_event_low_level)
		end

	is_erase_event: BOOLEAN
		do
			Result := (value=erase_event_low_level)
		end

	is_imbue_event: BOOLEAN
		do
			Result := (value=imbue_event_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	copyfmt_event_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "copyfmt_event"
 			}"
 		end

	erase_event_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "erase_event"
 			}"
 		end

	imbue_event_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "imbue_event"
 			}"
 		end


end -- class EVENT_ENUM
