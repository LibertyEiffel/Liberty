class LLVM_EXAMPLE
	-- A plain example of LLVM usage producing an executable that outputs
	-- "Hello world!" and some other niceties.

creation make

feature 
	make is
		do
			create module.with_name("llvm-example")
			-- A function that print "Hello world!"
			-- A function that prints "3+5" and compute the output.
		end

	module: LLVM_MODULE
end -- class LLVM_EXAMPLE

-- Copyright 2009 Paolo Redaelli

