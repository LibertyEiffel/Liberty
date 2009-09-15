-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class BINARY_OPS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = binaryopsbegin) or else 
				(a_value = add) or else 
				(a_value = fadd) or else 
				(a_value = sub) or else 
				(a_value = fsub) or else 
				(a_value = mul) or else 
				(a_value = fmul) or else 
				(a_value = udiv) or else 
				(a_value = sdiv) or else 
				(a_value = fdiv) or else 
				(a_value = urem) or else 
				(a_value = srem) or else 
				(a_value = frem) or else 
				(a_value = shl) or else 
				(a_value = lshr) or else 
				(a_value = ashr) or else 
				(a_value = and) or else 
				(a_value = or) or else 
				(a_value = xor) or else 
				(a_value = binaryopsend))
		end

feature -- Setters
	default_create,  set_binaryopsbegin is
	
		do
			value := binaryopsbegin
		end

	 set_add is
	
		do
			value := add
		end

	 set_fadd is
	
		do
			value := fadd
		end

	 set_sub is
	
		do
			value := sub
		end

	 set_fsub is
	
		do
			value := fsub
		end

	 set_mul is
	
		do
			value := mul
		end

	 set_fmul is
	
		do
			value := fmul
		end

	 set_udiv is
	
		do
			value := udiv
		end

	 set_sdiv is
	
		do
			value := sdiv
		end

	 set_fdiv is
	
		do
			value := fdiv
		end

	 set_urem is
	
		do
			value := urem
		end

	 set_srem is
	
		do
			value := srem
		end

	 set_frem is
	
		do
			value := frem
		end

	 set_shl is
	
		do
			value := shl
		end

	 set_lshr is
	
		do
			value := lshr
		end

	 set_ashr is
	
		do
			value := ashr
		end

	 set_and is
	
		do
			value := and
		end

	 set_or is
	
		do
			value := or
		end

	 set_xor is
	
		do
			value := xor
		end

	 set_binaryopsend is
	
		do
			value := binaryopsend
		end

feature -- Queries
	is_binaryopsbegin: BOOLEAN is
		
		do
			Result := (value=binaryopsbegin)
		end

	is_add: BOOLEAN is
		
		do
			Result := (value=add)
		end

	is_fadd: BOOLEAN is
		
		do
			Result := (value=fadd)
		end

	is_sub: BOOLEAN is
		
		do
			Result := (value=sub)
		end

	is_fsub: BOOLEAN is
		
		do
			Result := (value=fsub)
		end

	is_mul: BOOLEAN is
		
		do
			Result := (value=mul)
		end

	is_fmul: BOOLEAN is
		
		do
			Result := (value=fmul)
		end

	is_udiv: BOOLEAN is
		
		do
			Result := (value=udiv)
		end

	is_sdiv: BOOLEAN is
		
		do
			Result := (value=sdiv)
		end

	is_fdiv: BOOLEAN is
		
		do
			Result := (value=fdiv)
		end

	is_urem: BOOLEAN is
		
		do
			Result := (value=urem)
		end

	is_srem: BOOLEAN is
		
		do
			Result := (value=srem)
		end

	is_frem: BOOLEAN is
		
		do
			Result := (value=frem)
		end

	is_shl: BOOLEAN is
		
		do
			Result := (value=shl)
		end

	is_lshr: BOOLEAN is
		
		do
			Result := (value=lshr)
		end

	is_ashr: BOOLEAN is
		
		do
			Result := (value=ashr)
		end

	is_and: BOOLEAN is
		
		do
			Result := (value=and)
		end

	is_or: BOOLEAN is
		
		do
			Result := (value=or)
		end

	is_xor: BOOLEAN is
		
		do
			Result := (value=xor)
		end

	is_binaryopsend: BOOLEAN is
		
		do
			Result := (value=binaryopsend)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	binaryopsbegin: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "BinaryOpsBegin"
 			}"
 		end

	add: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Add"
 			}"
 		end

	fadd: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FAdd"
 			}"
 		end

	sub: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Sub"
 			}"
 		end

	fsub: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FSub"
 			}"
 		end

	mul: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Mul"
 			}"
 		end

	fmul: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FMul"
 			}"
 		end

	udiv: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "UDiv"
 			}"
 		end

	sdiv: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "SDiv"
 			}"
 		end

	fdiv: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FDiv"
 			}"
 		end

	urem: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "URem"
 			}"
 		end

	srem: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "SRem"
 			}"
 		end

	frem: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "FRem"
 			}"
 		end

	shl: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Shl"
 			}"
 		end

	lshr: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "LShr"
 			}"
 		end

	ashr: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "AShr"
 			}"
 		end

	and: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "And"
 			}"
 		end

	or: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Or"
 			}"
 		end

	xor: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "Xor"
 			}"
 		end

	binaryopsend: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "llvm-plugin"
 			feature_name: "BinaryOpsEnd"
 			}"
 		end

end

