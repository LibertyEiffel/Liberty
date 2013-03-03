-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMLINKAGE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = llvmappending_linkage_low_level)  or else
				(a_value = llvmavailable_externally_linkage_low_level)  or else
				(a_value = llvmcommon_linkage_low_level)  or else
				(a_value = llvmdllexport_linkage_low_level)  or else
				(a_value = llvmdllimport_linkage_low_level)  or else
				(a_value = llvmexternal_linkage_low_level)  or else
				(a_value = llvmexternal_weak_linkage_low_level)  or else
				(a_value = llvmghost_linkage_low_level)  or else
				(a_value = llvminternal_linkage_low_level)  or else
				(a_value = llvmlink_once_any_linkage_low_level)  or else
				(a_value = llvmlink_once_odrlinkage_low_level)  or else
				(a_value = llvmlinker_private_linkage_low_level)  or else
				(a_value = llvmlinker_private_weak_def_auto_linkage_low_level)  or else
				(a_value = llvmlinker_private_weak_linkage_low_level)  or else
				(a_value = llvmprivate_linkage_low_level)  or else
				(a_value = llvmweak_any_linkage_low_level)  or else
				(a_value = llvmweak_odrlinkage_low_level) )
		end

feature -- Setters
	default_create,
	set_llvmappending_linkage is
		do
			value := llvmappending_linkage_low_level
		end

	set_llvmavailable_externally_linkage is
		do
			value := llvmavailable_externally_linkage_low_level
		end

	set_llvmcommon_linkage is
		do
			value := llvmcommon_linkage_low_level
		end

	set_llvmdllexport_linkage is
		do
			value := llvmdllexport_linkage_low_level
		end

	set_llvmdllimport_linkage is
		do
			value := llvmdllimport_linkage_low_level
		end

	set_llvmexternal_linkage is
		do
			value := llvmexternal_linkage_low_level
		end

	set_llvmexternal_weak_linkage is
		do
			value := llvmexternal_weak_linkage_low_level
		end

	set_llvmghost_linkage is
		do
			value := llvmghost_linkage_low_level
		end

	set_llvminternal_linkage is
		do
			value := llvminternal_linkage_low_level
		end

	set_llvmlink_once_any_linkage is
		do
			value := llvmlink_once_any_linkage_low_level
		end

	set_llvmlink_once_odrlinkage is
		do
			value := llvmlink_once_odrlinkage_low_level
		end

	set_llvmlinker_private_linkage is
		do
			value := llvmlinker_private_linkage_low_level
		end

	set_llvmlinker_private_weak_def_auto_linkage is
		do
			value := llvmlinker_private_weak_def_auto_linkage_low_level
		end

	set_llvmlinker_private_weak_linkage is
		do
			value := llvmlinker_private_weak_linkage_low_level
		end

	set_llvmprivate_linkage is
		do
			value := llvmprivate_linkage_low_level
		end

	set_llvmweak_any_linkage is
		do
			value := llvmweak_any_linkage_low_level
		end

	set_llvmweak_odrlinkage is
		do
			value := llvmweak_odrlinkage_low_level
		end

feature -- Queries
	is_llvmappending_linkage: BOOLEAN is
		do
			Result := (value=llvmappending_linkage_low_level)
		end

	is_llvmavailable_externally_linkage: BOOLEAN is
		do
			Result := (value=llvmavailable_externally_linkage_low_level)
		end

	is_llvmcommon_linkage: BOOLEAN is
		do
			Result := (value=llvmcommon_linkage_low_level)
		end

	is_llvmdllexport_linkage: BOOLEAN is
		do
			Result := (value=llvmdllexport_linkage_low_level)
		end

	is_llvmdllimport_linkage: BOOLEAN is
		do
			Result := (value=llvmdllimport_linkage_low_level)
		end

	is_llvmexternal_linkage: BOOLEAN is
		do
			Result := (value=llvmexternal_linkage_low_level)
		end

	is_llvmexternal_weak_linkage: BOOLEAN is
		do
			Result := (value=llvmexternal_weak_linkage_low_level)
		end

	is_llvmghost_linkage: BOOLEAN is
		do
			Result := (value=llvmghost_linkage_low_level)
		end

	is_llvminternal_linkage: BOOLEAN is
		do
			Result := (value=llvminternal_linkage_low_level)
		end

	is_llvmlink_once_any_linkage: BOOLEAN is
		do
			Result := (value=llvmlink_once_any_linkage_low_level)
		end

	is_llvmlink_once_odrlinkage: BOOLEAN is
		do
			Result := (value=llvmlink_once_odrlinkage_low_level)
		end

	is_llvmlinker_private_linkage: BOOLEAN is
		do
			Result := (value=llvmlinker_private_linkage_low_level)
		end

	is_llvmlinker_private_weak_def_auto_linkage: BOOLEAN is
		do
			Result := (value=llvmlinker_private_weak_def_auto_linkage_low_level)
		end

	is_llvmlinker_private_weak_linkage: BOOLEAN is
		do
			Result := (value=llvmlinker_private_weak_linkage_low_level)
		end

	is_llvmprivate_linkage: BOOLEAN is
		do
			Result := (value=llvmprivate_linkage_low_level)
		end

	is_llvmweak_any_linkage: BOOLEAN is
		do
			Result := (value=llvmweak_any_linkage_low_level)
		end

	is_llvmweak_odrlinkage: BOOLEAN is
		do
			Result := (value=llvmweak_odrlinkage_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	llvmappending_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAppendingLinkage"
 			}"
 		end

	llvmavailable_externally_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAvailableExternallyLinkage"
 			}"
 		end

	llvmcommon_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMCommonLinkage"
 			}"
 		end

	llvmdllexport_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMDLLExportLinkage"
 			}"
 		end

	llvmdllimport_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMDLLImportLinkage"
 			}"
 		end

	llvmexternal_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMExternalLinkage"
 			}"
 		end

	llvmexternal_weak_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMExternalWeakLinkage"
 			}"
 		end

	llvmghost_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMGhostLinkage"
 			}"
 		end

	llvminternal_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMInternalLinkage"
 			}"
 		end

	llvmlink_once_any_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLinkOnceAnyLinkage"
 			}"
 		end

	llvmlink_once_odrlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLinkOnceODRLinkage"
 			}"
 		end

	llvmlinker_private_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLinkerPrivateLinkage"
 			}"
 		end

	llvmlinker_private_weak_def_auto_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLinkerPrivateWeakDefAutoLinkage"
 			}"
 		end

	llvmlinker_private_weak_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMLinkerPrivateWeakLinkage"
 			}"
 		end

	llvmprivate_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPrivateLinkage"
 			}"
 		end

	llvmweak_any_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMWeakAnyLinkage"
 			}"
 		end

	llvmweak_odrlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMWeakODRLinkage"
 			}"
 		end


end -- class LLVMLINKAGE_ENUM
