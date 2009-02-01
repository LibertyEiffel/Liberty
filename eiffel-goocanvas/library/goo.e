deferred class GOO
	-- Access to GOO_LIBRARY singleton
feature 
	goo: GOO_LIBRARY is
		once
			create Result
		end
	end
