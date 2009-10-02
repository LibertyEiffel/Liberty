deferred class LIBERTY_ASSERTIONS

feature {LIBERTY_TYPE_BUILDER}
	infix "and then" (other: LIBERTY_ASSERTIONS): LIBERTY_ASSERTIONS is
			-- Considering that `Current' is the parent, adds an "and then" assertions block. Used by "require
			-- then", "ensure then", and "invariant".
		do
			create {LIBERTY_ASSERTIONS_AND_THEN}Result.make(Current, other)
		ensure
			Result /= Void
		end

	infix "or else" (other: LIBERTY_ASSERTIONS): LIBERTY_ASSERTIONS is
			-- Considering that `Current' is the parent, adds an "or else" assertions block. Used by "require
			-- else".
		do
			create {LIBERTY_ASSERTIONS_OR_ELSE}Result.make(Current, other)
		ensure
			Result /= Void
		end

end
