deferred class LLVM_CAST_INST
	-- The base class for all instructions that perform data casts. It is
	-- simply provided so that instruction category testing can be performed
	-- with code like (in C++ TODO to be trnslated): if(isa<CastInst>(Instr)) {
	-- ... }

inherit LLVM_UNARY_INST

end -- class LLVM_CAST_INST

-- Copyright 2009 Paolo Redaelli
