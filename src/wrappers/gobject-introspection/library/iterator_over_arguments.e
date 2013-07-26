class ITERATOR_OVER_ARGUMENTS
inherit ITERATOR[GI_ARG_INFO]
creation {GI_CALLABLE_INFO} from_callable
feature {} -- Creation
	from_callable (a_callable: GI_CALLABLE_INFO) is
	require a_callable/=Void
	do
		callable:=a_callable
	end

	start is
	do
		i:=callable.lower
	end

	item: GI_ARG_INFO is
		do
			Result := callable.item(i)
		end

	is_off: BOOLEAN is 
	do
		Result:=callable.valid_index(i)
	end

	next is
	do
		i:=i+1
	end

feature {}
	callable: GI_CALLABLE_INFO
	i: INTEGER	
end 

