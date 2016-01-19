-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class NODE_FREQUENCY_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = executed_once_low_level)  or else
				(a_value = hot_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = unlikely_executed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_executed_once
               do
                       value := executed_once_low_level
               end

	set_hot
               do
                       value := hot_low_level
               end

	set_normal
               do
                       value := normal_low_level
               end

	set_unlikely_executed
               do
                       value := unlikely_executed_low_level
               end

feature {ANY} -- Queries
       is_executed_once: BOOLEAN
               do
                       Result := (value=executed_once_low_level)
               end

       is_hot: BOOLEAN
               do
                       Result := (value=hot_low_level)
               end

       is_normal: BOOLEAN
               do
                       Result := (value=normal_low_level)
               end

       is_unlikely_executed: BOOLEAN
               do
                       Result := (value=unlikely_executed_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     executed_once_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "NODE_FREQUENCY_EXECUTED_ONCE"
                       }"
               end

     hot_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "NODE_FREQUENCY_HOT"
                       }"
               end

     normal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "NODE_FREQUENCY_NORMAL"
                       }"
               end

     unlikely_executed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "NODE_FREQUENCY_UNLIKELY_EXECUTED"
                       }"
               end


end -- class NODE_FREQUENCY_ENUM
