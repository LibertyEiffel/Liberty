class LIBERTY_FEATURE

insert
	ANY

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	result_type: LIBERTY_TYPE
	parameters: COLLECTION[LIBERTY_PARAMETER]

	precondition: LIBERTY_REQUIRE
	postcondition: LIBERTY_ENSURE

	obsolete_message: STRING

	is_obsolete: BOOLEAN is
		do
			Result := obsolete_message /= Void
		end

feature {LIBERTY_TYPE_BUILDER}
	bind (child: LIBERTY_FEATURE; type: LIBERTY_TYPE) is
		do
			late_binding.add(child, type)
		end

	set_parameters (a_parameters: like parameters) is
		do
			parameters := a_parameters
		ensure
			parameters = a_parameters
		end

	set_result_type (a_result_type: like result_type) is
		do
			result_type := a_result_type
		ensure
			result_type = a_result_type
		end

	precondition_set: BOOLEAN is
		do
			Result := precondition /= Void
		end

	set_precondition (assertions: like precondition) is
		require
			not precondition_set
		do
			precondition := assertions
		ensure
			precondition = assertions
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

feature {}
	make is
		do
			create {HASHED_DICTIONARY[LIBERTY_FEATURE, LIBERTY_TYPE]}late_binding.make
		end

	late_binding: DICTIONARY[LIBERTY_FEATURE, LIBERTY_TYPE]

invariant
	late_binding /= Void

end
