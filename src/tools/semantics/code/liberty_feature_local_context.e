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
class LIBERTY_FEATURE_LOCAL_CONTEXT

insert
	LIBERTY_AST_HANDLER

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	current_type: LIBERTY_ACTUAL_TYPE

	result_type: LIBERTY_TYPE is
		do
			if result_entity /= Void then
				Result := result_entity.result_type
			end
		end

	parameters: TRAVERSABLE[LIBERTY_PARAMETER] is
		do
			Result := parameters_list
		ensure
			definition: Result = parameters_list
			exists: Result /= Void
		end

	locals: TRAVERSABLE[LIBERTY_LOCAL] is
		do
			Result := locals_list
		ensure
			definition: Result = locals_list
			exists: Result /= Void
		end

	is_parameter (name: ABSTRACT_STRING): BOOLEAN is
		require
			name /= Void
		do
			Result := parameters_map.has(name.intern)
		end

	parameter (name: ABSTRACT_STRING): LIBERTY_PARAMETER is
		require
			name /= Void
			is_parameter(name)
		do
			Result := parameters_map.reference_at(name.intern)
		ensure
			Result /= Void
		end

	is_local (name: ABSTRACT_STRING): BOOLEAN is
		require
			name /= Void
		do
			Result := locals_map.has(name.intern)
		end

	local_var (name: ABSTRACT_STRING): LIBERTY_LOCAL is
		require
			name /= Void
			is_local(name)
		do
			Result := locals_map.reference_at(name.intern)
		ensure
			Result /= Void
		end

	result_entity: LIBERTY_RESULT

	retry_instruction (a_position: LIBERTY_POSITION): LIBERTY_RETRY is
		do
			create Result.make(a_position)
			retries.add_last(Result)
		end

feature {LIBERTY_TYPE_BUILDER_TOOLS}
	add_parameter (a_parameter: LIBERTY_PARAMETER) is
		require
			a_parameter /= Void
		do
			parameters_list.add_last(a_parameter)
			parameters_map.add(a_parameter, a_parameter.name)
		end

	add_local (a_local: LIBERTY_LOCAL) is
		require
			a_local /= Void
		do
			locals_list.add_last(a_local)
			locals_map.add(a_local, a_local.name)
		end

	reconcile_retry_instructions (a_feature: LIBERTY_FEATURE) is
		do
			retries.do_all(agent {LIBERTY_RETRY}.set_feature(a_feature))
		end

	set_result_type (a_result_type: like result_type) is
		require
			a_result_type /= Void
		do
				create result_entity.make(a_result_type, errors.unknown_position)
		ensure
			result_type = a_result_type
		end

	set_feature_names (a_feature_names: like feature_names) is
		require
			a_feature_names /= Void
		do
			feature_names := a_feature_names
			compute_written_feature_names
		ensure
			feature_names = a_feature_names
			written_feature_names /= Void
		end

	written_feature_names: FIXED_STRING

	find_precursor (parent: LIBERTY_ACTUAL_TYPE; redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME];
						 ast: LIBERTY_AST_ONE_CLASS; file: FIXED_STRING): LIBERTY_FEATURE is
		local
			i: INTEGER; fn: LIBERTY_AST_FEATURE_NAME
		do
			from
				i := feature_names.lower
			until
				Result /= Void or else i > feature_names.upper
			loop
				fn ::= feature_names.item(i)
				Result := redefined_features.reference_at(create {LIBERTY_FEATURE_NAME}.make_from_ast(fn.feature_name_or_alias, ast, file))
				i := i + 1
			end
			if Result = Void then
				sedb_breakpoint
			end
		end

feature {}
	parameters_map: DICTIONARY[LIBERTY_PARAMETER, FIXED_STRING]
	parameters_list: COLLECTION[LIBERTY_PARAMETER]
	locals_map: DICTIONARY[LIBERTY_LOCAL, FIXED_STRING]
	locals_list: COLLECTION[LIBERTY_LOCAL]
	retries: COLLECTION[LIBERTY_RETRY]
	feature_names: EIFFEL_LIST_NODE

	make (a_current_type: like current_type) is
		require
			a_current_type /= Void
		do
			current_type := a_current_type
			create {FAST_ARRAY[LIBERTY_PARAMETER]} parameters_list.make(0)
			create {HASHED_DICTIONARY[LIBERTY_PARAMETER, FIXED_STRING]} parameters_map.make
			create {FAST_ARRAY[LIBERTY_LOCAL]} locals_list.make(0)
			create {HASHED_DICTIONARY[LIBERTY_LOCAL, FIXED_STRING]} locals_map.make
			create {FAST_ARRAY[LIBERTY_RETRY]} retries.with_capacity(1)
		ensure
			current_type = a_current_type
		end

	compute_written_feature_names is
		require
			written_feature_names = Void
		local
			fn: LIBERTY_AST_FEATURE_NAME
			i: INTEGER
			fnoa: LIBERTY_AST_FEATURE_NAME_OR_ALIAS
			buffer: STRING
		do
			buffer := once ""
			buffer.clear_count
			from
				i := feature_names.lower
			until
				i > feature_names.upper
			loop
				fn ::= feature_names.item(i)
				fnoa := fn.feature_name_or_alias
				if fnoa.is_regular then
					buffer.append(fnoa.entity_name.image.image.intern)
				elseif fnoa.is_prefix then
					buffer.append(once "prefix ")
					buffer.append(fnoa.free_operator_name.image.image.intern)
				else
					check fnoa.is_infix end
					buffer.append(once "infix ")
					buffer.append(fnoa.free_operator_name.image.image.intern)
				end
				if i < feature_names.upper then
					buffer.append(once ", ")
				end
				i := i + 1
			end
			written_feature_names := buffer.intern
		ensure
			written_feature_names /= Void
		end

	errors: LIBERTY_ERRORS

invariant
	current_type /= Void
	parameters_list /= Void
	locals_list /= Void
	parameters_map /= Void
	locals_map /= Void
	retries /= Void

end
