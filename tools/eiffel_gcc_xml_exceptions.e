deferred class EIFFEL_GCC_XML_EXCEPTIONS
	-- The exceptions used in eiffel-gcc-xml

insert
	ANY undefine default_create end
	EXCEPTIONS undefine default_create end
feature
	variadic_function: STRING is "Variadic functions cannot be automatically wrapped"

	unhandled_type: STRING is "Unhandled type "
	unhandled_complex_type: STRING is "Unhandled complex type"
	unhandled_unsigned_integer_type: STRING is "Unhandled_unsigned integer type"
	unhandled_integer_type: STRING is "Unhandled integer type"
	unhandled_double_type: STRING is "Unhandled double type"
	unhandled_structure_type: STRING is "C structure passed by value and not by reference does not have a valid Eiffel wrapper type; they are mostly akin to an eventual expanded external type"
	unhandled_union_type: STRING is "Unhnalded union type"
	unhandled_reference_type: STRING is "Unhnalded reference type: C++ reference does not have a valid Eiffel wrapper type."

	check_instruction_exception: STRING is "Check_instruction"
	class_invariant_exception: STRING is "Class_invariant"
	developer_exception_exception: STRING is "Developer_exception"
	incorrect_inspect_value_exception: STRING is "Incorrect_inspect_value"
	loop_invariant_exception: STRING is "Loop_invariant"
	loop_variant_exception: STRING is "Loop_variant"
	no_more_memory_exception: STRING is "No_more_memory"
	postcondition_exception: STRING is "Postcondition"
	precondition_exception: STRING is "Precondition"
	routine_failure_exception: STRING is "Routine_failure"
	os_signal_exception: STRING is "Os_signal"
	void_attached_to_expanded_exception: STRING is "Void_attached_to_expanded"
	void_call_target_exception: STRING is "Void_call_target"
	system_level_type_error_exception: STRING is "System_level_type_error"

feature {} -- Exception-related utilities
	exception_label (an_exception_number: INTEGER): STRING is
		do
			inspect an_exception_number 
			when Check_instruction then Result:=check_instruction_exception
			when Class_invariant then Result:=class_invariant_exception
			when Developer_exception then Result:=developer_exception_exception
			when Incorrect_inspect_value then Result:=incorrect_inspect_value_exception
			when Loop_invariant then Result:=loop_invariant_exception
			when Loop_variant then Result:=loop_variant_exception
			when No_more_memory then Result:=no_more_memory_exception
			when Postcondition then Result:=postcondition_exception
			when Precondition then Result:=precondition_exception
			when Routine_failure then Result:=routine_failure_exception
			when Os_signal then Result:=os_signal_exception
			when Void_attached_to_expanded then Result:=void_attached_to_expanded_exception
			when Void_call_target then Result:=void_call_target_exception
			when System_level_type_error then Result:=system_level_type_error_exception
			else Result:="Unknown exception"
			end
		end	
end
