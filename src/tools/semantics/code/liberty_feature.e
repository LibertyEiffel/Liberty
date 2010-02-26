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

inherit
	LIBERTY_TAGGED

insert
	LIBERTY_REACHABLE_MARKED
	VISITABLE

feature {ANY}
	definition_type: LIBERTY_ACTUAL_TYPE
			-- the type where the feature is written

	result_type: LIBERTY_TYPE is
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

	accelerate_call (a: LIBERTY_FEATURE_ACCELERATOR) is
		do
			accelerator.call([a, Current])
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: like reachable_mark) is
		do
			if not is_reachable then
				debug
					std_output.put_string(once "Marked reachable the feature: ")
					std_output.put_line(out)
				end
				torch.burn
			end
			if reachable_mark < mark then
				reachable_mark := mark
				definition_type.mark_reachable_code(mark)
				if precondition /= Void then
					precondition.mark_reachable_code(mark)
				end
				if postcondition /= Void then
					postcondition.mark_reachable_code(mark)
				end
			end
		end

feature {LIBERTY_FEATURE_ENTITY}
	can_check_agent_signature: BOOLEAN is
		local
			i: INTEGER
		do
			from
				Result := result_type = Void or else result_type.is_actual_type_set
				i := parameters.lower
			until
				not Result or else i > parameters.upper
			loop
				Result := parameters.item(i).result_type.is_actual_type_set
				i := i + 1
			end
		ensure
			can_also_check_result_type: Result implies (result_type = Void or else result_type.is_actual_type_set)
		end

	check_agent_signature (a_agent_arguments: COLLECTION[LIBERTY_ACTUAL_TYPE]): COLLECTION[LIBERTY_ACTUAL_TYPE] is
		require
			can_check_agent_signature
		local
			i: INTEGER
		do
			if a_agent_arguments.is_empty then
				-- zero args is the same thing as all open args
				if parameters.is_empty then
					Result := a_agent_arguments
				else
					create {FAST_ARRAY[LIBERTY_ACTUAL_TYPE]} Result.with_capacity(parameters.count)
					from
						i := parameters.lower
					until
						i > parameters.upper
					loop
						Result.add_last(parameters.item(i).result_type.actual_type)
						i := i + 1
					end
				end
			elseif a_agent_arguments.count /= parameters.count then
				--|*** TODO: error: bad number of arguments
				not_yet_implemented
			else
				--|*** TODO: is there anything to do about open arguments?
				Result := a_agent_arguments
			end
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

feature {ANY}
	is_bound (type: LIBERTY_ACTUAL_TYPE): BOOLEAN is
		do
			Result := late_binding.fast_has(type)
		end

	bound (type: LIBERTY_ACTUAL_TYPE): LIBERTY_FEATURE is
		do
			Result := late_binding.fast_reference_at(type)
			if Result = Void then
				Result := Current
			end
		ensure
			Result /= Void
			not is_bound(type) implies Result = Current
		end

feature {LIBERTY_TYPE_BUILDER_TOOLS}
	bind (child: LIBERTY_FEATURE; type: LIBERTY_ACTUAL_TYPE) is
		require
			not is_bound(type)
		do
			late_binding.put(child, type)
		ensure
			bound(type) = child
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
	make (a_definition_type: like definition_type; a_accelerator: like accelerator) is
		require
			a_definition_type /= Void
		do
			definition_type := a_definition_type
			create {HASHED_DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]} late_binding.make
			accelerator := a_accelerator
		ensure
			definition_type = a_definition_type
			accelerator = a_accelerator
		end

	late_binding: DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]
	accelerator: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]

	errors: LIBERTY_ERRORS
	torch: LIBERTY_ENLIGHTENING_THE_WORLD

invariant
	late_binding /= Void
	definition_type /= Void

end -- class LIBERTY_FEATURE
