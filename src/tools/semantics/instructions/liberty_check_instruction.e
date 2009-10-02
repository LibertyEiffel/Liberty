class LIBERTY_CHECK_INSTRUCTION

inherit
	LIBERTY_INSTRUCTION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	checks: LIBERTY_CHECK

feature {}
	make (a_checks: like checks) is
		require
			a_checks /= Void
		do
			checks := a_checks
		ensure
			checks = a_checks
		end

invariant
	checks /= Void

end
