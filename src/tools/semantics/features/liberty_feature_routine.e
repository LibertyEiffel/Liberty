deferred class LIBERTY_FEATURE_ROUTINE

inherit
	LIBERTY_FEATURE

feature {ANY}
	precondition: LIBERTY_REQUIRE
	postcondition: LIBERTY_ENSURE

	obsolete_message: STRING

	is_obsolete: BOOLEAN is
		do
			Result := obsolete_message /= Void
		end

feature {LIBERTY_TYPE_BUILDER}
	precondition_set: BOOLEAN is
		do
			Result := precondition /= Void
		end

	set_precondition (assertions: like preconditions) is
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

	set_postcondition (assertions: like postcondition) is
		require
			not postcondition_set
		do
			postcondition := assertions
		ensure
			postcondition = assertions
		end

	set_obsolete (a_obsolete: like obsolete_message) is
		do
			obsolete_message := a_obsolete
		ensure
			a_obsolete /= Void implies is_obsolete
			obsolete_message = a_obsolete
		end

end
