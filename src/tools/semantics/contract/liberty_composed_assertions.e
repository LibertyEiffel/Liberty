deferred class LIBERTY_COMPOSED_ASSERTIONS

inherit
	LIBERTY_ASSERTIONS

feature {}
	left, right: LIBERTY_ASSERTIONS

	make (a_left: like left; a_right: like right) is
		require
			a_left /= Void
			a_right /= Void
		do
			left := a_left
			right := a_right
		ensure
			left = a_left
			right = a_right
		end

invariant
	left /= Void
	right /= Void

end
