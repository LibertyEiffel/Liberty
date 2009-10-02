class LIBERTY_FEATURE_REDEFINED

inherit
	LIBERTY_FEATURE_ROUTINE

create {LIBERTY_TYPE_BUILDER}
	make

feature {LIBERTY_TYPE_BUILDER}
	set_redefined_feature (a_feature: like redefined_feature) is
		require
			only_once: redefined_feature = Void
			useful: a_feature /= Void
		do
			redefined_feature := a_feature
		ensure
			redefined_feature = a_feature
		end

	redefined_feature: LIBERTY_FEATURE

feature {}
	make is
		do
		end

end
