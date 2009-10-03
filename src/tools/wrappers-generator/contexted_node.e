deferred class CONTEXTED_NODE
	-- A Gccxml node with "context" attribute
inherit GCCXML_NODE
insert SHARED_COLLECTIONS
feature 

	context: UNICODE_STRING is 
		do 
			Result:=attribute_at(once U"context") 
		ensure Result/=Void
		end

	namespace: C_NAMESPACE is
		do
			Result:=namespaces.reference_at(context)
		end

	is_in_main_namespace: BOOLEAN is
		-- Does Current belong to the main ("::") namespace?
	do
		Result := namespace.c_name.is_equal(once U"::")
	end
end
