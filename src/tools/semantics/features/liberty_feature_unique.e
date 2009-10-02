class LIBERTY_FEATURE_UNIQUE

inherit
	LIBERTY_FEATURE

create {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (a_type: like result_type) is
		require
			a_type /= Void
		do
			result_type := a_type
		ensure
			result_type = a_type
		end

invariant
	result_type /= Void

end
