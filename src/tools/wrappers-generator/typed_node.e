deferred class TYPED_NODE
	-- A Gccxml node with "type" attribute
inherit GCCXML_NODE

feature 

	type: UNICODE_STRING is 
		do 
			Result:=attribute_at(once U"type") 
		ensure Result/=Void
		end

	is_fundamental: BOOLEAN is
		-- Does current node refers to a fundamental C type?
		deferred 
		end

	is_void: BOOLEAN is
		-- Is Current node of type void?
		deferred
		end

	has_wrapper: BOOLEAN is
		-- Does Current actually have a wrapper type in Liberty?
		deferred
		end

	wrapper_type: STRING is
		-- The name of the class of Liberty that wraps Current fundamental type.
	require
		not is_void
		has_wrapper
	deferred
	end

end
