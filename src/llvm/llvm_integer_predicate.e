expanded class LLVM_INTEGER_PREDICATE
	-- Wrapper for enum LLVMIntPredicate

insert
	ENUM

feature {ANY} -- Queries
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := a_value = inteq or else a_value = intne or else a_value = intugt or else a_value = intuge or else a_value = intult or else a_value = intule or else a_value = intsgt or else a_value = intsge or else a_value = intslt or else a_value = intsle
		end

	is_inteq: BOOLEAN is
			--  equal
		do
			Result := (value = inteq)
		end

	is_intne: BOOLEAN is
			-- not equal
		do
			Result := (value = intne)
		end

	is_intugt: BOOLEAN is
			-- unsigned greater than
		do
			Result := (value = intugt)
		end

	is_intuge: BOOLEAN is
			-- unsigned greater or equal
		do
			Result := (value = intuge)
		end

	is_intult: BOOLEAN is
			-- unsigned less than
		do
			Result := (value = intult)
		end

	is_intule: BOOLEAN is
			-- unsigned less or equal
		do
			Result := (value = intule)
		end

	is_intsgt: BOOLEAN is
			-- signed greater than */
		do
			Result := (value = intsgt)
		end

	is_intsge: BOOLEAN is
			-- signed greater or equal i
		do
			Result := (value = intsge)
		end

	is_intslt: BOOLEAN is
			-- signed less than
		do
			Result := (value = intslt)
		end

	is_intsle: BOOLEAN is
			-- signed less or equal
		do
			Result := (value = intsle)
		end

feature {ANY} -- Setters
	default_create, set_inteq is
			-- Set `value' to IntEQ
		do
			value := inteq
		end

	set_intne is
			-- Set `value' to IntNE
		do
			value := intne
		end

	set_intugt is
			-- Set `value' to IntUGT
		do
			value := intugt
		end

	set_intuge is
			-- Set `value' to IntUGE
		do
			value := intuge
		end

	set_intult is
			-- Set `value' to IntULT
		do
			value := intult
		end

	set_intule is
			-- Set `value' to IntULE
		do
			value := intule
		end

	set_intsgt is
			-- Set `value' to IntSGT
		do
			value := intsgt
		end

	set_intsge is
			-- Set `value' to IntSGE
		do
			value := intsge
		end

	set_intslt is
			-- Set `value' to IntSLT
		do
			value := intslt
		end

	set_intsle is
			-- Set `value' to IntSLE
		do
			value := intsle
		end

feature {} -- Low-level values
	inteq: INTEGER is
		external "C use <llvm-c/Core.h>"
		alias "LLVMIntEQ"
		end

	intne: INTEGER is
		external "C use <llvm-c/Core.h>"
		alias "LLVMIntNE"
		end

	intugt: INTEGER is
		external "C use <llvm-c/Core.h>"
		alias "LLVMIntUGT"
		end

	intuge: INTEGER is
		external "C use <llvm-c/Core.h>"
		alias "LLVMIntUGE"
		end

	intult: INTEGER is
		external "C use <llvm-c/Core.h>"
		alias "LLVMIntULT"
		end

	intule: INTEGER is
		external "C use <llvm-c/Core.h>"
		alias "LLVMIntULE"
		end

	intsgt: INTEGER is
		external "C use <llvm-c/Core.h>"
		alias "LLVMIntSGT"
		end

	intsge: INTEGER is
		external "C use <llvm-c/Core.h>"
		alias "LLVMIntSGE"
		end

	intslt: INTEGER is
		external "C use <llvm-c/Core.h>"
		alias "LLVMIntSLT"
		end

	intsle: INTEGER is
		external "C use <llvm-c/Core.h>"
		alias "LLVMIntSLE"
		end

end -- class LLVM_INTEGER_PREDICATE
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



