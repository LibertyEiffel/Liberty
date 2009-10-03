-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMATTRIBUTE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (zextattribute_low_level | 
				noreturnattribute_low_level | 
				inregattribute_low_level | 
				structretattribute_low_level | 
				nounwindattribute_low_level | 
				noaliasattribute_low_level | 
				byvalattribute_low_level | 
				nestattribute_low_level | 
				readnoneattribute_low_level | 
				readonlyattribute_low_level | 
				noinlineattribute_low_level | 
				alwaysinlineattribute_low_level | 
				optimizeforsizeattribute_low_level | 
				stackprotectattribute_low_level | 
				stackprotectreqattribute_low_level | 
				nocaptureattribute_low_level | 
				noredzoneattribute_low_level | 
				noimplicitfloatattribute_low_level | 
				nakedattribute_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_zextattribute is
		do
			value := value.bit_or(zextattribute_low_level)
		end

	unset_zextattribute is
		do
			value := value.bit_xor(zextattribute_low_level)
		end

	set_noreturnattribute is
		do
			value := value.bit_or(noreturnattribute_low_level)
		end

	unset_noreturnattribute is
		do
			value := value.bit_xor(noreturnattribute_low_level)
		end

	set_inregattribute is
		do
			value := value.bit_or(inregattribute_low_level)
		end

	unset_inregattribute is
		do
			value := value.bit_xor(inregattribute_low_level)
		end

	set_structretattribute is
		do
			value := value.bit_or(structretattribute_low_level)
		end

	unset_structretattribute is
		do
			value := value.bit_xor(structretattribute_low_level)
		end

	set_nounwindattribute is
		do
			value := value.bit_or(nounwindattribute_low_level)
		end

	unset_nounwindattribute is
		do
			value := value.bit_xor(nounwindattribute_low_level)
		end

	set_noaliasattribute is
		do
			value := value.bit_or(noaliasattribute_low_level)
		end

	unset_noaliasattribute is
		do
			value := value.bit_xor(noaliasattribute_low_level)
		end

	set_byvalattribute is
		do
			value := value.bit_or(byvalattribute_low_level)
		end

	unset_byvalattribute is
		do
			value := value.bit_xor(byvalattribute_low_level)
		end

	set_nestattribute is
		do
			value := value.bit_or(nestattribute_low_level)
		end

	unset_nestattribute is
		do
			value := value.bit_xor(nestattribute_low_level)
		end

	set_readnoneattribute is
		do
			value := value.bit_or(readnoneattribute_low_level)
		end

	unset_readnoneattribute is
		do
			value := value.bit_xor(readnoneattribute_low_level)
		end

	set_readonlyattribute is
		do
			value := value.bit_or(readonlyattribute_low_level)
		end

	unset_readonlyattribute is
		do
			value := value.bit_xor(readonlyattribute_low_level)
		end

	set_noinlineattribute is
		do
			value := value.bit_or(noinlineattribute_low_level)
		end

	unset_noinlineattribute is
		do
			value := value.bit_xor(noinlineattribute_low_level)
		end

	set_alwaysinlineattribute is
		do
			value := value.bit_or(alwaysinlineattribute_low_level)
		end

	unset_alwaysinlineattribute is
		do
			value := value.bit_xor(alwaysinlineattribute_low_level)
		end

	set_optimizeforsizeattribute is
		do
			value := value.bit_or(optimizeforsizeattribute_low_level)
		end

	unset_optimizeforsizeattribute is
		do
			value := value.bit_xor(optimizeforsizeattribute_low_level)
		end

	set_stackprotectattribute is
		do
			value := value.bit_or(stackprotectattribute_low_level)
		end

	unset_stackprotectattribute is
		do
			value := value.bit_xor(stackprotectattribute_low_level)
		end

	set_stackprotectreqattribute is
		do
			value := value.bit_or(stackprotectreqattribute_low_level)
		end

	unset_stackprotectreqattribute is
		do
			value := value.bit_xor(stackprotectreqattribute_low_level)
		end

	set_nocaptureattribute is
		do
			value := value.bit_or(nocaptureattribute_low_level)
		end

	unset_nocaptureattribute is
		do
			value := value.bit_xor(nocaptureattribute_low_level)
		end

	set_noredzoneattribute is
		do
			value := value.bit_or(noredzoneattribute_low_level)
		end

	unset_noredzoneattribute is
		do
			value := value.bit_xor(noredzoneattribute_low_level)
		end

	set_noimplicitfloatattribute is
		do
			value := value.bit_or(noimplicitfloatattribute_low_level)
		end

	unset_noimplicitfloatattribute is
		do
			value := value.bit_xor(noimplicitfloatattribute_low_level)
		end

	set_nakedattribute is
		do
			value := value.bit_or(nakedattribute_low_level)
		end

	unset_nakedattribute is
		do
			value := value.bit_xor(nakedattribute_low_level)
		end

feature -- Queries
	is_zextattribute: BOOLEAN is
		do
			Result := (value=zextattribute_low_level)
		end

	is_noreturnattribute: BOOLEAN is
		do
			Result := (value=noreturnattribute_low_level)
		end

	is_inregattribute: BOOLEAN is
		do
			Result := (value=inregattribute_low_level)
		end

	is_structretattribute: BOOLEAN is
		do
			Result := (value=structretattribute_low_level)
		end

	is_nounwindattribute: BOOLEAN is
		do
			Result := (value=nounwindattribute_low_level)
		end

	is_noaliasattribute: BOOLEAN is
		do
			Result := (value=noaliasattribute_low_level)
		end

	is_byvalattribute: BOOLEAN is
		do
			Result := (value=byvalattribute_low_level)
		end

	is_nestattribute: BOOLEAN is
		do
			Result := (value=nestattribute_low_level)
		end

	is_readnoneattribute: BOOLEAN is
		do
			Result := (value=readnoneattribute_low_level)
		end

	is_readonlyattribute: BOOLEAN is
		do
			Result := (value=readonlyattribute_low_level)
		end

	is_noinlineattribute: BOOLEAN is
		do
			Result := (value=noinlineattribute_low_level)
		end

	is_alwaysinlineattribute: BOOLEAN is
		do
			Result := (value=alwaysinlineattribute_low_level)
		end

	is_optimizeforsizeattribute: BOOLEAN is
		do
			Result := (value=optimizeforsizeattribute_low_level)
		end

	is_stackprotectattribute: BOOLEAN is
		do
			Result := (value=stackprotectattribute_low_level)
		end

	is_stackprotectreqattribute: BOOLEAN is
		do
			Result := (value=stackprotectreqattribute_low_level)
		end

	is_nocaptureattribute: BOOLEAN is
		do
			Result := (value=nocaptureattribute_low_level)
		end

	is_noredzoneattribute: BOOLEAN is
		do
			Result := (value=noredzoneattribute_low_level)
		end

	is_noimplicitfloatattribute: BOOLEAN is
		do
			Result := (value=noimplicitfloatattribute_low_level)
		end

	is_nakedattribute: BOOLEAN is
		do
			Result := (value=nakedattribute_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	zextattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMZExtAttribute"
 			}"
 		end

	noreturnattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoReturnAttribute"
 			}"
 		end

	inregattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMInRegAttribute"
 			}"
 		end

	structretattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMStructRetAttribute"
 			}"
 		end

	nounwindattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoUnwindAttribute"
 			}"
 		end

	noaliasattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoAliasAttribute"
 			}"
 		end

	byvalattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMByValAttribute"
 			}"
 		end

	nestattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNestAttribute"
 			}"
 		end

	readnoneattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMReadNoneAttribute"
 			}"
 		end

	readonlyattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMReadOnlyAttribute"
 			}"
 		end

	noinlineattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoInlineAttribute"
 			}"
 		end

	alwaysinlineattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMAlwaysInlineAttribute"
 			}"
 		end

	optimizeforsizeattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMOptimizeForSizeAttribute"
 			}"
 		end

	stackprotectattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMStackProtectAttribute"
 			}"
 		end

	stackprotectreqattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMStackProtectReqAttribute"
 			}"
 		end

	nocaptureattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoCaptureAttribute"
 			}"
 		end

	noredzoneattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoRedZoneAttribute"
 			}"
 		end

	noimplicitfloatattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNoImplicitFloatAttribute"
 			}"
 		end

	nakedattribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMNakedAttribute"
 			}"
 		end


end -- class LLVMATTRIBUTE_ENUM
