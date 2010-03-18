class FFI_CALL
	-- A Foreign Function Interface call.

	 -- Libffi' assumes that you have a pointer to the function you wish to call and that you know the number and types of arguments to pass it, as well as the return type of the function.

	 -- The first thing you must do is create an ffi_cif object that matches the signature of the function you wish to call. This is a separate step because it is common to make multiple
 --   calls using a single ffi_cif. The cif in ffi_cif stands for Call InterFace. To prepare a
 --   call interface object, use the function ffi_prep_cif.

inherit C_STRUCT
insert 
	FFY_TYPES
	FFIEXTERNALS
	
creation {ANY} prepare

feature {ANY} -- Preparation of a call
	prepare (a_function: POINTER; a_return_type: POINTER; some_argument_types: ARRAYED_COLLECTION[POINTER]) is
	-- Initializes Current call according to the given parameters.

	-- Functions with variable number of arguments (also known as varargs) are not supported.
	
	-- `a_return_type' must be a pointer to an ffi_type structure that describes the return type of the function. See FFI_TYPES.

	-- `some_argument_types' contains the types of arguments. May be Void 

	-- FFI allows to use several different ABI conventions, but they are highly
	-- platform-dependent. TODO: support different ABIs.
	
	-- `status' is updated and will be either is_ok if everything worked
	-- properly;  is_bad__abi if the ABI is invalid (see above); its value may
	-- be "FFI_BAD_TYPEDEF" if one of the arguments is incorrect; TODO: this
	-- value should belong to FFI_STATUSENUM but currently it is not found in
	-- the code.
	require 
		is_valid_type(a_return_type)
		some_argument_types=Void or else 
		some_argument_types.for_all(agent is_valid_type)	
	local ffi_abi: FFI_ABI; args_ptr: POINTER; args_n: NATURAL_32
	do
		a
		if some_argument_types/=Void then
			args_n := some_argument_types.count.to_natural_32
			args_ptr := some_argument_types.storage.to_pointer
		end
		status.change_value(ffi_prep_cif(handle,ffi_abi.default__abi_low_level,args_n,args_ptr))
		check not statis.is_bad__abi end
	end

	call (a_function: POINTER; a_result: POINTER; some_values: POINTER) is		
 		-- Calls `a_function' according to the description of Current.
		
		-- `a_result' shall point to a chunk of memory that will hold the
		-- result of the function call.  This must be large enough to hold the
		-- result and must be suitably aligned; it is the caller's
		-- responsibility to ensure this. If Current declares that the function
		-- returns void (using ffi_type_void), then `a_result' is ignored. If
		-- `a_result' is NULL then the return value is discarded.

		-- `some_values' shall point to a vector of "void *" pointers that
		-- point to the memory locations holding the argument values for a
		-- call. If Current declares that the function has no arguments (i.e.,
		-- nargs was 0), then avalues is ignored. 
	do
		ffi_call(handle,a_function,a_result,some_values)
	end
feature {ANY} -- Status
	status: FFI_STATUSENUM is
		-- The status of Current call.
		attribute
	end
end -- class FFI_CALL
