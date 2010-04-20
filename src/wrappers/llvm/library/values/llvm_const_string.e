class LLVM_CONST_STRING 
	-- An LLVM constant string value.

	-- LLVM allows strings to be null-terminated and not-null-terminated. 
	
	-- Currently only null-terminated strings are supported.
	
	-- TODO: Provide access to non-null-terminated strings.
inherit LLVM_VALUE

creation from_string, from_string_non_null_terminated, in_context

feature {} -- Creation
	from_string (a_text: ABSTRACT_STRING) is
		-- A new NULL-terminated constant string containing `a_text'. 
	require text_non_void: a_text /= Void
	do
		from_external_pointer(llvmconst_string(a_text.to_external, (a_text.count).to_natural_32, 1))
		-- Note: the meaning of the underlying argument dontnullterminate - here set to 1 - seems to be the opposite of what I understood.	
	end


	from_string_non_null_terminated (a_text: ABSTRACT_STRING) is
		-- A new non NULL-terminated constant string containing `a_text'.  
	require text_non_void: a_text /= Void
	do
		from_external_pointer(llvmconst_string(a_text.to_external, (a_text.count).to_natural_32, 0))
		-- Note: the meaning of the underlying argument dontnullterminate - here set to 0 - seems to be the opposite of what I understood.	
	end

	in_context (a_context: LLVM_CONTEXT; a_text: ABSTRACT_STRING; do_not_null_terminate: BOOLEAN) is
		-- Create a new constant string containing `a_text'.

		-- TODO: Clarify the meaning of `do_not_null_terminate'
	require 
		context_non_void: a_context/=Void
		text_non_void: a_text/=Void
	do
		from_external_pointer(llvmconst_string_in_context
		(a_context.handle, a_text.to_external, (a_text.count).to_natural_32, do_not_null_terminate.to_integer))
	end
end -- class LLVM_CONST_STRING
