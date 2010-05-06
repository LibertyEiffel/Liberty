deferred class TYPED_NODE
	-- A Gccxml node with "type" attribute
inherit GCCXML_NODE
insert SHARED_COLLECTIONS
feature 

	type: UNICODE_STRING is 
		do 
			Result:=attribute_at(once U"type") 
		ensure Result/=Void
		end

	referree: TYPED_NODE is
		-- The node referred by `type' in `types' dictionary.
	do
		Result:=types.at(type)
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

	assigned_name: STRING 
		-- The name under which Current will be forcefully wrapped to.

	set_name (a_name: STRING) is
		-- Set `assigned_name' to `a_name'.
	require a_name/=Void
	do
		assigned_name:=a_name
	ensure definition: assigned_name=a_name
	end
end
