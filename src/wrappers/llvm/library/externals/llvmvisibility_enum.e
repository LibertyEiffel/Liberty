-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMVISIBILITY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = llvmdefault_visibility_low_level)  or else
				(a_value = llvmhidden_visibility_low_level)  or else
				(a_value = llvmprotected_visibility_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_llvmdefault_visibility is
		do
			value := llvmdefault_visibility_low_level
		end

	set_llvmhidden_visibility is
		do
			value := llvmhidden_visibility_low_level
		end

	set_llvmprotected_visibility is
		do
			value := llvmprotected_visibility_low_level
		end

feature {ANY} -- Queries
	is_llvmdefault_visibility: BOOLEAN is
		do
			Result := (value=llvmdefault_visibility_low_level)
		end

	is_llvmhidden_visibility: BOOLEAN is
		do
			Result := (value=llvmhidden_visibility_low_level)
		end

	is_llvmprotected_visibility: BOOLEAN is
		do
			Result := (value=llvmprotected_visibility_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmdefault_visibility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMDefaultVisibility"
 			}"
 		end

	llvmhidden_visibility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMHiddenVisibility"
 			}"
 		end

	llvmprotected_visibility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMProtectedVisibility"
 			}"
 		end


end -- class LLVMVISIBILITY_ENUM
