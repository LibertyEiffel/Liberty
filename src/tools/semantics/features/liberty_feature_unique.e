-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_FEATURE_UNIQUE

inherit
	LIBERTY_FEATURE
		rename
			make as make_late_binding
		end

create {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (a_type: like result_type) is
		require
			a_type /= Void
		do
			make_late_binding
			result_type := a_type
		ensure
			result_type = a_type
		end

invariant
	result_type /= Void

end
