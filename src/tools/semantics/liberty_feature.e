class LIBERTY_FEATURE

insert
	ANY

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	result_type: LIBERTY_TYPE
	parameters: COLLECTION[LIBERTY_PARAMETER]

feature {LIBERTY_TYPE_BUILDER}
	set_result_type (a_result_type: like result_type) is
		do
			result_type := a_result_type
		ensure
			result_type = a_result_type
		end

	can_have_parameters: BOOLEAN is
		do
			Result := parameters /= Void
		end

	add_parameter (a_parameter: LIBERTY_PARAMETER) is
		require
			can_have_parameters
		do
			parameters.add_last(a_parameter)
		ensure
			parameters.last = a_parameter
		end

	set_parameters (a_parameters: like parameters) is
		require
			a_parameters /= Void
		do
			parameters.clear_count
			parameters.append_collection(a_parameters)
		ensure
			parameters.is_equal(a_parameters)
		end

	bind (child: LIBERTY_FEATURE; type: LIBERTY_TYPE) is
		do
			late_binding.add(child, type)
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
