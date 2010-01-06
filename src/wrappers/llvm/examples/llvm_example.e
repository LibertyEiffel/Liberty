class LLVM_EXAMPLE
	-- A plain example of LLVM usage producing an executable that
	-- computes a little math and outputs "Hello world!" and some
	-- other niceties.



	-- See http://npcontemplation.blogspot.com/2008/06/secret-of-llvm-c-bindings.html

insert LLVM_INTEGER_TYPES

creation make

feature 
	make is
		local param_iter: ITERATOR[LLVM_VALUE]
		do
			create module.with_name("llvm-example")
			-- A function that print "Hello world!"
			-- A function computes Result=x*y+z.
			
			-- Create the type for the function
			create muladd_type.make(int_32, <<int_32,int_32,int_32>>,False)

			muladd := module.new_function("mul_add func",muladd_type)
			calling_convention.set_ccall_conv
			muladd.set_calling_convention(calling_convention)
			-- set parameters name
			check 
				muladd.parameters_count=3.to_natural_32
			end
			param_iter := muladd.new_parameter_iterator
			param_iter.start; param_iter.item.set_name("x")
			param_iter.next;  param_iter.item.set_name("y")
			param_iter.next;  param_iter.item.set_name("z")
			check 
				muladd.parameter(1.to_natural_32).name.is_equal("x")
				muladd.parameter(2.to_natural_32).name.is_equal("y")
				muladd.parameter(3.to_natural_32).name.is_equal("z")
			end
			-- Add function body

			-- verifyModule(*Mod, PrintMessageAction);

			-- create pass_manager
			-- pass_manager.add(createPrintModulePass(&outs()));
			-- pass_manager.run(module)
		end

	calling_convention: LLVMCALL_CONV_ENUM

	module: LLVM_MODULE
	-- pass_manager: LLVM_PASS_MANAGER

	muladd_type: LLVM_FUNCTION_TYPE 
	muladd: LLVM_FUNCTION 

end -- class LLVM_EXAMPLE

-- Copyright 2009 Paolo Redaelli

