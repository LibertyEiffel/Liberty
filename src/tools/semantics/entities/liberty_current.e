-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_CURRENT

inherit
	LIBERTY_ENTITY

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	name: FIXED_STRING is
		once
			create Result.make_from_string("Current")
		end

	result_type: LIBERTY_TYPE

	is_result_type_set: BOOLEAN is True

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
