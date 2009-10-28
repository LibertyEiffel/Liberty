-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_FEATURE_REDEFINED

inherit
	LIBERTY_FEATURE

create {LIBERTY_TYPE_BUILDER}
	make

feature {LIBERTY_FEATURE_DEFINITION}
	join (a_feature: LIBERTY_FEATURE): LIBERTY_FEATURE is
		do
			Result := a_feature.joined_redefined(Current)
		end

feature {LIBERTY_FEATURE}
	joined_attribute (a_feature: LIBERTY_FEATURE_ATTRIBUTE): LIBERTY_FEATURE is
		do
			fatal_join_error_redefined_concrete(Current, a_feature)
		end

	joined_constant (a_feature: LIBERTY_FEATURE_CONSTANT): LIBERTY_FEATURE is
		do
			fatal_join_error_redefined_concrete(Current, a_feature)
		end

	joined_deferred (a_feature: LIBERTY_FEATURE_DEFERRED): LIBERTY_FEATURE is
		do
			--| *** TODO: warning, mixed undefine and redefine, expected redefinition
			Result := Current
		end

	joined_do (a_feature: LIBERTY_FEATURE_DO): LIBERTY_FEATURE is
		do
			fatal_join_error_redefined_concrete(Current, a_feature)
		end

	joined_external (a_feature: LIBERTY_FEATURE_EXTERNAL): LIBERTY_FEATURE is
		do
			fatal_join_error_redefined_concrete(Current, a_feature)
		end

	joined_once (a_feature: LIBERTY_FEATURE_ONCE): LIBERTY_FEATURE is
		do
			fatal_join_error_redefined_concrete(Current, a_feature)
		end

	joined_redefined (a_feature: LIBERTY_FEATURE_REDEFINED): LIBERTY_FEATURE is
		do
			Result := Current
		end

	joined_unique (a_feature: LIBERTY_FEATURE_UNIQUE): LIBERTY_FEATURE is
		do
			fatal_join_error_redefined_concrete(Current, a_feature)
		end

feature {LIBERTY_TYPE_BUILDER}
	set_redefined_feature (a_feature: like redefined_feature) is
		require
			only_once: redefined_feature = Void
			useful: a_feature /= Void
		do
			redefined_feature := a_feature
			set_precondition(a_feature.precondition)
			set_postcondition(a_feature.postcondition)
			set_context(a_feature.context)
			set_obsolete(a_feature.obsolete_message)
		ensure
			redefined_feature = a_feature
		end

	redefined_feature: LIBERTY_FEATURE

end
