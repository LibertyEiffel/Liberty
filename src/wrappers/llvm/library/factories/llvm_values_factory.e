deferred class LLVM_VALUES_FACTORY
	-- Commodity features to get new LLVM_VALUE objects
insert 
	LLVM_C_TYPES
feature {ANY} -- Commodity features
	new_bool (a_boolean: BOOLEAN): LLVM_CONSTANT_INT is
		do
			create Result.from_integer(bool,a_boolean.to_integer.to_natural_64, 0)
		ensure Result/=Void -- Result.type.is_equal(bool)
		end
end -- class LLVM_VALUES_FACTORY
