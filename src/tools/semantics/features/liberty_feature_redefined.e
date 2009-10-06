class LIBERTY_FEATURE_REDEFINED

inherit
	LIBERTY_FEATURE

create {LIBERTY_TYPE_BUILDER}
	make

feature {LIBERTY_TYPE_BUILDER}
	set_redefined_feature (a_feature: like redefined_feature) is
		require
			only_once: redefined_feature = Void
			useful: a_feature /= Void
		do
			redefined_feature := a_feature
			set_precondition(a_feature.precondition)
			set_postcondition(a_feature.postcondition)
			set_result_type(a_feature.result_type)
			set_parameters(a_feature.parameters)
			set_obsolete(a_feature.obsolete_message)
		ensure
			redefined_feature = a_feature
		end

	redefined_feature: LIBERTY_FEATURE

end
