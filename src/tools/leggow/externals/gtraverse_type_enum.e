-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GTRAVERSE_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = in_order_low_level)  or else
				(a_value = level_order_low_level)  or else
				(a_value = post_order_low_level)  or else
				(a_value = pre_order_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_in_order
               do
                       value := in_order_low_level
               end

	set_level_order
               do
                       value := level_order_low_level
               end

	set_post_order
               do
                       value := post_order_low_level
               end

	set_pre_order
               do
                       value := pre_order_low_level
               end

feature {ANY} -- Queries
       is_in_order: BOOLEAN
               do
                       Result := (value=in_order_low_level)
               end

       is_level_order: BOOLEAN
               do
                       Result := (value=level_order_low_level)
               end

       is_post_order: BOOLEAN
               do
                       Result := (value=post_order_low_level)
               end

       is_pre_order: BOOLEAN
               do
                       Result := (value=pre_order_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     in_order_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IN_ORDER"
                       }"
               end

     level_order_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_LEVEL_ORDER"
                       }"
               end

     post_order_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_POST_ORDER"
                       }"
               end

     pre_order_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_PRE_ORDER"
                       }"
               end


end -- class GTRAVERSE_TYPE_ENUM
