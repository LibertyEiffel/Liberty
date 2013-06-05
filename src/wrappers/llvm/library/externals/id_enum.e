-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ID_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = arm_aapcs_low_level)  or else
				(a_value = arm_aapcs_vfp_low_level)  or else
				(a_value = arm_apcs_low_level)  or else
				(a_value = c_low_level)  or else
				(a_value = cold_low_level)  or else
				(a_value = fast_low_level)  or else
				(a_value = first_target_cc_low_level)  or else
				(a_value = ghc_low_level)  or else
				(a_value = mblaze_intr_low_level)  or else
				(a_value = mblaze_svol_low_level)  or else
				(a_value = msp430_intr_low_level)  or else
				(a_value = ptx_device_low_level)  or else
				(a_value = ptx_kernel_low_level)  or else
				(a_value = x86_fast_call_low_level)  or else
				(a_value = x86_std_call_low_level)  or else
				(a_value = x86_this_call_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_arm_aapcs is
		do
			value := arm_aapcs_low_level
		end

	set_arm_aapcs_vfp is
		do
			value := arm_aapcs_vfp_low_level
		end

	set_arm_apcs is
		do
			value := arm_apcs_low_level
		end

	set_c is
		do
			value := c_low_level
		end

	set_cold is
		do
			value := cold_low_level
		end

	set_fast is
		do
			value := fast_low_level
		end

	set_first_target_cc is
		do
			value := first_target_cc_low_level
		end

	set_ghc is
		do
			value := ghc_low_level
		end

	set_mblaze_intr is
		do
			value := mblaze_intr_low_level
		end

	set_mblaze_svol is
		do
			value := mblaze_svol_low_level
		end

	set_msp430_intr is
		do
			value := msp430_intr_low_level
		end

	set_ptx_device is
		do
			value := ptx_device_low_level
		end

	set_ptx_kernel is
		do
			value := ptx_kernel_low_level
		end

	set_x86_fast_call is
		do
			value := x86_fast_call_low_level
		end

	set_x86_std_call is
		do
			value := x86_std_call_low_level
		end

	set_x86_this_call is
		do
			value := x86_this_call_low_level
		end

feature {ANY} -- Queries
	is_arm_aapcs: BOOLEAN is
		do
			Result := (value=arm_aapcs_low_level)
		end

	is_arm_aapcs_vfp: BOOLEAN is
		do
			Result := (value=arm_aapcs_vfp_low_level)
		end

	is_arm_apcs: BOOLEAN is
		do
			Result := (value=arm_apcs_low_level)
		end

	is_c: BOOLEAN is
		do
			Result := (value=c_low_level)
		end

	is_cold: BOOLEAN is
		do
			Result := (value=cold_low_level)
		end

	is_fast: BOOLEAN is
		do
			Result := (value=fast_low_level)
		end

	is_first_target_cc: BOOLEAN is
		do
			Result := (value=first_target_cc_low_level)
		end

	is_ghc: BOOLEAN is
		do
			Result := (value=ghc_low_level)
		end

	is_mblaze_intr: BOOLEAN is
		do
			Result := (value=mblaze_intr_low_level)
		end

	is_mblaze_svol: BOOLEAN is
		do
			Result := (value=mblaze_svol_low_level)
		end

	is_msp430_intr: BOOLEAN is
		do
			Result := (value=msp430_intr_low_level)
		end

	is_ptx_device: BOOLEAN is
		do
			Result := (value=ptx_device_low_level)
		end

	is_ptx_kernel: BOOLEAN is
		do
			Result := (value=ptx_kernel_low_level)
		end

	is_x86_fast_call: BOOLEAN is
		do
			Result := (value=x86_fast_call_low_level)
		end

	is_x86_std_call: BOOLEAN is
		do
			Result := (value=x86_std_call_low_level)
		end

	is_x86_this_call: BOOLEAN is
		do
			Result := (value=x86_this_call_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	arm_aapcs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ARM_AAPCS"
 			}"
 		end

	arm_aapcs_vfp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ARM_AAPCS_VFP"
 			}"
 		end

	arm_apcs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ARM_APCS"
 			}"
 		end

	c_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "C"
 			}"
 		end

	cold_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Cold"
 			}"
 		end

	fast_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Fast"
 			}"
 		end

	first_target_cc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FirstTargetCC"
 			}"
 		end

	ghc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GHC"
 			}"
 		end

	mblaze_intr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "MBLAZE_INTR"
 			}"
 		end

	mblaze_svol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "MBLAZE_SVOL"
 			}"
 		end

	msp430_intr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "MSP430_INTR"
 			}"
 		end

	ptx_device_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PTX_Device"
 			}"
 		end

	ptx_kernel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PTX_Kernel"
 			}"
 		end

	x86_fast_call_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "X86_FastCall"
 			}"
 		end

	x86_std_call_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "X86_StdCall"
 			}"
 		end

	x86_this_call_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "X86_ThisCall"
 			}"
 		end


end -- class ID_ENUM
