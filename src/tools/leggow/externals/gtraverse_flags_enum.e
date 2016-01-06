-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GTRAVERSE_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = all_low_level)  or else
				(a_value = leafs_low_level)  or else
				(a_value = leaves_low_level)  or else
				(a_value = mask_low_level)  or else
				(a_value = non_leafs_low_level)  or else
				(a_value = non_leaves_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_all
               do
                       value := all_low_level
               end

	set_leafs
               do
                       value := leafs_low_level
               end

	set_leaves
               do
                       value := leaves_low_level
               end

	set_mask
               do
                       value := mask_low_level
               end

	set_non_leafs
               do
                       value := non_leafs_low_level
               end

	set_non_leaves
               do
                       value := non_leaves_low_level
               end

feature {ANY} -- Queries
       is_all: BOOLEAN
               do
                       Result := (value=all_low_level)
               end

       is_leafs: BOOLEAN
               do
                       Result := (value=leafs_low_level)
               end

       is_leaves: BOOLEAN
               do
                       Result := (value=leaves_low_level)
               end

       is_mask: BOOLEAN
               do
                       Result := (value=mask_low_level)
               end

       is_non_leafs: BOOLEAN
               do
                       Result := (value=non_leafs_low_level)
               end

       is_non_leaves: BOOLEAN
               do
                       Result := (value=non_leaves_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     all_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TRAVERSE_ALL"
                       }"
               end

     leafs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TRAVERSE_LEAFS"
                       }"
               end

     leaves_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TRAVERSE_LEAVES"
                       }"
               end

     mask_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TRAVERSE_MASK"
                       }"
               end

     non_leafs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TRAVERSE_NON_LEAFS"
                       }"
               end

     non_leaves_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TRAVERSE_NON_LEAVES"
                       }"
               end


end -- class GTRAVERSE_FLAGS_ENUM
