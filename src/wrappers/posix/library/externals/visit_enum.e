-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class VISIT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = endorder_low_level)  or else
				(a_value = leaf_low_level)  or else
				(a_value = postorder_low_level)  or else
				(a_value = preorder_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_endorder is
		do
			value := endorder_low_level
		end

	set_leaf is
		do
			value := leaf_low_level
		end

	set_postorder is
		do
			value := postorder_low_level
		end

	set_preorder is
		do
			value := preorder_low_level
		end

feature {ANY} -- Queries
	is_endorder: BOOLEAN is
		do
			Result := (value=endorder_low_level)
		end

	is_leaf: BOOLEAN is
		do
			Result := (value=leaf_low_level)
		end

	is_postorder: BOOLEAN is
		do
			Result := (value=postorder_low_level)
		end

	is_preorder: BOOLEAN is
		do
			Result := (value=preorder_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	endorder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "endorder"
 			}"
 		end

	leaf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "leaf"
 			}"
 		end

	postorder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "postorder"
 			}"
 		end

	preorder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "preorder"
 			}"
 		end


end -- class VISIT_ENUM
