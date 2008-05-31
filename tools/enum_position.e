expanded class ENUM_POSITION 

insert ENUM 

feature 
	first, middle, last: INTEGER is unique

	default_create, set_first is do value:=first end
	set_middle is do value:=middle end
	set_last is do value:=last end

	is_first: BOOLEAN is do Result:=(value=first) end
	is_middle: BOOLEAN is do Result:=(value=middle) end
	is_last: BOOLEAN is do Result:=(value=last) end
	
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			inspect a_value 
			when 	first, middle, last then Result:= True
			else Result:=False
			end
		end
end
	
	
