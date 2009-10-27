-- Copyright (C) 2009 Cyril ADRIAN
--
deferred class LIBERTY_WRITABLE

inherit
	LIBERTY_ENTITY

feature {ANY}
	result_type: LIBERTY_TYPE is
		deferred
		ensure
			Result /= Void
		end

end
