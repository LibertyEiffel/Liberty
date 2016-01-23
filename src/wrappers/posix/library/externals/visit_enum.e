-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class VISIT_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = endorder_low_level)  or else
				(a_value = leaf_low_level)  or else
				(a_value = postorder_low_level)  or else
				(a_value = preorder_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_endorder
               do
                       value := endorder_low_level
               end

	set_leaf
               do
                       value := leaf_low_level
               end

	set_postorder
               do
                       value := postorder_low_level
               end

	set_preorder
               do
                       value := preorder_low_level
               end

feature {ANY} -- Queries
       is_endorder: BOOLEAN
               do
                       Result := (value=endorder_low_level)
               end

       is_leaf: BOOLEAN
               do
                       Result := (value=leaf_low_level)
               end

       is_postorder: BOOLEAN
               do
                       Result := (value=postorder_low_level)
               end

       is_preorder: BOOLEAN
               do
                       Result := (value=preorder_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     endorder_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endorder"
                       }"
               end

     leaf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "leaf"
                       }"
               end

     postorder_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "postorder"
                       }"
               end

     preorder_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "preorder"
                       }"
               end


end -- class VISIT_ENUM
