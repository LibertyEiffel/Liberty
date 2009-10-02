-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class CAST_OPS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = castopsbegin) or else 
				(a_value = trunc) or else 
				(a_value = zext) or else 
				(a_value = sext) or else 
				(a_value = fptoui) or else 
				(a_value = fptosi) or else 
				(a_value = uitofp) or else 
				(a_value = sitofp) or else 
				(a_value = fptrunc) or else 
				(a_value = fpext) or else 
				(a_value = ptrtoint) or else 
				(a_value = inttoptr) or else 
				(a_value = bitcast) or else 
				(a_value = castopsend))
		end

feature -- Setters
	default_create,  set_castopsbegin is
	
		do
			value := castopsbegin
		end

	 set_trunc is
	
		do
			value := trunc
		end

	 set_zext is
	
		do
			value := zext
		end

	 set_sext is
	
		do
			value := sext
		end

	 set_fptoui is
	
		do
			value := fptoui
		end

	 set_fptosi is
	
		do
			value := fptosi
		end

	 set_uitofp is
	
		do
			value := uitofp
		end

	 set_sitofp is
	
		do
			value := sitofp
		end

	 set_fptrunc is
	
		do
			value := fptrunc
		end

	 set_fpext is
	
		do
			value := fpext
		end

	 set_ptrtoint is
	
		do
			value := ptrtoint
		end

	 set_inttoptr is
	
		do
			value := inttoptr
		end

	 set_bitcast is
	
		do
			value := bitcast
		end

	 set_castopsend is
	
		do
			value := castopsend
		end

feature -- Queries
	is_castopsbegin: BOOLEAN is
		
		do
			Result := (value=castopsbegin)
		end

	is_trunc: BOOLEAN is
		
		do
			Result := (value=trunc)
		end

	is_zext: BOOLEAN is
		
		do
			Result := (value=zext)
		end

	is_sext: BOOLEAN is
		
		do
			Result := (value=sext)
		end

	is_fptoui: BOOLEAN is
		
		do
			Result := (value=fptoui)
		end

	is_fptosi: BOOLEAN is
		
		do
			Result := (value=fptosi)
		end

	is_uitofp: BOOLEAN is
		
		do
			Result := (value=uitofp)
		end

	is_sitofp: BOOLEAN is
		
		do
			Result := (value=sitofp)
		end

	is_fptrunc: BOOLEAN is
		
		do
			Result := (value=fptrunc)
		end

	is_fpext: BOOLEAN is
		
		do
			Result := (value=fpext)
		end

	is_ptrtoint: BOOLEAN is
		
		do
			Result := (value=ptrtoint)
		end

	is_inttoptr: BOOLEAN is
		
		do
			Result := (value=inttoptr)
		end

	is_bitcast: BOOLEAN is
		
		do
			Result := (value=bitcast)
		end

	is_castopsend: BOOLEAN is
		
		do
			Result := (value=castopsend)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	castopsbegin: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "CastOpsBegin"
 			}"
 		end

	trunc: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Trunc"
 			}"
 		end

	zext: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "ZExt"
 			}"
 		end

	sext: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "SExt"
 			}"
 		end

	fptoui: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FPToUI"
 			}"
 		end

	fptosi: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FPToSI"
 			}"
 		end

	uitofp: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "UIToFP"
 			}"
 		end

	sitofp: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "SIToFP"
 			}"
 		end

	fptrunc: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FPTrunc"
 			}"
 		end

	fpext: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FPExt"
 			}"
 		end

	ptrtoint: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "PtrToInt"
 			}"
 		end

	inttoptr: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "IntToPtr"
 			}"
 		end

	bitcast: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "BitCast"
 			}"
 		end

	castopsend: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "CastOpsEnd"
 			}"
 		end

end

