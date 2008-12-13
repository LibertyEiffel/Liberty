deferred class SHARED_XML_NODE_CACHE
	-- Shared access to XML_NODE_CACHE singleton
insert ANY undefine copy, is_equal end 
feature
	cache: XML_NODE_CACHE is
		once
			create Result
		end
end -- class

