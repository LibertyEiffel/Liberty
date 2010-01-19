-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
deferred class LIBERTY_FEATURE

insert
	ANY

feature {ANY}
	result_type: LIBERTY_ENTITY_TYPE is
		require
			has_context
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

	parameters: TRAVERSABLE[LIBERTY_PARAMETER] is
		require
			has_context
		do
			Result := context.parameters
		ensure
			exists: Result /= Void
		end

	has_context: BOOLEAN is
		do
			Result := context /= Void
		end

feature {ANY}
	debug_display (o: OUTPUT_STREAM; tab: INTEGER) is
		deferred
		end

feature {}
	tabulate (o: OUTPUT_STREAM; tab: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > tab
			loop
				o.put_string(once "   ")
				i := i + 1
			end
		end

feature {LIBERTY_FEATURE_DEFINITION}
	join (a_feature: LIBERTY_FEATURE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

feature {LIBERTY_FEATURE}
	joined_attribute (a_feature: LIBERTY_FEATURE_ATTRIBUTE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_constant (a_feature: LIBERTY_FEATURE_CONSTANT; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_deferred (a_feature: LIBERTY_FEATURE_DEFERRED; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_do (a_feature: LIBERTY_FEATURE_DO; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_external (a_feature: LIBERTY_FEATURE_EXTERNAL; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_once (a_feature: LIBERTY_FEATURE_ONCE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_redefined (a_feature: LIBERTY_FEATURE_REDEFINED; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_unique (a_feature: LIBERTY_FEATURE_UNIQUE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

feature {LIBERTY_TYPE_BUILDER_TOOLS}
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
			create {HASHED_DICTIONARY[LIBERTY_FEATURE, LIBERTY_TYPE]} late_binding.make
		end

	late_binding: DICTIONARY[LIBERTY_FEATURE, LIBERTY_TYPE]

	errors: LIBERTY_ERRORS

invariant
	late_binding /= Void

end
