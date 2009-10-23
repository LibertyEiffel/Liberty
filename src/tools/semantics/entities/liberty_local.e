class LIBERTY_LOCAL

inherit
	LIBERTY_ENTITY

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	name: FIXED_STRING
	result_type: LIBERTY_TYPE

	is_result_type_set: BOOLEAN is True

feature {}
	make (a_name: STRING; a_result_type: like result_type) is
		require
			a_name /= Void
			a_result_type /= Void
		do
			create name.make_from_string(a_name)
			result_type := a_result_type
		ensure
			name.is_equal(a_name)
			result_type = a_result_type
		end

invariant
	name /= Void
	result_type /= Void

end
