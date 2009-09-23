deferred class LIBERTY_TYPED
	-- A node in an xml file made by gccxml that represents a C entity having a
	-- corrispondent wrapper type in Liberty.
inherit GCCXML_NODE

insert EXCEPTIONS

feature 
	wrapper_type: STRING is
		-- The name of the class of Liberty that wraps Current fundamental type.

		-- Result will be empty when the type is "void"; an exception will be
		-- raised when there's no wrapper type. 
		deferred
		end

end -- class LIBERTY_TYPED
