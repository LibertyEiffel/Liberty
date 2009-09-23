class C_ENUM_VALUE

inherit 
	GCCXML_NODE
	NAMED_NODE

creation make

feature 
	value: INTEGER is
		-- The numeric value of Current
		do
			Result:=attribute_at(once U"init").as_utf8.to_integer
		end

-- invariant name.is_equal(once U"EnumValue")
end

