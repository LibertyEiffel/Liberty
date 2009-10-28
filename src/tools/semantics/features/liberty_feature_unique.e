-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_FEATURE_UNIQUE

inherit
	LIBERTY_FEATURE
		rename
			make as make_late_binding
		end

create {LIBERTY_TYPE_BUILDER}
	make

feature {LIBERTY_FEATURE_DEFINITION}
	join (a_feature: LIBERTY_FEATURE): LIBERTY_FEATURE is
		do
			Result := a_feature.joined_unique(Current)
		end

feature {LIBERTY_FEATURE}
	joined_attribute (a_feature: LIBERTY_FEATURE_ATTRIBUTE): LIBERTY_FEATURE is
		do
			fatal_join_error_concrete_concrete(Current, a_feature)
		end

	joined_constant (a_feature: LIBERTY_FEATURE_CONSTANT): LIBERTY_FEATURE is
		do
			fatal_join_error_concrete_concrete(Current, a_feature)
		end

	joined_deferred (a_feature: LIBERTY_FEATURE_DEFERRED): LIBERTY_FEATURE is
		do
			fatal_join_error_concrete_deferred(Current, a_feature)
		end

	joined_do (a_feature: LIBERTY_FEATURE_DO): LIBERTY_FEATURE is
		do
			fatal_join_error_concrete_concrete(Current, a_feature)
		end

	joined_external (a_feature: LIBERTY_FEATURE_EXTERNAL): LIBERTY_FEATURE is
		do
			fatal_join_error_concrete_concrete(Current, a_feature)
		end

	joined_once (a_feature: LIBERTY_FEATURE_ONCE): LIBERTY_FEATURE is
		do
			fatal_join_error_concrete_concrete(Current, a_feature)
		end

	joined_redefined (a_feature: LIBERTY_FEATURE_REDEFINED): LIBERTY_FEATURE is
		do
			fatal_join_error_concrete_redefined(Current, a_feature)
		end

	joined_unique (a_feature: LIBERTY_FEATURE_UNIQUE): LIBERTY_FEATURE is
		do
			fatal_join_error_concrete_concrete(Current, a_feature)
		end

feature {}
	make (a_type: like result_type) is
		require
			a_type /= Void
		do
			make_late_binding
			result_type := a_type
		ensure
			result_type = a_type
		end

invariant
	result_type /= Void

end
