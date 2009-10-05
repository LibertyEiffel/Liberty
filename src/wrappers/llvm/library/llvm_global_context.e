class LLVM_GLOBAL_CONTEXT
	-- The global context of LowLevelVirtualMachine singleton.
inherit LLVM_CONTEXT redefine default_create end 
insert SINGLETON redefine default_create end 

creation  default_create
feature
	default_create is
		do
			handle:=llvmget_global_context
		end
end -- class LLVM_GLOBAL_CONTEXT
