class LLVM_EXAMPLE
	-- A plain example of LLVM that outputs bytecode of a module. Pass it to llvm-dis

	-- Currently we must use Makefile becuase even if we used C bindings we
	-- must use C++ linker. This could be achieved changind compile modes; it
	-- is more easily approached using make. See
	-- http://npcontemplation.blogspot.com/2008/06/secret-of-llvm-c-bindings.html 

insert 
	SHARED_LLVM
	LLVM_INTEGER_TYPES

creation make

feature {} -- Creation
	make is
		local x,y,z, tmp,tmp2,ret: LLVM_VALUE; param_iter: ITERATOR[LLVM_VALUE]	
		do
			create module.with_name("llvm-example")				
			-- A function that print "Hello world!"

			create muladd_type.make(int_32, <<int_32,int_32,int_32>>,False)
			-- `muladd' is a function that takes three 32-bit integers, returns a 32bit integer and is not variadic.
			muladd := module.new_function("mul_add",muladd_type)
			calling_convention.set_ccall_conv
			muladd.set_calling_convention(calling_convention)
			-- set parameters name
			check 
				muladd.parameters_count=3
			end
			-- Set parameters' names, keeping a reference to the value for further usage
			param_iter := muladd.new_parameter_iterator
			param_iter.start; x:=param_iter.item; x.set_name("x")
			param_iter.next;  y:=param_iter.item; y.set_name("y")
			param_iter.next;  z:=param_iter.item; z.set_name("z")
			muladd.do_all_parameters (agent {LLVM_VALUE}.print_on(std_output))
			check 
				muladd.parameter(0).name.is_equal("x")
				muladd.parameter(1).name.is_equal("y")
				muladd.parameter(2).name.is_equal("z")
				muladd.for_all_parameters(agent name_not_void)
				muladd.exists_parameter(agent name_is(?,"y"))
			end
			-- Add function body
			create block.appended_in_context(global_context,muladd,"entry-block")
			create builder
			builder.position_at_end_of(block)
			tmp := builder.mul(x,y,"tmp")
			tmp2 := builder.add(tmp,z,"tmp2")
			ret := builder.return(tmp2)
		
			module.write_bitcode_to(std_output)
			-- verifyModule(*Mod, PrintMessageAction);

			-- create pass_manager
			-- pass_manager.add(createPrintModulePass(&outs()));
			-- pass_manager.run(module)
		end

feature {} -- tests agents
	name_not_void (a_value: LLVM_VALUE): BOOLEAN is
		require a_value/=Void
		do
			Result := a_value.name/=Void
		end

	name_is (a_value: LLVM_VALUE; a_name: ABSTRACT_STRING): BOOLEAN is
		require
			a_value/=Void
			a_name/=Void
		do
			Result := a_value.name.is_equal(a_name)
		end
feature {ANY} -- data
	calling_convention: LLVMCALL_CONV_ENUM

	module: LLVM_MODULE 
	muladd: LLVM_FUNCTION 
		-- A function computes Result=x*y+z.
	builder: LLVM_BUILDER  
	block: LLVM_BASIC_BLOCK 
	-- pass_manager: LLVM_PASS_MANAGER

	muladd_type: LLVM_FUNCTION_TYPE 


end -- class LLVM_EXAMPLE

-- Copyright 2009 Paolo Redaelli

