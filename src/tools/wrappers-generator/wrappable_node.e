deferred class WRAPPABLE_NODE
	-- A node of an XML file produced by gccxml that is wrappable for Liberty
	-- as part of a wider class. Some parent node - a
	-- STAND_ALONE_WRAPPABLE_NODE - will provide an output stream where to put
	-- the wrapper.

inherit GCCXML_NODE
feature 
	wrap_on (a_stream: OUTPUT_STREAM) is
		-- Put the wrapper on `a_stream'
	require 
		a_stream /= Void
		buffer.is_empty
	deferred 
	ensure buffer.is_empty
	end
end -- class WRAPPABLE_NODE

