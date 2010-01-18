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
class LIBERTY_TYPE

inherit
	LIBERTY_ENTITY_TYPE
		redefine
			out_in_tagged_out_memory
		end

insert
	EIFFEL_NODE_HANDLER
		redefine
			is_equal, out_in_tagged_out_memory
		end
	LIBERTY_ERROR_LEVELS
		redefine
			is_equal, out_in_tagged_out_memory
		end

create {LIBERTY_UNIVERSE}
	make

feature {ANY}
	type: LIBERTY_TYPE is
		do
			Result := Current
		end

	is_type_set: BOOLEAN is True

	file: FIXED_STRING is
		do
			Result := descriptor.file
		end

	obsolete_message: STRING

	hash_code: INTEGER is
		do
			Result := descriptor.hash_code
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := other = Current
		end

	is_obsolete: BOOLEAN is
		do
			Result := obsolete_message /= Void
		end

	cluster: LIBERTY_CLUSTER is
		do
			Result := descriptor.cluster
		end

	name: FIXED_STRING is
		do
			Result := descriptor.name
		end

	parameters: TRAVERSABLE[LIBERTY_ENTITY_TYPE] is
		do
			Result := descriptor.parameters
		end

	full_name: FIXED_STRING is
		local
			fn: STRING
		do
			fn := once ""
			fn.clear_count
			full_name_in(fn)
			Result := fn.intern
		end

	is_deferred: BOOLEAN is
		require
			mark_set
		do
			Result := mark = deferred_mark
		end

	is_expanded: BOOLEAN is
		require
			mark_set
		do
			Result := mark = expanded_mark
		end

	is_separate: BOOLEAN is
		require
			mark_set
		do
			Result := mark = separate_mark
		end

	is_reference: BOOLEAN is
		require
			mark_set
		do
			Result := mark = reference_mark
		end

	mark_set: BOOLEAN is
		do
			Result := mark /= 0
		end

	the_invariant: LIBERTY_INVARIANT

	has_feature (a_feature_name: LIBERTY_FEATURE_NAME): BOOLEAN is
		do
			Result := features.has(a_feature_name)
		end

	feature_definition (a_feature_name: LIBERTY_FEATURE_NAME): LIBERTY_FEATURE_DEFINITION is
		require
			has_feature(a_feature_name)
		do
			Result := features.at(a_feature_name)
		end

feature {ANY}
	debug_display (o: OUTPUT_STREAM) is
		local
			i: INTEGER
		do
			if is_expanded then
				o.put_string(once "expanded type ")
			elseif is_separate then
				o.put_string(once "separate type ")
			elseif is_deferred then
				o.put_string(once "deferred type ")
			else
				o.put_string(once "type ")
			end
			o.put_line(full_name.out)
			o.put_string(once "   building state: ")
			o.put_line(builder.current_state.out)
			from
				i := features.lower
			until
				i > features.upper
			loop
				features.item(i).debug_display(o)
				i := i + 1
			end
			o.put_string(once "end -- type ")
			o.put_line(full_name.out)
		end

feature {LIBERTY_TYPE}
	full_name_in (buffer: STRING) is
		local
			i: INTEGER
		do
			buffer.append(name)
			if not parameters.is_empty then
				buffer.extend('[')
				from
					i := parameters.lower
				until
					i > parameters.upper
				loop
					if i > parameters.upper then
						buffer.extend(',')
					end
					parameters.item(i).full_name_in(buffer)
					i := i + 1
				end
				buffer.extend(']')
			end
		end

feature {ANY} -- Inheritance
	is_conform_to (other: LIBERTY_TYPE): BOOLEAN is
		local
			i: INTEGER
		do
			if other = Current then
				Result := True
			elseif conformant_parents /= Void then
				from
					i := conformant_parents.lower
				until
					Result or else i > conformant_parents.upper
				loop
					Result := conformant_parents.item(i).is_conform_to(other)
					i := i + 1
				end
			end
		ensure
			Result implies is_child_of(other)
		end

	is_child_of (other: LIBERTY_TYPE): BOOLEAN is
		do
			Result := is_conform_to(other) or else is_non_conformant_child_of(other)
		end

	is_non_conformant_child_of (other: LIBERTY_TYPE): BOOLEAN is
		local
			i: INTEGER
		do
			if other = Current then
				Result := True
			else
				if non_conformant_parents /= Void then
					from
						i := non_conformant_parents.lower
					until
						Result or else i > non_conformant_parents.upper
					loop
						Result := non_conformant_parents.item(i).is_non_conformant_child_of(other)
						i := i + 1
					end
				end
				if conformant_parents /= Void then
					from
						i := conformant_parents.lower
					until
						Result or else i > conformant_parents.upper
					loop
						Result := conformant_parents.item(i).is_non_conformant_child_of(other)
						i := i + 1
					end
				end
			end
		ensure
			Result implies is_child_of(other)
		end

	common_conformant_parent_with (other: LIBERTY_TYPE): LIBERTY_TYPE is
		do
			if other = Current then
				Result := Current
			elseif other.is_conform_to(Current) then
				Result := Current
			elseif is_conform_to(other) then
				Result := other
			else
				Result := common_parent(other)
				if Result = Void then
					--| *** TODO: check if the symmetric lookup is mandatory
					Result := other.common_parent(Current)
				end
			end
		end

feature {ANY} -- Representation
	out_in_tagged_out_memory is
		do
			full_name.out_in_tagged_out_memory
		end

