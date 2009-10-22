class LLVM_CONSTANT_INT
	-- An integer constant

inherit LLVM_CONSTANT

creation from_integer, from_string

feature -- Creation
	from_integer (a_type: LLVM_INTEGER_TYPE; a_value: NATURAL_64; a_sign_extend: INTEGER_32) is
		-- Create an integer constant of `a_type' with `a_value'; TODO: what's `a_sign_extend'?
	require a_type/=Void
	do
		handle:=llvmconst_int(a_type.handle,a_value,a_sign_extend)
	end

	from_string (a_type: LLVM_INTEGER_TYPE; a_text: ABSTRACT_STRING; a_radix: CHARACTER) is
		-- Create an integer constant of `a_type' from `a_text' with `a_radix'.

		-- TODO: C API also offers "llvmconst_int_of_string_and_size" that could be better suited to Eiffel STRINGs.
	require 
		a_type/=Void; 
		a_text/=Void
		-- Note: an eventual "a_text.is_integer" or "a_text.is_number" does NOT hold because those are limited to 32-64 bits while LLVM integers may be far greater.
	do
		handle := llvmconst_int_of_string(a_type.handle,a_text.to_external,a_radix)
	end

end -- class LLVM_CONSTANT_INT
-- Copyright 2009 Paolo Redaelli

