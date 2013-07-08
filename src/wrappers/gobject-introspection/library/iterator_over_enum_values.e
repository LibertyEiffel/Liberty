class ITERATOR_OVER_ENUM_VALUES
inherit ITERATOR[GI_VALUE_INFO]
creation {GI_ENUM_INFO} from_enum
feature {} -- Creation
	from_enum (an_enum: GI_ENUM_INFO) is
	require a_enum/=Void
	do
		enum:=an_enum
	end

	start is
	do
		i:=enum.lower
	end

	item: GI_VALUE_INFO is
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

