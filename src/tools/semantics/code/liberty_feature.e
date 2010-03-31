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
		redefine
			is_equal
		end

insert
	LIBERTY_REACHABLE_MARKED
		redefine
			is_equal
		end
	HASHABLE
	VISITABLE
		redefine
			is_equal
		end

feature {ANY}
	id: INTEGER
			-- the feature's unique id (does not change through specialization)

	definition_type: LIBERTY_ACTUAL_TYPE
			-- the type where the feature is written

	current_type: LIBERTY_ACTUAL_TYPE is
		do
			Result := context.current_type
		end

	result_type: LIBERTY_TYPE is
		require
			has_context
		do
			Result := context.result_type
		end

	hash_code: INTEGER is
		do
			Result := id
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := id = other.id
		end

	context: LIBERTY_FEATURE_LOCAL_CONTEXT
	type_resolver: LIBERTY_TYPE_RESOLVER_IN_FEATURE

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
		local
			i: INTEGER
		do
			if current_type.is_reachable then
				if not is_reachable then
					debug ("mark.reachable")
						std_output.put_string(once "Marked reachable the feature: ")
						std_output.put_line(out)
					end
					torch.burn
				end
				if reachable_mark < mark then
					reachable_mark := mark
					if precondition /= Void then
						precondition.mark_reachable_code(mark)
					end
					if postcondition /= Void then
						postcondition.mark_reachable_code(mark)
					end
					from
						i := late_binding.lower
					until
						i > late_binding.upper
					loop
						late_binding.item(i).mark_reachable_code(mark)
						i := i + 1
					end
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
		local
			t: STRING
		do
			tabulate(o, tab)
			o.put_character('{')
			o.put_string(definition_type.full_name)
			o.put_string(once "<-")
			o.put_string(context.current_type.full_name)
			o.put_character('}')
			o.put_character(' ')
			t := generating_type
			t := t.substring(17, t.upper)
			t.to_lower
			o.put_string(t)
			context.debug_display_signature(o)
			o.put_character(' ')
			o.put_character('@')
			o.put_line(to_pointer.out)
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
	join (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_type /= Void
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

feature {LIBERTY_FEATURE}
	joined_attribute (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_ATTRIBUTE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_type /= Void
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_constant (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_CONSTANT; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_type /= Void
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_deferred (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_DEFERRED; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_type /= Void
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_do (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_DO; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_type /= Void
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_external (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_EXTERNAL; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_type /= Void
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_once (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_ONCE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_type /= Void
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_redefined (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_REDEFINED; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_type /= Void
			a_feature /= Void
			current_fd.the_feature = Current
			other_fd.the_feature = a_feature
		deferred
		ensure
			not errors.has_error implies Result /= Void
		end

	joined_unique (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE_UNIQUE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
		require
			a_type /= Void
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

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
		do
			if a_type = current_type or else not a_type.is_child_of(current_type) then
				Result := Current
			else
				Result ::= specialized.fast_reference_at(a_type)
				if Result = Void then
					Result := twin
					specialized.add(Result, a_type)
					Result.set_specialized_in(context.specialized_in(a_type))
					debug ("feature.specialization")
						std_output.put_line(once "   Binding specialized feature")
					end
					bind(Result, a_type)
				end
			end
		ensure
			Result.id = id
		end

feature {LIBERTY_TYPE_PARENT_FEATURES_LOADER}
	add_if_redefined (type: LIBERTY_ACTUAL_TYPE; name: LIBERTY_FEATURE_NAME; redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]) is
		do
			-- nothing
		end

feature {LIBERTY_FEATURE}
	set_specialized_in (a_context: like context) is
		do
			context := a_context
			check type_resolver /= Void end
			create type_resolver.specialized(type_resolver.feature_name, Current, type_resolver.parent.specialized_in(a_context.current_type))
			if precondition /= Void then
				precondition := precondition.specialized_in(a_context.current_type)
			end
			if postcondition /= Void then
				postcondition := postcondition.specialized_in(a_context.current_type)
			end
			create {FAST_ARRAY[LIBERTY_FEATURE]} precursors.with_capacity(0)
		end

feature {LIBERTY_FEATURE}
	has_precursor (a_precursor: LIBERTY_FEATURE): BOOLEAN is
		local
			i: INTEGER
		do
			Result := a_precursor = Current
			from
				i := precursors.lower
			until
				Result or else i > precursors.upper
			loop
				Result := precursors.item(i).has_precursor(a_precursor)
				i := i + 1
			end
		end

	add_precursor (a_precursor: LIBERTY_FEATURE) is
		require
			a_precursor /= Void
			a_precursor /= Current
		do
			if not has_precursor(a_precursor) then
				precursors.add_last(a_precursor)
			end
		end

	clean_binding_flag is
		local
			i: INTEGER
		do
			if is_binding then
				is_binding := False
				from
					i := precursors.lower
				until
					i > precursors.upper
				loop
					precursors.item(i).clean_binding_flag
					i := i + 1
				end
			end
		end

	precursor_bind (child: LIBERTY_FEATURE; type: LIBERTY_ACTUAL_TYPE; indent: INTEGER) is
		require
			not is_binding
		local
			i: INTEGER
		do
			debug ("type.building")
				debug_display(std_output, indent + 2)
			end
			late_binding.put(child, type)
			is_binding := True
			from
				i := precursors.lower
			until
				i > precursors.upper
			loop
				precursors.item(i).precursor_bind(child, type, indent + 1)
				i := i + 1
			end
			is_binding := False
		end

	is_binding: BOOLEAN
			-- Anti-recursion security

feature {LIBERTY_TYPE_BUILDER_TOOLS, LIBERTY_FEATURE_DEFINITION}
	set_type_resolver (a_type_resolver: like type_resolver; replace: BOOLEAN) is
		require
			a_type_resolver.local_context = context
			a_type_resolver.the_feature /= Void implies replace
			type_resolver = Void
		do
			if replace or else a_type_resolver.the_feature = Void then
				a_type_resolver.set_the_feature(Current, replace)
			end
			type_resolver := a_type_resolver
		ensure
			type_resolver = a_type_resolver
			replace implies type_resolver.the_feature = Current
		end

	bind (child: LIBERTY_FEATURE; type: LIBERTY_ACTUAL_TYPE) is
		do
			precursor_bind(child, type, 0)
			if child /= Current then
				child.add_precursor(Current)
			end
		ensure
			is_bound(type) and then bound(type) = child
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
			create {FAST_ARRAY[LIBERTY_FEATURE]} precursors.with_capacity(0)
			definition_type := a_definition_type
			create {HASHED_DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]} late_binding.with_capacity(3)
			create {HASHED_DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]} specialized.with_capacity(3)
			accelerator := a_accelerator

			ids_provider.increment
			id := ids_provider.value
		ensure
			definition_type = a_definition_type
			accelerator = a_accelerator
		end

	precursors: COLLECTION[LIBERTY_FEATURE]
			-- Conformant precursors only. Used for correct `bind' implementation.

	late_binding: DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]
	accelerator: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
	specialized: DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]

	errors: LIBERTY_ERRORS
	torch: LIBERTY_ENLIGHTENING_THE_WORLD

	ids_provider: COUNTER is
		once
			create Result
		end

invariant
	late_binding /= Void
	specialized /= Void
	definition_type /= Void
	precursors /= Void
	not precursors.fast_has(Current)

end -- class LIBERTY_FEATURE
