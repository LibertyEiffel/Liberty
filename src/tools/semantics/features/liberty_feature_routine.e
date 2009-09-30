deferred class LIBERTY_FEATURE_ROUTINE

inherit
	LIBERTY_FEATURE

feature {ANY}
	precondition: LIBERTY_REQUIRE
	postconditions: LIBERTY_ENSURE

feature {LIBERTY_TYPE_BUILDER}
	precondition_set: BOOLEAN is
		do
			Result := precondition /= Void
		end

	set_require (assertions: like preconditions) is
		require
			not precondition_set
		do
			preconditions := assertions
		ensure
			preconditions = assertions
		end

	postcondition_set: BOOLEAN is
		do
			Result := postcondition /= Void
		end

	set_ensure (assertions: like postconditions) is
		require
			not postcondition_set
		do
			postconditions := assertions
		ensure
			postconditions = assertions
		end

end
