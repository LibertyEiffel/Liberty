deferred class LIBERTY_FEATURE_DEFINITION

feature {LIBERTY_FEATURE, LIBERTY_TYPE_BUILDER}
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

end
