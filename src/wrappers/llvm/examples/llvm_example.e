class LLVM_EXAMPLE
	-- A plain example of LLVM usage producing an executable that outputs
	-- "Hello world!" and some other niceties.

creation make
insert LLVM_INTEGER_TYPES
feature 
	make is
		local param_iter: ITERATOR[LLVM_VALUE]
		do
			create module.with_name("llvm-example")
			-- A function that print "Hello world!"
			-- A function computes Result=x*y+z.
			
			muladd := module.new_function("mul_add",muladd_type)
			calling_convention.set_ccall_conv
			muladd.set_calling_convention(calling_convention)
			-- set parameters name
			check muladd.parameters_count=3 end
			param_iter := muladd.new_parameter_iterator
			param_iter.start; param_iter.item.set_name("x")
			param_iter.next;  param_iter.item.set_name("y")
			param_iter.next;  param_iter.item.set_name("z")
			check 
				muladd.parameter(1).name.is_equal("x")
				muladd.parameter(2).name.is_equal("y")
				muladd.parameter(3).name.is_equal("z")
			end
	
			muladd.
			
			-- verifyModule(*Mod, PrintMessageAction);

			-- create pass_manager
			-- pass_manager.add(createPrintModulePass(&outs()));
			-- pass_manager.run(module)
			module.
		end

	calling_convention: LLVMCALL_CONV_ENUM

	module: LLVM_MODULE
	-- pass_manager: LLVM_PASS_MANAGER

	muladd_type: LLVM_FUNCTION_TYPE is
		once
			create Result.make(integer_32bit_type,
			{LLVM_TYPE_ARRAY <<integer_32bit_type,integer_32bit_type,integer_32bit_type>>})

	compute: LLVM_FUNCTION 

end -- class LLVM_EXAMPLE

-- Copyright 2009 Paolo Redaelli

