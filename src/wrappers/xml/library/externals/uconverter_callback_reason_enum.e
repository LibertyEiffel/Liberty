-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class UCONVERTER_CALLBACK_REASON_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = clone_low_level)  or else
				(a_value = close_low_level)  or else
				(a_value = illegal_low_level)  or else
				(a_value = irregular_low_level)  or else
				(a_value = reset_low_level)  or else
				(a_value = unassigned_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_clone
               do
                       value := clone_low_level
               end

	set_close
               do
                       value := close_low_level
               end

	set_illegal
               do
                       value := illegal_low_level
               end

	set_irregular
               do
                       value := irregular_low_level
               end

	set_reset
               do
                       value := reset_low_level
               end

	set_unassigned
               do
                       value := unassigned_low_level
               end

feature {ANY} -- Queries
       is_clone: BOOLEAN
               do
                       Result := (value=clone_low_level)
               end

       is_close: BOOLEAN
               do
                       Result := (value=close_low_level)
               end

       is_illegal: BOOLEAN
               do
                       Result := (value=illegal_low_level)
               end

       is_irregular: BOOLEAN
               do
                       Result := (value=irregular_low_level)
               end

       is_reset: BOOLEAN
               do
                       Result := (value=reset_low_level)
               end

       is_unassigned: BOOLEAN
               do
                       Result := (value=unassigned_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     clone_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_CLONE"
                       }"
               end

     close_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_CLOSE"
                       }"
               end

     illegal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_ILLEGAL"
                       }"
               end

     irregular_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_IRREGULAR"
                       }"
               end

     reset_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_RESET"
                       }"
               end

     unassigned_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "UCNV_UNASSIGNED"
                       }"
               end


end -- class UCONVERTER_CALLBACK_REASON_ENUM
