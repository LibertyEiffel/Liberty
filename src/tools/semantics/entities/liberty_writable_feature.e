class LIBERTY_WRITABLE_FEATURE

inherit
	LIBERTY_WRITABLE

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	name: FIXED_STRING
	result_type: LIBERTY_TYPE

feature {}
	the_feature: LIBERTY_FEATURE

	make is
		do
		end

end
