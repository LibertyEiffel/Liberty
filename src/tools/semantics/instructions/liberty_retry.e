class LIBERTY_RETRY

inherit
	LIBERTY_INSTRUCTION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	the_feature: LIBERTY_FEATURE

feature {LIBERTY_FEATURE_LOCAL_CONTEXT}
	set_feature (a_feature: like the_feature) is
		require
			a_feature /= Void
		do
			the_feature := a_feature
		ensure
			the_feature = a_feature
		end

feature {}
	make is
		do
		end

end
