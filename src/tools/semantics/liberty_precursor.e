-- Copyright (C) 2009 Cyril ADRIAN
--
deferred class LIBERTY_PRECURSOR

feature {ANY}
	the_feature: LIBERTY_FEATURE
	actuals: TRAVERSABLE[LIBERTY_EXPRESSION]

feature {}
	make (a_feature: like the_feature; a_actuals: like actuals) is
		require
			a_feature /= Void
			a_actuals /= Void
		do
			the_feature := a_feature
			actuals := a_actuals
		ensure
			the_feature = a_feature
			actuals = a_actuals
		end

invariant
	the_feature /= Void
	actuals /= Void

end
