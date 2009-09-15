deferred class LIBERTY_TYPED
	-- A node in an xml file made by gccxml that represents a C entity having a
	-- corrispondent wrapper type in Liberty.
inherit GCCXML_NODE

feature 
	wrapper_type: STRING is
		-- The name of the class of Liberty that wraps Current fundamental type.

		-- Result will be 
		-- * empty when the type is "void"
		-- * Void whtn there's no type Liberty type. 
		deferred
		end

end -- class LIBERTY_TYPED
