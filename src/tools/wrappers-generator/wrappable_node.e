deferred class WRAPPABLE_NODE
	-- A node of an XML file produced by gccxml that is wrappable for Liberty.
feature 
	wrap_on (a_stream: OUTPUT_STREAM) is
		-- Put the wrapper on `a_stream'
	require a_stream /= Void
	deferred 
	end
end -- class WRAPPABLE_NODE

