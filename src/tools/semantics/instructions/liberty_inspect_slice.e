-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_INSPECT_SLICE

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	lower, upper: LIBERTY_EXPRESSION

feature {}
	make (a_lower: like lower; a_upper: like upper) is
		require
			a_lower /= Void
		do
			lower := a_lower
			if a_upper /= Void then
				upper := a_upper
			else
				upper := a_lower
			end
		ensure
			lower = a_lower
			a_upper /= Void implies upper = a_upper
			a_upper = Void implies upper = a_lower
		end

invariant
	lower /= Void
	upper /= Void

end
