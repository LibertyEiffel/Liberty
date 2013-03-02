-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMVERIFIERFAILUREACTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = llvmabort_process_action_low_level)  or else
				(a_value = llvmprint_message_action_low_level)  or else
				(a_value = llvmreturn_status_action_low_level) )
		end

feature -- Setters
	default_create,
	set_llvmabort_process_action is
		do
			value := llvmabort_process_action_low_level
		end

	set_llvmprint_message_action is
		do
			value := llvmprint_message_action_low_level
		end

	set_llvmreturn_status_action is
		do
			value := llvmreturn_status_action_low_level
		end

feature -- Queries
	is_llvmabort_process_action: BOOLEAN is
		do
			Result := (value=llvmabort_process_action_low_level)
		end

	is_llvmprint_message_action: BOOLEAN is
		do
			Result := (value=llvmprint_message_action_low_level)
		end

	is_llvmreturn_status_action: BOOLEAN is
		do
			Result := (value=llvmreturn_status_action_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmabort_process_action_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAbortProcessAction"
 			}"
 		end

	llvmprint_message_action_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPrintMessageAction"
 			}"
 		end

	llvmreturn_status_action_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMReturnStatusAction"
 			}"
 		end


end -- class LLVMVERIFIERFAILUREACTION_ENUM