feature {LIBERTY_TYPE}
	common_parent (other: LIBERTY_TYPE): LIBERTY_TYPE is
			-- To implement `common_conformant_parent_with'.
			-- Conformant common parent lookup.
		require
			not_trivial: Current /= other and then not is_conform_to(other) and then not other.is_conform_to(Current)
		local
			i: INTEGER; t: LIBERTY_TYPE
		do
			from
				i := conformant_parents.lower
			until
				Result /= Void or else i > conformant_parents.upper
			loop
				t := conformant_parents.item(i)
				check
					by_definition: other /= t -- because of the `not_trivial' precondition: not is_conform_to(other)
				end
				if other.is_conform_to(t) then
					Result := t
				else
					Result := t.common_parent(other)
				end
				i := i + 1
			end
		end

feature {LIBERTY_TYPE_BUILDER_TOOLS}
	set_obsolete (message: like obsolete_message) is
		require
			message /= Void
		do
			obsolete_message := message
		ensure
			is_obsolete
			obsolete_message = message
		end

	set_deferred is
		require
			not mark_set
		do
			mark := deferred_mark
		ensure
			mark_set
			is_deferred
		end

	set_expanded is
		require
			not mark_set
		do
			mark := expanded_mark
		ensure
			mark_set
			is_expanded
		end

	set_separate is
		require
			not mark_set
		do
			mark := separate_mark
		ensure
			mark_set
			is_separate
		end

	set_reference is
		require
			not mark_set
		do
			mark := reference_mark
		ensure
			mark_set
			is_reference
		end

	add_parent (a_parent: LIBERTY_TYPE; conformant: BOOLEAN) is
		do
			heart_beat.beat
			if conformant then
				if conformant_parents = no_parents then
					create {FAST_ARRAY[LIBERTY_TYPE]} conformant_parents.with_capacity(2)
				end
				conformant_parents.add_last(a_parent)
				debug
					std_output.put_line(name + ": adding conformant parent " + a_parent.name)
				end
			else
				if non_conformant_parents = no_parents then
					create {FAST_ARRAY[LIBERTY_TYPE]} non_conformant_parents.with_capacity(2)
				end
				non_conformant_parents.add_last(a_parent)
				debug
					std_output.put_line(name + ": adding non-conformant parent " + a_parent.name)
				end
			end
		end

	features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]

	set_invariant (a_invariant: like the_invariant) is
		do
			the_invariant := a_invariant
		ensure
			the_invariant = a_invariant
		end

	add_feature (a_feature: LIBERTY_FEATURE_DEFINITION) is
		require
			not has_feature(a_feature.feature_name)
		do
			features.add(a_feature, a_feature.feature_name)
			heart_beat.beat
		ensure
			features.at(a_feature.feature_name) = a_feature
		end

feature {LIBERTY_UNIVERSE} -- Semantics building
	start_build (universe: LIBERTY_UNIVERSE) is
		require
			not errors.has_error
		do
			create builder.make(Current, universe)
		end

	build_more is
		require
			not is_built
		do
			builder.build_more
		end

	is_built: BOOLEAN is
		do
			Result := builder.is_built
		end

feature {}
	check_validity is
		do
			--| TODO
		end

feature {LIBERTY_TYPE_BUILDER}
	conformant_parents: COLLECTION[LIBERTY_TYPE]
	non_conformant_parents: COLLECTION[LIBERTY_TYPE]

	has_loaded_features: BOOLEAN is
		do
			Result := builder.has_loaded_features
		end

feature {}
	make (a_descriptor: like descriptor; a_ast: like ast) is
		require
			a_descriptor /= Void
		do
			descriptor := a_descriptor
			ast := a_ast
			create {HASHED_DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]} features.make
			conformant_parents := no_parents
			non_conformant_parents := no_parents
		ensure
			descriptor = a_descriptor
		end

	mark: INTEGER_8

	deferred_mark: INTEGER_8 is 1
	expanded_mark: INTEGER_8 is 2
	separate_mark: INTEGER_8 is 4
	reference_mark: INTEGER_8 is 8

feature {LIBERTY_UNIVERSE}
	descriptor: LIBERTY_TYPE_DESCRIPTOR

feature {LIBERTY_AST_HANDLER}
	ast: LIBERTY_AST_ONE_CLASS

feature {LIBERTY_TYPE_BUILDER_AUTOMATON}
	has_no_parents: BOOLEAN is
		do
			Result := conformant_parents = no_parents and then non_conformant_parents = no_parents
		end

feature {LIBERTY_TYPE_BUILDER_TOOLS}
	descriptor_position: LIBERTY_POSITION is
		do
			Result := descriptor.position
		end

feature {}
	errors: LIBERTY_ERRORS
	builder: LIBERTY_TYPE_BUILDER_AUTOMATON

	heart_beat: LIBERTY_HEART_BEAT

	no_parents: COLLECTION[LIBERTY_TYPE] is
		once
			create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(0)
		end

invariant
	descriptor /= Void
	ast /= Void
	file /= Void
	features /= Void
	features.for_all(agent (fd: LIBERTY_FEATURE_DEFINITION; fn: LIBERTY_FEATURE_NAME): BOOLEAN is do Result := fd.feature_name.is_equal(fn) end)
	parameters /= Void

	conformant_parents /= Void
	non_conformant_parents /= Void

	builder /= Void implies builder.builder.type = Current

end
