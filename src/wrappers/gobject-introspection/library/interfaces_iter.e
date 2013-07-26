expanded class INTERFACES_ITER
	-- An expanded iterator over interfaces of a GI_OBJECT_INFO
insert ITERATOR[GI_INTERFACE_INFO]
feature {GI_OBJECT_INFO} 
	set_class (an_object: GI_OBJECT_INFO) is
		require an_object/=Void
		do
			object:=an_object
		end

feature {ANY}
	start is
		require set: object/=Void
		do
			i:=object.interfaces_lower
		end
	is_off: BOOLEAN is
		require set: object/=Void
		do
			Result=i>object.interfaces_upper
		end

	item: GI_INTERFACE_INFO is 
	require set: object/=Void
	do 
		Result:=object.interface(i)
	end

	next is
		require set: object/=Void
		do
			i:=i+1
		end

feature {GI_OBJECT_INFO} -- Implementation
	object: GI_OBJECT_INFO
	i: INTEGER
end -- class INTERFACES_ITER

