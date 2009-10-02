expanded class LLVM_ATTRIBUTE
	-- LLVMAttribute enumeration, which is actually a flag.

	-- Paolo 2009-09-10: sorry for the roughness of the wrapper; eiffel-gcc-xml would have produced easier to read code but gccxml couldn't parse it. 
	-- Interfacing with LLVM will ultimately make C wrappers "obsolete".... 

	-- typedef enum {
	--     LLVMZExtAttribute       = 1<<0,
	--     LLVMSExtAttribute       = 1<<1,
	--     LLVMNoReturnAttribute   = 1<<2,
	--     LLVMInRegAttribute      = 1<<3,
	--     LLVMStructRetAttribute  = 1<<4,
	--     LLVMNoUnwindAttribute   = 1<<5,
	--     LLVMNoAliasAttribute    = 1<<6,
	--     LLVMByValAttribute      = 1<<7,
	--     LLVMNestAttribute       = 1<<8,
	--     LLVMReadNoneAttribute   = 1<<9,
	--     LLVMReadOnlyAttribute   = 1<<10,
	--     LLVMNoInlineAttribute   = 1<<11,
	--     LLVMAlwaysInlineAttribute    = 1<<12,
	--     LLVMOptimizeForSizeAttribute = 1<<13,
	--     LLVMStackProtectAttribute    = 1<<14,
	--     LLVMStackProtectReqAttribute = 1<<15,
	--     LLVMNoCaptureAttribute  = 1<<21,
	--     LLVMNoRedZoneAttribute  = 1<<22,
	--     LLVMNoImplicitFloatAttribute = 1<<23,
	--     LLVMNakedAttribute      = 1<<24
	-- } LLVMAttribute;
	
insert ENUM

feature -- Queries
	is_zextattribute: BOOLEAN is do Result := (value & llvmzextattribute).to_boolean end
    is_sextattribute: BOOLEAN is do Result := (value & llvmsextattribute).to_boolean end
    is_noreturnattribute: BOOLEAN is do Result := (value & llvmnoreturnattribute).to_boolean end
    is_inregattribute: BOOLEAN is do Result := (value & llvminregattribute).to_boolean end
    is_structretattribute: BOOLEAN is do Result := (value & llvmstructretattribute).to_boolean end
    is_nounwindattribute: BOOLEAN is do Result := (value & llvmnounwindattribute).to_boolean end
    is_noaliasattribute: BOOLEAN is do Result := (value & llvmnoaliasattribute).to_boolean end
    is_byvalattribute: BOOLEAN is do Result := (value & llvmbyvalattribute).to_boolean end
    is_nestattribute: BOOLEAN is do Result := (value & llvmnestattribute).to_boolean end
    is_readnoneattribute: BOOLEAN is do Result := (value & llvmreadnoneattribute).to_boolean end
    is_readonlyattribute: BOOLEAN is do Result := (value & llvmreadonlyattribute).to_boolean end
    is_noinlineattribute: BOOLEAN is do Result := (value & llvmnoinlineattribute).to_boolean end
    is_alwaysinlineattribute: BOOLEAN is do Result := (value & llvmalwaysinlineattribute).to_boolean end
    is_optimizeforsizeattribute: BOOLEAN is do Result := (value & llvmoptimizeforsizeattribute).to_boolean end
    is_stackprotectattribute: BOOLEAN is do Result := (value & llvmstackprotectattribute).to_boolean end
    is_stackprotectreqattribute: BOOLEAN is do Result := (value & llvmstackprotectreqattribute).to_boolean end
    is_nocaptureattribute: BOOLEAN is do Result := (value & llvmnocaptureattribute).to_boolean end
    is_noredzoneattribute: BOOLEAN is do Result := (value & llvmnoredzoneattribute).to_boolean end
    is_noimplicitfloatattribute: BOOLEAN is do Result := (value & llvmnoimplicitfloatattribute).to_boolean end
    is_nakedattribute: BOOLEAN is do Result := (value & llvmnakedattribute).to_boolean end

	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (
			llvmzextattribute |
			llvmsextattribute |
			llvmnoreturnattribute |
			llvminregattribute |
			llvmstructretattribute |
			llvmnounwindattribute |
			llvmnoaliasattribute |
			llvmbyvalattribute |
			llvmnestattribute |
			llvmreadnoneattribute |
			llvmreadonlyattribute |
			llvmnoinlineattribute |
			llvmalwaysinlineattribute |
			llvmoptimizeforsizeattribute |
			llvmstackprotectattribute |
			llvmstackprotectreqattribute |
			llvmnocaptureattribute |
			llvmnoredzoneattribute |
			llvmnoimplicitfloatattribute |
			llvmnakedattribute)).to_boolean
		end

