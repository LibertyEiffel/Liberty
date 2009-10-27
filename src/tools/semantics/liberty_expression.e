-- Copyright (C) 2009 Cyril ADRIAN
--
deferred class LIBERTY_EXPRESSION

inherit
	LIBERTY_POSITIONABLE

feature {ANY}
	result_type: LIBERTY_TYPE is
		require
			is_result_type_set
		deferred
		ensure
			Result /= Void
		end

	is_result_type_set: BOOLEAN is
		deferred
		end

end
