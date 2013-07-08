expanded class FIELDS_ITER
	-- An expanded iterator over methods of a GI_OBJECT_INFO
insert ITERATOR[GI_FIELD_INFO]
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
			i:=object.fields_lower
		end
	is_off: BOOLEAN is
		require set: object/=Void
		do
			Result:=i>object.fields_upper
		end

		item: GI_FIELD_INFO is 
		require set: object/=Void
	do 
		Result:=object.field(i)
	end

	next is
		require set: object/=Void
		do
			i:=i+1
		end

feature {GI_OBJECT_INFO} -- Implementation
	object: GI_OBJECT_INFO
	i: INTEGER
end -- class FIELDS_ITER

