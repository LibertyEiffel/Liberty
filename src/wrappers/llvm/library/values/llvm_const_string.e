class LLVM_CONST_STRING 
	-- An LLVM constant string value.

	-- LLVM allows strings to be null-terminated and not-null-terminated. 
	
	-- Currently only null-terminated strings are supported.
	
	-- TODO: Provide access to non-null-terminated strings.
inherit LLVM_VALUE

creation in_context

feature {} -- Creation
	in_context (a_text: ABSTRACT_STRING) is
		-- Create a new Null-terminated, constant string containing `a_text'


	require a_text/=Void
	do
		from_external_pointer(llvmconst_string_in_context
