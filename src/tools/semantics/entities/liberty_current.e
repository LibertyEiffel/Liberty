class LIBERTY_CURRENT

inherit
	LIBERTY_ENTITY

create {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (type: like result_type) is
		require
			type /= Void
		do
			result_type := type
		ensure
			result_type = type
		end

invariant
	result_type /= Void

end
