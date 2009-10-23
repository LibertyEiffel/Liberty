class LIBERTY_PARAMETER

inherit
	LIBERTY_ENTITY

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	name: FIXED_STRING

	result_type: LIBERTY_TYPE

	is_result_type_set: BOOLEAN is True

feature {}
	make (a_name: FIXED_STRING; a_result_type: like result_type) is
		require
			a_name /= Void
			a_result_type /= Void
		do
			name := a_name
			result_type := a_result_type
		ensure
			name = a_name
			result_type = a_result_type
		end

invariant
	name /= Void
	result_type /= Void

end
