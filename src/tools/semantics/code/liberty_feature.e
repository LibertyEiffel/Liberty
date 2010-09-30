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
	LOGGING
		redefine
			is_equal
		end

feature {ANY}
	id: INTEGER
			-- The feature's unique id (does not change through specialization)

	definition_type: LIBERTY_ACTUAL_TYPE
			-- The type where the feature is written

	original: like Current
			-- The original feature in `definition_type', useful to tag things (such as once results...)

	is_redefined: BOOLEAN
			-- True if this feature is proxied by a LIBERTY_REDEFINED_FEATURE and should not be used by itself.

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

	context: LIBERTY_FEATURE_DEFINITION_CONTEXT
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

	has_accelerator: BOOLEAN is
		do
			Result := accelerator /= Void
		end

	accelerate_call (a: LIBERTY_FEATURE_ACCELERATOR) is
		require
			has_accelerator
		do
			accelerator.call([a, Current])
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: like reachable_mark) is
		do
			if current_type.is_reachable then
				if not is_reachable then
					debug ("mark.reachable")
						log.trace.put_string(once "Marked reachable the feature: ")
						log.trace.put_line(out)
					end
					torch.burn
				end
				if reachable_mark < mark then
					do_mark_reachable_code(mark)
				end
			end
		end

feature {}
	do_mark_reachable_code (mark: like reachable_mark) is
		require
			current_type.is_reachable
			reachable_mark < mark
			mark > 0
		local
			i: INTEGER
		do
			reachable_mark := mark
			if precondition /= Void then
				precondition.mark_reachable_code(mark)
			end
			if postcondition /= Void then
				postcondition.mark_reachable_code(mark)
			end
			from
				i := child_bindings_memory.lower
			until
				i > child_bindings_memory.upper
			loop
				child_bindings_memory.item(i).mark_reachable_code(mark)
				i := i + 1
			end
		ensure
			reachable_mark >= mark
		end

feature {LIBERTY_FEATURE_ENTITY}
	can_check_agent_signature (a_agent_call: LIBERTY_CALL_EXPRESSION): BOOLEAN is
		require
			a_agent_call /= Void
		local
			i: INTEGER
		do
			if result_type = Void or else result_type.is_known then
				from
					Result := a_agent_call.target = Void or else a_agent_call.target.is_open_argument
					i := parameters.lower
				until
					not Result or else i > parameters.upper
				loop
					Result := parameters.item(i).result_type.is_known
					i := i + 1
				end
			end
		ensure
			can_also_check_result_type: Result implies (result_type = Void or else result_type.is_known)
		end

	agent_signature (a_agent_call: LIBERTY_CALL_EXPRESSION): COLLECTION[LIBERTY_KNOWN_TYPE] is
		require
			can_check_agent_signature(a_agent_call)
			a_agent_call.is_agent_call
		local
			i: INTEGER
		do
			if a_agent_call.target = Void or else not a_agent_call.target.is_open_argument then
				create {FAST_ARRAY[LIBERTY_KNOWN_TYPE]} Result.with_capacity(parameters.count)
			else
				create {FAST_ARRAY[LIBERTY_KNOWN_TYPE]} Result.with_capacity(parameters.count + 1)
				Result.add_last(current_type)
			end
			from
				i := parameters.lower
			until
				i > parameters.upper
			loop
				Result.add_last(parameters.item(i).result_type.known_type)
				i := i + 1
			end
		end

	check_agent_signature (a_agent_call: LIBERTY_CALL_EXPRESSION) is
		require
			can_check_agent_signature(a_agent_call)
			a_agent_call.is_agent_call
		local
			i, j: INTEGER
		do
			if a_agent_call.target = Void or else not a_agent_call.is_open_argument then
				i := 0
			else
				if parameters.is_empty then
					crash --| TODO: error, bad number of arguments
				end
				if not a_agent_call.target.result_type.known_type.is_conform_to(parameters.first.result_type.known_type)
					and then not a_agent_call.target.result_type.known_type.converts_to(parameters.first.result_type.known_type) then
					crash --| TODO: error, bad argument type
				end
				i := 1
			end
			if a_agent_call.actuals.count /= 0 then
				if a_agent_call.actuals.count /= parameters.count + i then
					crash --| TODO: error, bad number of arguments
				end
				from
					i := parameters.lower + i
					j := a_agent_call.actuals.lower
				until
					i > parameters.upper
				loop
					if not parameters.item(i).result_type.known_type.is_conform_to(a_agent_call.actuals.item(j).result_type.known_type)
						and then not parameters.item(i).result_type.known_type.converts_to(a_agent_call.actuals.item(j).result_type.known_type) then
						crash --| TODO: error, bad argument type
					end
					i := i + 1
					j := j + 1
				end
			end
		end

feature {ANY}
	frozen debug_display (o: OUTPUT_STREAM; tab: INTEGER) is
		do
			tabulate(o, tab)
			do_debug_display(o, tab)
			debug_display_bindings(o, tab)
		end

feature {LIBERTY_FEATURE}
	do_debug_display (o: OUTPUT_STREAM; tab: INTEGER) is
		local
			t: STRING
		do
			o.put_character('{')
			o.put_string(context.current_type.full_name)
			o.put_string(once "->")
			o.put_string(definition_type.full_name)
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

	debug_display_bindings (o: OUTPUT_STREAM; tab: INTEGER) is
		do
			debug_display_parent_bindings(o, tab)
			debug_display_child_bindings(o, tab)
		end

	debug_display_parent_bindings (o: OUTPUT_STREAM; tab: INTEGER) is
		local
			i: INTEGER
		do
			tabulate(o, tab)
			o.put_line(once "Parent bindings:")
			from
				i := parent_bindings_memory.lower
			until
				i > parent_bindings_memory.upper
			loop
				tabulate(o, tab)
				o.put_string(once " * ")
				o.put_integer(i+1)
				o.put_character('/')
				o.put_integer(parent_bindings_memory.count)
				o.put_string(once ": ")
				parent_bindings_memory.item(i).do_debug_display(o, tab + 1)
				--|*** TODO: looks like there is a parent cycle in NUMERIC.is_equal <-> COMPARABLE.is_equal
				-- parent_bindings_memory.item(i).debug_display_parent_bindings(o, tab + 1)
				i := i + 1
			end
		end

	debug_display_child_bindings (o: OUTPUT_STREAM; tab: INTEGER) is
		local
			i: INTEGER
		do
			tabulate(o, tab)
			o.put_line(once "Child bindings:")
			from
				i := child_bindings_memory.lower
			until
				i > child_bindings_memory.upper
			loop
				tabulate(o, tab)
				o.put_string(once " * ")
				o.put_integer(i)
				o.put_character('/')
				o.put_integer(child_bindings_memory.count)
				o.put_string(once ": ")
				o.put_string(child_bindings_memory.key(i).full_name)
				o.put_string(once " => ")
				child_bindings_memory.item(i).do_debug_display(o, tab + 1)
				-- if child_bindings_memory.item(i) /= Current then
				-- 	child_bindings_memory.item(i).debug_display_child_bindings(o, tab + 1)
				-- end
				i := i + 1
			end
		end

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
			not is_redefined
		do
			Result := do_join(a_type, a_feature, current_fd, other_fd)
			bind_or_replace(Result, a_type, Result = Current)
			a_feature.bind_or_replace(Result, a_type, Result = a_feature)
		ensure
			not errors.has_error implies Result /= Void
		end

feature {}
	do_join (a_type: LIBERTY_ACTUAL_TYPE; a_feature: LIBERTY_FEATURE; current_fd, other_fd: LIBERTY_FEATURE_DEFINITION): LIBERTY_FEATURE is
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
	is_bound (type: LIBERTY_KNOWN_TYPE): BOOLEAN is
		local
			known: LIBERTY_ACTUAL_TYPE
		do
			if known ?:= type then
				known ::= type
				Result := child_bindings_memory.fast_has(known)
			end
		end

	bound (type: LIBERTY_KNOWN_TYPE): LIBERTY_FEATURE is
		local
			known: LIBERTY_ACTUAL_TYPE
		do
			if known ?:= type then
				known ::= type
				Result := child_bindings_memory.fast_reference_at(known)
			end
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
				check
					Result /= Current
				end
				if Result = Void then
					is_specializing := True
					Result := twin
					is_specializing := False
					specialized.add(Result, a_type)
					Result.set_specialized_in(Current, context.specialized_in(a_type))
					if not is_redefined then
						debug ("feature.specialization")
							log.trace.put_line(once "   Binding specialized feature")
						end
						bind_or_replace(Result, a_type, True)
					end
				end
			end
		ensure
			Result.id = id
			;(current_type = a_type or not a_type.is_child_of(current_type)) implies Result = Current
			;(current_type /= a_type and a_type.is_child_of(current_type)) implies (Result /= Current and then Result.current_type = a_type)
		end

feature {LIBERTY_TYPE_PARENT_FEATURES_LOADER}
	add_if_redefined (type: LIBERTY_ACTUAL_TYPE; name: LIBERTY_FEATURE_NAME; redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]) is
		do
			-- nothing
		end

feature {LIBERTY_FEATURE}
	set_specialized_in (a_original: like Current; a_context: like context) is
		require
			is_specializing
			a_original.id = id
		do
			original := a_original
			context := a_context
			check type_resolver /= Void end
			create type_resolver.specialized(type_resolver.feature_name, Current, type_resolver.parent.specialized_in(a_context.current_type))
			if precondition /= Void then
				precondition := precondition.specialized_in(a_context.current_type)
			end
			if postcondition /= Void then
				postcondition := postcondition.specialized_in(a_context.current_type)
			end

			-- Current is a twin of another feature, be sure to correctly create again the bindings
			-- (avoid shared collections)
			create {FAST_ARRAY[LIBERTY_FEATURE]} parent_bindings_memory.with_capacity(1)
			create {HASHED_DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]} child_bindings_memory.with_capacity(3)

			is_specializing := False
		ensure
			original = a_original
		end

feature {LIBERTY_FEATURE}
	has_parent_binding (a_parent: LIBERTY_FEATURE): BOOLEAN is
		do
			Result := Current = a_parent or else parent_bindings_memory.fast_has(a_parent)
		end

	add_parent_binding (a_parent: LIBERTY_FEATURE) is
		require
			a_parent /= Void
			a_parent /= Current
			not is_redefined
		do
			if has_parent_binding(a_parent) then
				debug ("feature.binding")
					log.trace.put_line(once "         => parent already added")
				end
			else
				parent_bindings_memory.add_last(a_parent)
				debug ("feature.binding")
					log.trace.put_line(once "         => added parent to child")
				end
			end
		end

	remove_parent_binding (a_parent: LIBERTY_FEATURE) is
		require
			a_parent /= Current
			has_parent_binding(a_parent)
		local
			i: INTEGER
		do
			i := parent_bindings_memory.fast_first_index_of(a_parent)
			parent_bindings_memory.remove(i)
		end

	bind_or_replace (child: LIBERTY_FEATURE; type: LIBERTY_ACTUAL_TYPE; bind_current: BOOLEAN) is
		require
			not is_redefined
			bind_current implies type = child.current_type
			no_cycles: child /= Current implies not has_parent_binding(child)
		local
			i, j: INTEGER; removed: LIBERTY_FEATURE
		do
			check
				child /= Current implies parent_bindings /= child.parent_bindings
			end

			if child /= Current and then child.has_parent_binding(Current) then
				breakpoint
			end

			debug ("feature.binding")
				log.trace.put_string(once "      Binding child: ")
				child.do_debug_display(log.trace, 2)
				if bind_current then
					log.trace.put_string(once "      to Current: ")
				else
					log.trace.put_string(once "      replacing Current: ")
				end
				do_debug_display(log.trace, 2)
			end

			from
				i := parent_bindings_memory.lower
			until
				i > parent_bindings_memory.upper
			loop
				debug ("feature.binding")
					log.trace.put_string(once "       * Will bind parent #")
					log.trace.put_integer(i+1)
					log.trace.put_character('/')
					log.trace.put_integer(parent_bindings_memory.count)
					log.trace.put_string(once ": ")
					parent_bindings_memory.item(i).do_debug_display(log.trace, 3)
				end
				removed := parent_bindings_memory.item(i).do_bind(child, Current, type)
				if removed = Void then
					i := i + 1
				else
					debug ("feature.binding")
						log.trace.put_line(once "         -> adding removed child's parents")
					end
					from
						j := removed.parent_bindings.lower
					until
						j > removed.parent_bindings.upper
					loop
						if removed.parent_bindings.item(j) /= Current then
							add_parent_binding(removed.parent_bindings.item(j))
						end
						j := j + 1
					end
				end
			end

			if bind_current then
				debug ("feature.binding")
					log.trace.put_string(once "       * Will bind Current: ")
					do_debug_display(log.trace, 3)
				end
				removed := do_bind(child, Current, type)
				check
					removed /= Void implies removed.parent_bindings.is_empty -- i.e. removing a just-created feature, no precious data to be kept
				end
			end

			debug ("feature.binding")
				log.trace.put_string(once "   Final parent bindings of ")
				child.do_debug_display(log.trace, 1)
				from
					i := child.parent_bindings.lower
				until
					i > child.parent_bindings.upper
				loop
					log.trace.put_string(once "    * ")
					log.trace.put_integer(i+1)
					log.trace.put_character('/')
					log.trace.put_integer(child.parent_bindings.count)
					log.trace.put_string(once ": ")
					child.parent_bindings.item(i).do_debug_display(log.trace, 2)
					i := i + 1
				end
			end
		ensure
			parent_bindings_memory.for_all(agent (c, p: LIBERTY_FEATURE): BOOLEAN is
				do
					debug ("feature.binding")
						log.trace.put_string(once "   Checking ")
						p.do_debug_display(log.trace, 1)
					end
					Result := c.has_parent_binding(p)
					if not Result then
						breakpoint
					end
				end (child, ?)
			)
			parent_bindings_memory.for_all(agent (c, p: LIBERTY_FEATURE; t: LIBERTY_ACTUAL_TYPE): BOOLEAN is
				do
					Result := p.is_bound(t) and then bound(t) = c
					if not Result then
						breakpoint
					end
				end (child, ?, type)
			)
		end

	do_bind (child, target: LIBERTY_FEATURE; type: LIBERTY_ACTUAL_TYPE): LIBERTY_FEATURE is
			-- Returns the replaced child if it exists
		require
			child /= Current implies not has_parent_binding(child)
			not is_redefined
		do
			Result := child_bindings_memory.fast_reference_at(type)
			if Result = child then
				check
					Result.has_parent_binding(Current)
				end
				debug ("feature.binding")
					log.trace.put_line(once "         -> already bound.")
				end
				Result := Void
			else
				if Result /= Void then
					debug ("feature.binding")
						log.trace.put_string(once "         -> remove old child: ")
						Result.do_debug_display(log.trace, 4)
					end
					child_bindings_memory.fast_remove(type)
					Result.remove_parent_binding(Current)
				else
					check
						not child_bindings_memory.fast_has(type)
					end
				end
				debug ("feature.binding")
					log.trace.put_line(once "         -> adding new child")
				end
				child_bindings_memory.add(child, type)
				if child /= Current then
					child.add_parent_binding(Current)
				end
			end
		end

	parent_bindings: TRAVERSABLE[LIBERTY_FEATURE] is
			-- Flat structure: all parents of the feature are here.
		do
			Result := parent_bindings_memory
		end

	child_bindings: MAP[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE] is
			-- Flat structure: all heirs of the feature are here.
		do
			Result := child_bindings_memory
		end

feature {LIBERTY_BUILDER_TOOLS}
	bind (child: LIBERTY_FEATURE; type: LIBERTY_ACTUAL_TYPE) is
		require
			not is_redefined
			truly_bind: child /= Current implies child.current_type /= current_type
			no_cycles: child /= Current implies not has_parent_binding(child)
			bind_current: type = child.current_type
		do
			bind_or_replace(child, type, True)
		ensure
			parent_bindings_memory.is_equal(old parent_bindings_memory.twin)
			child.has_parent_binding(Current)
			is_bound(type) and then bound(type) = child
		end

	replace (new: LIBERTY_FEATURE; type: LIBERTY_ACTUAL_TYPE) is
		require
			not new.is_redefined
			truly_replace: new /= Current and then new.current_type = current_type
			no_cycles: not new.has_parent_binding(Current)
		do
			is_specializing := True -- well, not exactly- but Current is dead, baby.
			new.bind_or_replace(Current, type, False)
		end

feature {LIBERTY_BUILDER_TOOLS, LIBERTY_FEATURE_DEFINITION}
	set_type_resolver (a_type_resolver: like type_resolver; a_replace: BOOLEAN) is
		require
			a_type_resolver.local_context = context
			a_type_resolver.the_feature /= Void implies a_replace
			type_resolver = Void
		do
			if a_replace or else a_type_resolver.the_feature = Void then
				a_type_resolver.set_the_feature(Current, a_replace)
			end
			type_resolver := a_type_resolver
		ensure
			type_resolver = a_type_resolver
			a_replace implies type_resolver.the_feature = Current
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

feature {LIBERTY_FEATURE_REDEFINED}
	set_is_redefined is
		do
			is_redefined := True
		end

feature {}
	make (a_definition_type: like definition_type; a_accelerator: like accelerator) is
		require
			a_definition_type /= Void
		do
			create {FAST_ARRAY[LIBERTY_FEATURE]} parent_bindings_memory.with_capacity(1)
			definition_type := a_definition_type
			create {HASHED_DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]} child_bindings_memory.with_capacity(3)
			create {HASHED_DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]} specialized.with_capacity(3)
			accelerator := a_accelerator

			ids_provider.increment
			id := ids_provider.value
			original := Current
		ensure
			definition_type = a_definition_type
			accelerator = a_accelerator
			original = Current
		end

	parent_bindings_memory: COLLECTION[LIBERTY_FEATURE]
	child_bindings_memory: DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]

	accelerator: PROCEDURE[TUPLE[LIBERTY_FEATURE_ACCELERATOR, LIBERTY_FEATURE]]
	specialized: DICTIONARY[LIBERTY_FEATURE, LIBERTY_ACTUAL_TYPE]

	errors: LIBERTY_ERRORS
	torch: LIBERTY_ENLIGHTENING_THE_WORLD

	is_specializing: BOOLEAN

	ids_provider: COUNTER is
		once
			create Result
		end

invariant
	child_bindings_memory /= Void
	specialized /= Void
	definition_type /= Void
	parent_bindings_memory /= Void
	original.id = id

	context = Void implies parent_bindings_memory.is_empty
	is_redefined implies (parent_bindings_memory.is_empty and child_bindings_memory.is_empty)

	not is_specializing implies child_bindings_memory.for_all(agent (c: LIBERTY_FEATURE): BOOLEAN is
		do
			Result := c.has_parent_binding(Current)
			if not Result then
				breakpoint
			end
		end
	)

	not parent_bindings_memory.fast_has(Current)
	not is_specializing implies parent_bindings_memory.for_all(agent (p: LIBERTY_FEATURE): BOOLEAN is
		local
			c: LIBERTY_FEATURE
		do
			if p.is_bound(current_type) then
				c := p.bound(current_type)
				Result := c = Current -- should be "c = Current" but for the `specialized_in' twin
				if not Result then
					breakpoint
				end
			else
				Result := True
			end
		end
	)

end -- class LIBERTY_FEATURE
