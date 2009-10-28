-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_FEATURE

insert
	ANY

feature {ANY}
	result_type: LIBERTY_TYPE is
		do
			Result := context.result_type
		end

	context: LIBERTY_FEATURE_LOCAL_CONTEXT

	precondition: LIBERTY_REQUIRE
	postcondition: LIBERTY_ENSURE

	obsolete_message: STRING

	is_obsolete: BOOLEAN is
		do
			Result := obsolete_message /= Void
		end

feature {LIBERTY_FEATURE_DEFINITION}
	join (a_feature: LIBERTY_FEATURE): LIBERTY_FEATURE is
		require
			a_feature /= Void
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

feature {LIBERTY_FEATURE}
	joined_attribute (a_feature: LIBERTY_FEATURE_ATTRIBUTE): LIBERTY_FEATURE is
		require
			a_feature /= Void
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_constant (a_feature: LIBERTY_FEATURE_CONSTANT): LIBERTY_FEATURE is
		require
			a_feature /= Void
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_deferred (a_feature: LIBERTY_FEATURE_DEFERRED): LIBERTY_FEATURE is
		require
			a_feature /= Void
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_do (a_feature: LIBERTY_FEATURE_DO): LIBERTY_FEATURE is
		require
			a_feature /= Void
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_external (a_feature: LIBERTY_FEATURE_EXTERNAL): LIBERTY_FEATURE is
		require
			a_feature /= Void
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_once (a_feature: LIBERTY_FEATURE_ONCE): LIBERTY_FEATURE is
		require
			a_feature /= Void
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_redefined (a_feature: LIBERTY_FEATURE_REDEFINED): LIBERTY_FEATURE is
		require
			a_feature /= Void
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_unique (a_feature: LIBERTY_FEATURE_UNIQUE): LIBERTY_FEATURE is
		require
			a_feature /= Void
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

feature {}
	fatal_join_error_redefined_concrete (f1, f2: LIBERTY_FEATURE) is
		do
			not_yet_implemented
		ensure
			errors.has_error
		end

	fatal_join_error_deferred_concrete (f1, f2: LIBERTY_FEATURE) is
		do
			not_yet_implemented
		ensure
			errors.has_error
		end

	fatal_join_error_concrete_concrete (f1, f2: LIBERTY_FEATURE) is
		do
			not_yet_implemented
		ensure
			errors.has_error
		end

	fatal_join_error_concrete_deferred (f1, f2: LIBERTY_FEATURE) is
		do
			fatal_join_error_deferred_concrete(f2, f1)
		ensure
			errors.has_error
		end

	fatal_join_error_concrete_redefined (f1, f2: LIBERTY_FEATURE) is
		do
			fatal_join_error_redefined_concrete(f2, f1)
		ensure
			errors.has_error
		end


feature {LIBERTY_TYPE_BUILDER}
	bind (child: LIBERTY_FEATURE; type: LIBERTY_TYPE) is
		do
			late_binding.add(child, type)
		end

	set_context (a_context: like context) is
		require
			a_context /= Void
		do
			context := a_context
		ensure
			context = a_context
		end

	set_precondition (assertions: like precondition) is
		do
			precondition := assertions
		ensure
			precondition = assertions
		end

	set_postcondition (assertions: like postcondition) is
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

	errors: LIBERTY_ERRORS

invariant
	late_binding /= Void

end
