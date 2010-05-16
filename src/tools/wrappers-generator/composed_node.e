deferred class COMPOSED_NODE
	-- A GCCXML node having "members" attribute. This attribute contains the
	-- ids of the fields that compose the actual object referred by Current
	-- node, for example a structure, a union, (a class?). 
inherit STORABLE_NODE
feature 
	store is
		deferred 
		ensure fields/=Void
		end

	fields: COLLECTION[C_FIELD]

	members: UNICODE_STRING is
		do
			Result:=attribute_at(once U"members")
		end

end
