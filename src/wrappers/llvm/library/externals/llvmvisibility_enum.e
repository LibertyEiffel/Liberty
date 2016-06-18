-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMVISIBILITY_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = default_visibility_low_level)  or else
				(a_value = hidden_visibility_low_level)  or else
				(a_value = protected_visibility_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_default_visibility
		do
			value := default_visibility_low_level
		end

	set_hidden_visibility
		do
			value := hidden_visibility_low_level
		end

	set_protected_visibility
		do
			value := protected_visibility_low_level
		end

feature {ANY} -- Queries
	is_default_visibility: BOOLEAN
		do
			Result := (value=default_visibility_low_level)
		end

	is_hidden_visibility: BOOLEAN
		do
			Result := (value=hidden_visibility_low_level)
		end

	is_protected_visibility: BOOLEAN
		do
			Result := (value=protected_visibility_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	default_visibility_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMDefaultVisibility"
 			}"
 		end

	hidden_visibility_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMHiddenVisibility"
 			}"
 		end

	protected_visibility_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMProtectedVisibility"
 			}"
 		end


end -- class LLVMVISIBILITY_ENUM
