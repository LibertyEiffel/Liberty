expanded class LLVM_VISIBILITY
	-- enum LLVMVisibility

insert ENUM redefine is_default end 
feature -- Queries
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value = llvm_default_visibility or else
			a_value = llvm_hidden_visibility or else
			a_value = llvm_protected_visibility)
		end

  is_default: BOOLEAN is 
		-- The GV is visible 
	do
		Result := (value = llvm_default_visibility)
	end

  is_hidden: BOOLEAN is 
		-- The GV is hidden 
	do
		Result := (value = llvm_hidden_visibility)
	end

  is_protected: BOOLEAN is 
		-- The GV is protected 
	do
		Result := (value = llvm_protected_visibility)
	end

feature -- Setters
  default_create, set_default is 
		-- Set to The GV is visible 
	do
		value := llvm_default_visibility 
	end
  set_hidden is 
		-- Set to The GV is hidden 
	do
		value := llvm_hidden_visibility 
	end
  set_protected is 
		-- Set to The GV is protected 
	do
		value := llvm_protected_visibility 
	end
feature {} -- Low level fee
  llvm_default_visibility: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMDefaultVisibility" end
  llvm_hidden_visibility: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMHiddenVisibility" end
  llvm_protected_visibility: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMProtectedVisibility" end
end -- class LLVM_VISIBILITY

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



