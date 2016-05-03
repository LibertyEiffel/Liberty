deferred class SHARED_XML2_NODE_CACHE
	-- Shared access to XML2_NODE_CACHE singleton
insert ANY undefine copy, is_equal end 
feature {ANY}
	cache: XML2_NODE_CACHE is
		once
			create Result
		end
end -- class

