-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class L_LVMATTRIBUTE

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (some_flags: INTEGER): BOOLEAN is
		do
			Result := (some_flags & (llvmzextattribute | 
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

feature -- Setters
	default_create is
		-- Default creation feature; it leaves all the bits cleared.
	do
	end

	set_zextattribute is
		
	do
		value := value.bit_or(llvmzextattribute)
	end

	unset_zextattribute is
		
	do
		value := value.bit_xor(llvmzextattribute)
	end

	set_sextattribute is
		
	do
		value := value.bit_or(llvmsextattribute)
	end

	unset_sextattribute is
		
	do
		value := value.bit_xor(llvmsextattribute)
	end

	set_noreturnattribute is
		
	do
		value := value.bit_or(llvmnoreturnattribute)
	end

	unset_noreturnattribute is
		
	do
		value := value.bit_xor(llvmnoreturnattribute)
	end

	set_inregattribute is
		
	do
		value := value.bit_or(llvminregattribute)
	end

	unset_inregattribute is
		
	do
		value := value.bit_xor(llvminregattribute)
	end

	set_structretattribute is
		
	do
		value := value.bit_or(llvmstructretattribute)
	end

	unset_structretattribute is
		
	do
		value := value.bit_xor(llvmstructretattribute)
	end

	set_nounwindattribute is
		
	do
		value := value.bit_or(llvmnounwindattribute)
	end

	unset_nounwindattribute is
		
	do
		value := value.bit_xor(llvmnounwindattribute)
	end

	set_noaliasattribute is
		
	do
		value := value.bit_or(llvmnoaliasattribute)
	end

	unset_noaliasattribute is
		
	do
		value := value.bit_xor(llvmnoaliasattribute)
	end

	set_byvalattribute is
		
	do
		value := value.bit_or(llvmbyvalattribute)
	end

	unset_byvalattribute is
		
	do
		value := value.bit_xor(llvmbyvalattribute)
	end

	set_nestattribute is
		
	do
		value := value.bit_or(llvmnestattribute)
	end

	unset_nestattribute is
		
	do
		value := value.bit_xor(llvmnestattribute)
	end

	set_readnoneattribute is
		
	do
		value := value.bit_or(llvmreadnoneattribute)
	end

	unset_readnoneattribute is
		
	do
		value := value.bit_xor(llvmreadnoneattribute)
	end

	set_readonlyattribute is
		
	do
		value := value.bit_or(llvmreadonlyattribute)
	end

	unset_readonlyattribute is
		
	do
		value := value.bit_xor(llvmreadonlyattribute)
	end

	set_noinlineattribute is
		
	do
		value := value.bit_or(llvmnoinlineattribute)
	end

	unset_noinlineattribute is
		
	do
		value := value.bit_xor(llvmnoinlineattribute)
	end

	set_alwaysinlineattribute is
		
	do
		value := value.bit_or(llvmalwaysinlineattribute)
	end

	unset_alwaysinlineattribute is
		
	do
		value := value.bit_xor(llvmalwaysinlineattribute)
	end

	set_optimizeforsizeattribute is
		
	do
		value := value.bit_or(llvmoptimizeforsizeattribute)
	end

	unset_optimizeforsizeattribute is
		
	do
		value := value.bit_xor(llvmoptimizeforsizeattribute)
	end

	set_stackprotectattribute is
		
	do
		value := value.bit_or(llvmstackprotectattribute)
	end

	unset_stackprotectattribute is
		
	do
		value := value.bit_xor(llvmstackprotectattribute)
	end

	set_stackprotectreqattribute is
		
	do
		value := value.bit_or(llvmstackprotectreqattribute)
	end

	unset_stackprotectreqattribute is
		
	do
		value := value.bit_xor(llvmstackprotectreqattribute)
	end

	set_nocaptureattribute is
		
	do
		value := value.bit_or(llvmnocaptureattribute)
	end

	unset_nocaptureattribute is
		
	do
		value := value.bit_xor(llvmnocaptureattribute)
	end

	set_noredzoneattribute is
		
	do
		value := value.bit_or(llvmnoredzoneattribute)
	end

	unset_noredzoneattribute is
		
	do
		value := value.bit_xor(llvmnoredzoneattribute)
	end

	set_noimplicitfloatattribute is
		
	do
		value := value.bit_or(llvmnoimplicitfloatattribute)
	end

	unset_noimplicitfloatattribute is
		
	do
		value := value.bit_xor(llvmnoimplicitfloatattribute)
	end

	set_nakedattribute is
		
	do
		value := value.bit_or(llvmnakedattribute)
	end

	unset_nakedattribute is
		
	do
		value := value.bit_xor(llvmnakedattribute)
	end

feature -- Queries
	is_zextattribute: BOOLEAN is
		
	do
		Result := (value & llvmzextattribute).to_boolean
	end

	is_sextattribute: BOOLEAN is
		
	do
		Result := (value & llvmsextattribute).to_boolean
	end

	is_noreturnattribute: BOOLEAN is
		
	do
		Result := (value & llvmnoreturnattribute).to_boolean
	end

	is_inregattribute: BOOLEAN is
		
	do
		Result := (value & llvminregattribute).to_boolean
	end

	is_structretattribute: BOOLEAN is
		
	do
		Result := (value & llvmstructretattribute).to_boolean
	end

	is_nounwindattribute: BOOLEAN is
		
	do
		Result := (value & llvmnounwindattribute).to_boolean
	end

	is_noaliasattribute: BOOLEAN is
		
	do
		Result := (value & llvmnoaliasattribute).to_boolean
	end

	is_byvalattribute: BOOLEAN is
		
	do
		Result := (value & llvmbyvalattribute).to_boolean
	end

	is_nestattribute: BOOLEAN is
		
	do
		Result := (value & llvmnestattribute).to_boolean
	end

	is_readnoneattribute: BOOLEAN is
		
	do
		Result := (value & llvmreadnoneattribute).to_boolean
	end

	is_readonlyattribute: BOOLEAN is
		
	do
		Result := (value & llvmreadonlyattribute).to_boolean
	end

	is_noinlineattribute: BOOLEAN is
		
	do
		Result := (value & llvmnoinlineattribute).to_boolean
	end

	is_alwaysinlineattribute: BOOLEAN is
		
	do
		Result := (value & llvmalwaysinlineattribute).to_boolean
	end

	is_optimizeforsizeattribute: BOOLEAN is
		
	do
		Result := (value & llvmoptimizeforsizeattribute).to_boolean
	end

	is_stackprotectattribute: BOOLEAN is
		
	do
		Result := (value & llvmstackprotectattribute).to_boolean
	end

	is_stackprotectreqattribute: BOOLEAN is
		
	do
		Result := (value & llvmstackprotectreqattribute).to_boolean
	end

	is_nocaptureattribute: BOOLEAN is
		
	do
		Result := (value & llvmnocaptureattribute).to_boolean
	end

	is_noredzoneattribute: BOOLEAN is
		
	do
		Result := (value & llvmnoredzoneattribute).to_boolean
	end

	is_noimplicitfloatattribute: BOOLEAN is
		
	do
		Result := (value & llvmnoimplicitfloatattribute).to_boolean
	end

	is_nakedattribute: BOOLEAN is
		
	do
		Result := (value & llvmnakedattribute).to_boolean
	end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmzextattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMZExtAttribute"
 			}"
 		end

	llvmsextattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMSExtAttribute"
 			}"
 		end

	llvmnoreturnattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMNoReturnAttribute"
 			}"
 		end

	llvminregattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMInRegAttribute"
 			}"
 		end

	llvmstructretattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMStructRetAttribute"
 			}"
 		end

	llvmnounwindattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMNoUnwindAttribute"
 			}"
 		end

	llvmnoaliasattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMNoAliasAttribute"
 			}"
 		end

	llvmbyvalattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMByValAttribute"
 			}"
 		end

	llvmnestattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMNestAttribute"
 			}"
 		end

	llvmreadnoneattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMReadNoneAttribute"
 			}"
 		end

	llvmreadonlyattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMReadOnlyAttribute"
 			}"
 		end

	llvmnoinlineattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMNoInlineAttribute"
 			}"
 		end

	llvmalwaysinlineattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMAlwaysInlineAttribute"
 			}"
 		end

	llvmoptimizeforsizeattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMOptimizeForSizeAttribute"
 			}"
 		end

	llvmstackprotectattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMStackProtectAttribute"
 			}"
 		end

	llvmstackprotectreqattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMStackProtectReqAttribute"
 			}"
 		end

	llvmnocaptureattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMNoCaptureAttribute"
 			}"
 		end

	llvmnoredzoneattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMNoRedZoneAttribute"
 			}"
 		end

	llvmnoimplicitfloatattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMNoImplicitFloatAttribute"
 			}"
 		end

	llvmnakedattribute: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LLVMNakedAttribute"
 			}"
 		end

end

