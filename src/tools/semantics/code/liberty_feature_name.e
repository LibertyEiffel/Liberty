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
class LIBERTY_FEATURE_NAME

inherit
	LIBERTY_POSITIONABLE
		redefine is_equal, out_in_tagged_out_memory
		end

insert
	HASHABLE
		redefine out_in_tagged_out_memory
		end
	COMPARABLE
		redefine is_equal, out_in_tagged_out_memory
		end
	LIBERTY_AST_HANDLER
		redefine is_equal, out_in_tagged_out_memory
		end

create {ANY}
	make, prefixed, infixed

create {LIBERTY_BUILDER_TOOLS, LIBERTY_FEATURE_LOCAL_CONTEXT}
	make_from_ast

create {LIBERTY_TYPE_RESOLVER_IN_TYPE}
	make_from_ast_entity_name

create {LIBERTY_BUILDER_TOOLS}
	make_regular

create {LIBERTY_BUILDER_TOOLS, LIBERTY_PREFIX_CALL}
	make_prefix

create {LIBERTY_BUILDER_TOOLS, LIBERTY_INFIX_CALL}
	make_infix

feature {ANY}
	name: FIXED_STRING
	full_name: FIXED_STRING

	out_in_tagged_out_memory is
		do
			if is_prefix then
				tagged_out_memory.append(once "prefix ")
			elseif is_infix then
				tagged_out_memory.append(once "infix ")
			end
			name.out_in_tagged_out_memory
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := type = other.type and then name = other.name
			check
				Result = (full_name = other.full_name)
			end
		end

	is_regular: BOOLEAN is
		do
			Result := type = type_regular
		end

	is_prefix: BOOLEAN is
		do
			Result := type = type_prefix
		end

	is_infix: BOOLEAN is
		do
			Result := type = type_infix
		end

	hash_code: INTEGER is
		do
			Result := full_name.hash_code
		end

	infix "<" (other: like Current): BOOLEAN is
		do
			Result := full_name < other.full_name
		end

feature {LIBERTY_FEATURE_NAME}
	type: INTEGER_8

feature {}
	make_from_ast_entity_name (ast: LIBERTY_AST_ENTITY_NAME; class_ast: LIBERTY_AST_ONE_CLASS; file: FIXED_STRING) is
		require
			ast /= Void
			class_ast /= Void
		do
			make_regular(ast.image.image.intern, errors.semantics_position(ast.image.index, class_ast, file))
			position := errors.semantics_position(ast.image.index, class_ast, file)
		end

	make_from_ast (ast: LIBERTY_AST_FEATURE_NAME_OR_ALIAS; class_ast: LIBERTY_AST_ONE_CLASS; file: FIXED_STRING) is
		require
			ast /= Void
			class_ast /= Void
		do
			if ast.is_regular then
				make_from_ast_entity_name(ast.entity_name, class_ast, file)
			elseif ast.is_prefix then
				make_prefix(ast.free_operator_name.image.image.intern, errors.semantics_position(ast.free_operator_name.image.index, class_ast, file))
				position := errors.semantics_position(ast.free_operator_name.image.index, class_ast, file)
			else
				check ast.is_infix end
				make_infix(ast.free_operator_name.image.image.intern, errors.semantics_position(ast.free_operator_name.image.index, class_ast, file))
				position := errors.semantics_position(ast.free_operator_name.image.index, class_ast, file)
			end
		end

	make_regular (a_name: like name; a_position: like position) is
		require
			a_name = a_name.intern
		do
			name := a_name
			full_name := a_name
			type := type_regular
			position := a_position
		ensure
			name = a_name
			type = type_regular
			position = a_position
		end

	make_prefix (a_name: like name; a_position: like position) is
		require
			a_name = a_name.intern
		do
			name := sane_name(a_name)
			full_name := (once "prefix " + name).intern
			type := type_prefix
			position := a_position
		ensure
			name = sane_name(a_name)
			type = type_prefix
			position = a_position
		end

	make_infix (a_name: like name; a_position: like position) is
		require
			a_name = a_name.intern
		do
			name := sane_name(a_name)
			full_name := (once "infix " + name).intern
			type := type_infix
			position := a_position
		ensure
			name = sane_name(a_name)
			type = type_infix
			position = a_position
		end

	make (a_name: like name) is
		require
			a_name = a_name.intern
		do
			make_regular(a_name, errors.unknown_position)
		ensure
			name = a_name
		end

	infixed (a_name: like name) is
		require
			a_name = a_name.intern
		do
			make_infix(a_name, errors.unknown_position)
		ensure
			name = a_name
		end

	prefixed (a_name: like name) is
		require
			a_name = a_name.intern
		do
			make_prefix(a_name, errors.unknown_position)
		ensure
			name = a_name
		end

	sane_name (a_name: FIXED_STRING): FIXED_STRING is
		do
			if a_name.first = '"' then
				check a_name.last = '"' end
				Result := (a_name.substring(2, a_name.upper - 1)).intern
			else
				check a_name.last /= '"' end
				Result := a_name
			end
		ensure
			a_name.first = '"' implies a_name = ("%"" + Result + "%"").intern
			a_name.first /= '"' implies Result = a_name
		end

	type_regular: INTEGER_8 is 1
	type_prefix: INTEGER_8 is 2
	type_infix: INTEGER_8 is 3

	errors: LIBERTY_ERRORS

invariant
	name /= Void
	full_name /= Void
	type /= 0

end
