deferred class LIBERTY_WRITABLE

inherit
	LIBERTY_ENTITY
		redefine
			result_type
		end

feature {ANY}
	result_type: LIBERTY_TYPE is
		deferred
		ensure then
			Result /= Void
		end

end
