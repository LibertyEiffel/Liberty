class LIBERTY_RESULT

inherit
	LIBERTY_WRITABLE

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	name: FIXED_STRING is
		once
			create Result.make_from_string("Result")
		end

	result_type: LIBERTY_TYPE

	is_result_type_set: BOOLEAN is True

feature {}
	make (a_result_type: like result_type) is
		require
			a_result_type /= Void
		do
			result_type := a_result_type
		ensure
			result_type = a_result_type
		end

end
