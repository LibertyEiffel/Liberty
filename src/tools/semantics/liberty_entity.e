deferred class LIBERTY_ENTITY

inherit
	LIBERTY_POSITIONABLE

feature {ANY}
	name: FIXED_STRING is
		deferred
		end

	result_type: LIBERTY_TYPE is
		deferred
		end

end
