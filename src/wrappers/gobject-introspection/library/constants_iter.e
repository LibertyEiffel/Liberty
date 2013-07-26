expanded class CONSTANTS_ITER
	-- An expanded iterator over constants of a GI_CLASS
insert GI_ITERATOR[GI_CONSTANT_INFO]
feature {ANY}
	start is
		do
			i:=object.constants_lower
		end

	is_off: BOOLEAN is
		require set: object/=Void
		do
			Result:=i>object.constants_upper
		end

	item: GI_CONSTANT_INFO is 
	require set: object/=Void
	do 
		Result:=object.constant(i)
	end

	next is
		require set: object/=Void
		do
			i:=i+1
		end

end -- class VFUNCS_ITER