feature -- Setters and unsetters
	default_create is do value := 0 end
	
	set_zextattribute is do value := value.bit_or(llvmzextattribute) end
	unset_zextattribute is do value := value.bit_xor(llvmzextattribute) end

    set_sextattribute is do value := value.bit_or(llvmsextattribute) end
	unset_sextattribute is do value := value.bit_xor(llvmsextattribute) end

    set_noreturnattribute is do value := value.bit_or(llvmnoreturnattribute) end
	unset_noreturnattribute is do value := value.bit_xor(llvmnoreturnattribute) end

    set_inregattribute is do value := value.bit_or(llvminregattribute) end
	unset_inregattribute is do value := value.bit_xor(llvminregattribute) end

    set_structretattribute is do value := value.bit_or(llvmstructretattribute) end
	unset_structretattribute is do value := value.bit_xor(llvmstructretattribute) end

    set_nounwindattribute is do value := value.bit_or(llvmnounwindattribute) end
	unset_nounwindattribute is do value := value.bit_xor(llvmnounwindattribute) end

    set_noaliasattribute is do value := value.bit_or(llvmnoaliasattribute) end
	unset_noaliasattribute is do value := value.bit_xor(llvmnoaliasattribute) end

    set_byvalattribute is do value := value.bit_or(llvmbyvalattribute) end
	unset_byvalattribute is do value := value.bit_xor(llvmbyvalattribute) end

    set_nestattribute is do value := value.bit_or(llvmnestattribute) end
	unset_nestattribute is do value := value.bit_xor(llvmnestattribute) end

    set_readnoneattribute is do value := value.bit_or(llvmreadnoneattribute) end
	unset_readnoneattribute is do value := value.bit_xor(llvmreadnoneattribute) end

    set_readonlyattribute is do value := value.bit_or(llvmreadonlyattribute) end
	unset_readonlyattribute is do value := value.bit_xor(llvmreadonlyattribute) end

    set_noinlineattribute is do value := value.bit_or(llvmnoinlineattribute) end
	unset_noinlineattribute is do value := value.bit_xor(llvmnoinlineattribute) end

    set_alwaysinlineattribute is do value := value.bit_or(llvmalwaysinlineattribute) end
	unset_alwaysinlineattribute is do value := value.bit_xor(llvmalwaysinlineattribute) end

    set_optimizeforsizeattribute is do value := value.bit_or(llvmoptimizeforsizeattribute) end
	unset_optimizeforsizeattribute is do value := value.bit_xor(llvmoptimizeforsizeattribute) end

    set_stackprotectattribute is do value := value.bit_or(llvmstackprotectattribute) end
	unset_stackprotectattribute is do value := value.bit_xor(llvmstackprotectattribute) end

    set_stackprotectreqattribute is do value := value.bit_or(llvmstackprotectreqattribute) end
	unset_stackprotectreqattribute is do value := value.bit_xor(llvmstackprotectreqattribute) end

    set_nocaptureattribute is do value := value.bit_or(llvmnocaptureattribute) end
	unset_nocaptureattribute is do value := value.bit_xor(llvmnocaptureattribute) end

    set_noredzoneattribute is do value := value.bit_or(llvmnoredzoneattribute) end
	unset_noredzoneattribute is do value := value.bit_xor(llvmnoredzoneattribute) end

    set_noimplicitfloatattribute is do value := value.bit_or(llvmnoimplicitfloatattribute) end
	unset_noimplicitfloatattribute is do value := value.bit_xor(llvmnoimplicitfloatattribute) end

    set_nakedattribute is do value := value.bit_or(llvmnakedattribute) end
	unset_nakedattribute is do value := value.bit_xor(llvmnakedattribute) end


feature {} -- Low-level values
	llvmzextattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMZExtAttribute" end
    llvmsextattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMSExtAttribute" end
    llvmnoreturnattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMNoReturnAttribute" end
    llvminregattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMInRegAttribute" end
    llvmstructretattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMStructRetAttribute" end
    llvmnounwindattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMNoUnwindAttribute" end
    llvmnoaliasattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMNoAliasAttribute" end
    llvmbyvalattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMByValAttribute" end
    llvmnestattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMNestAttribute" end
    llvmreadnoneattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMReadNoneAttribute" end
    llvmreadonlyattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMReadOnlyAttribute" end
    llvmnoinlineattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMNoInlineAttribute" end
    llvmalwaysinlineattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMAlwaysInlineAttribute" end
    llvmoptimizeforsizeattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMOptimizeForSizeAttribute" end
    llvmstackprotectattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMStackProtectAttribute" end
    llvmstackprotectreqattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMStackProtectReqAttribute" end
    llvmnocaptureattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMNoCaptureAttribute" end
    llvmnoredzoneattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMNoRedZoneAttribute" end
    llvmnoimplicitfloatattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMNoImplicitFloatAttribute" end
    llvmnakedattribute: INTEGER is external "C use <llvm-c/Core.h>" alias "LLVMNakedAttribute" end
end -- class LLVM_ATTRIBUTE

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



