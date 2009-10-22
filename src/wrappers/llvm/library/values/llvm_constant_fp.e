class LLVM_CONSTANT_FP
	-- A constant floating point.

inherit LLVM_CONSTANT

insert CORE_EXTERNALS

creation from_real

feature -- Creation 
	from_real (a_type: LLVM_REAL_TYPE; a_value: REAL_64) is
		-- Create a floating point constant of `a_type' with `a_value'
	require a_type/=Void
	do
		handle := llvmconst_real(a_type.handle,a_value)
	end

	from_string (a_type: LLVM_REAL_TYPE; a_text: ABSTRACT_STRING) is
		-- Create a floating point constant of `a_type' parsing `a_text'

		-- TODO: "llvmconst_real_of_string_and_size" may be better suited to Eiffel
	require 
		a_type/=Void
		a_text/=Void
	do
		handle := llvmconst_real_of_string(a_type.handle, a_text.to_external)
	end
end -- class LLVM_CONSTANT_FP
-- Copyright 2009 Paolo Redaelli

