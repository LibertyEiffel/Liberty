deferred class LIBERTY_ENTITY

inherit
	LIBERTY_POSITIONABLE

feature {ANY}
	name: FIXED_STRING is
		deferred
		end

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

invariant
	name /= Void

end
