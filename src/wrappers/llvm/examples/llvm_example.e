class LLVM_EXAMPLE
	-- A plain example of LLVM usage producing an executable that outputs
	-- "Hello world!" and some other niceties.

creation make
insert LLVM_INTEGER_TYPES
feature 
	make is
		do
			create module.with_name("llvm-example")
			-- A function that print "Hello world!"
			-- A function computes Result=x*y+z.
			
			mul_add := module.new_function("mul_add",  
			-- verifyModule(*Mod, PrintMessageAction);

			-- create pass_manager
			-- pass_manager.add(createPrintModulePass(&outs()));
			-- pass_manager.run(module)
			module.
		end

	module: LLVM_MODULE
	-- pass_manager: LLVM_PASS_MANAGER

	compute_type: LLVM_TYPE
	compute: LLVM_FUNCTION is 
		once
			create {LLVM_FUNCTION_TYPE} compute_type.make(integer_32bit_type,{LLVM_TYPE_ARRAY <<integer_32bit_type,integer_32bit_type,integer_32bit_type>>})
			create Result.make 
			Result.set_callback
		end


end -- class LLVM_EXAMPLE

-- Copyright 2009 Paolo Redaelli

