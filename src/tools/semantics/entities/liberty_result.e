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

feature {}
	make is
		do
		end

end
