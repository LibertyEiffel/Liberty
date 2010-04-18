class LLVM_GLOBAL_VARIABLE
inherit LLVM_GLOBAL_VALUE
creation {WRAPPER, WRAPPER_HANDLER} from_external_pointer
feature {ANY} -- Queries
	initializer: LLVM_VALUE is
		do
			create Result.from_external_pointer(llvmget_initializer(handle))
		ensure non_void: Result/=Void
		end

	is_thread_local: BOOLEAN is
		do
			Result:=llvmis_thread_local(handle).to_boolean
		end

	is_global_constant: BOOLEAN is
		do
			Result:=llvmis_global_constant(handle).to_boolean
		end

feature {ANY} -- Commands
	set_initializer (a_constant_value: LLVM_VALUE) is
	require a_constant_value/=Void
	do
		llvmset_initializer(handle,a_constant_value.handle)
	ensure set: initializer.is_equal(a_constant_value)
	end

	set_thread_local (a_setting: BOOLEAN) is
	do
		llvmset_thread_local(handle,a_setting.to_integer)
	ensure set: is_thread_local=a_setting
	end

	set_global_constant (a_setting: BOOLEAN) is
	do
		llvmset_global_constant(handle,a_setting.to_integer)
	ensure set: is_global_constant=a_setting
	end

end -- class LLVM_GLOBAL_VARIABLE

-- Copyright 2010 Paolo Redaelli

