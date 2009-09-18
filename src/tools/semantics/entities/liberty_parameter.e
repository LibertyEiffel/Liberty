class LIBERTY_PARAMETER

inherit
	LIBERTY_ENTITY

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	name: STRING
	result_type: LIBERTY_TYPE

feature {}
	make (a_name: like name; a_result_type: like result_type) is
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
