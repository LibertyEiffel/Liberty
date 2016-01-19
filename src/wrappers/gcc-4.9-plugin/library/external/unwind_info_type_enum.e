-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class UNWIND_INFO_TYPE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = dwarf2_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = seh_low_level)  or else
				(a_value = sjlj_low_level)  or else
				(a_value = target_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_dwarf2
               do
                       value := dwarf2_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_seh
               do
                       value := seh_low_level
               end

	set_sjlj
               do
                       value := sjlj_low_level
               end

	set_target
               do
                       value := target_low_level
               end

feature {ANY} -- Queries
       is_dwarf2: BOOLEAN
               do
                       Result := (value=dwarf2_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_seh: BOOLEAN
               do
                       Result := (value=seh_low_level)
               end

       is_sjlj: BOOLEAN
               do
                       Result := (value=sjlj_low_level)
               end

       is_target: BOOLEAN
               do
                       Result := (value=target_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     dwarf2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UI_DWARF2"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UI_NONE"
                       }"
               end

     seh_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UI_SEH"
                       }"
               end

     sjlj_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UI_SJLJ"
                       }"
               end

     target_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UI_TARGET"
                       }"
               end


end -- class UNWIND_INFO_TYPE_ENUM
