class ITERATOR_OVER_ENUM_VALUES
inherit ITERATOR[GI_VALUE_INFO]
creation {GI_CALLABLE_INFO} from_enum
feature {} -- Creation
	from_enum (a_callable: GI_CALLABLE_INFO) is
	require a_enum/=Void
	do
		enum:=a_callable
	end

	start is
	do
		i:=enum.lower
	end

	item: GI_ARG_INFO is
		do
			Result := enum.item(i)
		end

	is_off: BOOLEAN is 
	do
		Result:=enum.valid_index(i)
	end

	next is
	do
		i:=i+1
	end

feature {}
	enum: GI_ENUM_INFO
	i: INTEGER	
end 

