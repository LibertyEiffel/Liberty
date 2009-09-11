expanded class LLVM_TYPE_KIND
	-- Wrapper for enum LLVMTypeKind

insert ENUM

feature -- Queries
	default_create is do value:=llvm_void end

	is_valid_value (a_value: INTEGER): BOOLEAN  is
		do
			Result := 
			(a_value = llvm_void) or else
			(a_value = llvm_float) or else
			(a_value = llvm_double) or else
			(a_value = llvm_x86_fp80) or else
			(a_value = llvm_fp128) or else
			(a_value = llvm_ppc_fp128) or else
			(a_value = llvm_label) or else
			(a_value = llvm_integer) or else
			(a_value = llvm_function) or else
			(a_value = llvm_struct) or else
			(a_value = llvm_array) or else
			(a_value = llvm_pointer) or else
			(a_value = llvm_opaque) or else
			(a_value = llvm_vector) 
		end
	
	vis_void: BOOLEAN is 
		-- Is Current type kind a type with no size 
	do
		Result := (value = llvm_void)
	end

  is_float: BOOLEAN is 
		-- Is Current type kind a 32 bit floating point type 
	do
		Result := (value = llvm_float)
	end

  is_double: BOOLEAN is 
		-- Is Current type kind a 64 bit floating point type 
	do
		Result := (value = llvm_double)
	end

  is_x86_fp80: BOOLEAN is 
		-- Is Current type kind a 80 bit floating point type (X87) 
	do
		Result := (value = llvm_x86_fp80)
	end

  is_fp128: BOOLEAN is 
		-- Is Current type kind a 128 bit floating point type (112-bit mantissa)
	do
		Result := (value = llvm_fp128)
	end

  is_ppc_fp128: BOOLEAN is 
		-- Is Current type kind a 128 bit floating point type (two 64-bits) 
	do
		Result := (value = llvm_ppc_fp128)
	end

  is_label: BOOLEAN is 
		-- Is Current type kind a Labels 
	do
		Result := (value = llvm_label)
	end

  is_integer: BOOLEAN is 
		-- Is Current type kind a Arbitrary bit width integers 
	do
		Result := (value = llvm_integer)
	end

  is_function: BOOLEAN is 
		-- Is Current type kind a Functions 
	do
		Result := (value = llvm_function)
	end

  is_struct: BOOLEAN is 
		-- Is Current type kind a Structures 
	do
		Result := (value = llvm_struct)
	end

  is_array: BOOLEAN is 
		-- Is Current type kind a Arrays 
	do
		Result := (value = llvm_array)
	end

  is_pointer: BOOLEAN is 
		-- Is Current type kind a Pointers 
	do
		Result := (value = llvm_pointer)
	end

  is_opaque: BOOLEAN is 
		-- Is Current type kind a Opaque: type with unknown structure 
	do
		Result := (value = llvm_opaque)
	end

  is_vector: BOOLEAN is 
		-- Is Current type kind a SIMD 'packed' format, or other vector type 
	do
		Result := (value = llvm_vector)
	end
	
feature -- Setters
  set_void is 
		-- Set to type with no size 
	do
		value := llvm_void
	end

  set_float is 
		-- Set to 32 bit floating point type 
	do
		value := llvm_float
	end

  set_double is 
		-- Set to 64 bit floating point type 
	do
		value := llvm_double
	end

  set_x86_fp80 is 
		-- Set to 80 bit floating point type (X87) 
	do
		value := llvm_x86_fp80
	end

  set_fp128 is 
		-- Set to 128 bit floating point type (112-bit mantissa)
	do
		value := llvm_fp128
	end

  set_ppc_fp128 is 
		-- Set to 128 bit floating point type (two 64-bits) 
	do
		value := llvm_ppc_fp128
	end

  set_label is 
		-- Set to Labels 
	do
		value := llvm_label
	end

  set_integer is 
		-- Set to Arbitrary bit width integers 
	do
		value := llvm_integer
	end

  set_function is 
		-- Set to Functions 
	do
		value := llvm_function
	end

  set_struct is 
		-- Set to Structures 
	do
		value := llvm_struct
	end

  set_array is 
		-- Set to Arrays 
	do
		value := llvm_array
	end

  set_pointer is 
		-- Set to Pointers 
	do
		value := llvm_pointer
	end

  set_opaque is 
		-- Set to Opaque: type with unknown structure 
	do
		value := llvm_opaque
	end

  set_vector is 
		-- Set to SIMD 'packed' format, or other vector type 
	do
		value := llvm_vector
	end

feature -- Low-level-values
  llvm_void: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMVoidTypeKind" end
  llvm_float: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMFloatTypeKind" end
  llvm_double: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMDoubleTypeKind" end
  llvm_x86_fp80: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMX86_FP80TypeKind" end
  llvm_fp128: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMFP128TypeKind" end
  llvm_ppc_fp128: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMPPC_FP128TypeKind" end
  llvm_label: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMLabelTypeKind" end
  llvm_integer: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMIntegerTypeKind" end
  llvm_function: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMFunctionTypeKind" end
  llvm_struct: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMStructTypeKind" end
  llvm_array: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMArrayTypeKind" end
  llvm_pointer: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMPointerTypeKind" end
  llvm_opaque: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMOpaqueTypeKind" end
  llvm_vector: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMVectorTypeKind" end

end -- class LLVM_TYPE_KIND

-- Copyright (C) 2009 Paolo Redaelli
-- 
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 3 of
-- the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA


