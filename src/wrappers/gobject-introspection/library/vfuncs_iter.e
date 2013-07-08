expanded class VFUNCS_ITER
	-- An expanded iterator over virtual functions of a GI_CLASS
insert ITERATOR[GI_VFUNC_INFO]
feature {GI_CLASS} 
	set_class (an_object: GI_CLASS) is
		require an_object/=Void
		do
			object:=an_object
		end

feature {ANY}
	start is
		require set: object/=Void
		do
			i:=object.virtual_functions_lower
		end
	is_off: BOOLEAN is
		require set: object/=Void
		do
			Result:=i>object.virtual_functions_upper
		end

	item: GI_VFUNC_INFO
	is 
	require set: object/=Void
	do 
		Result:=object.virtual_function(i)
	end

	next is
		require set: object/=Void
		do
			i:=i+1
		end

feature {GI_CLASS} -- Implementation
	object: GI_CLASS
	i: INTEGER
end -- class VFUNCS_ITER

