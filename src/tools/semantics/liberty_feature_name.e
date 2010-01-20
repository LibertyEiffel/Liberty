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
		redefine
			is_equal
		end

insert
	HASHABLE
	LIBERTY_AST_HANDLER
		redefine
			is_equal
		end

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make_from_ast, make_regular

create {LIBERTY_TYPE_BUILDER_TOOLS, LIBERTY_PREFIX_CALL}
	make_prefix

create {LIBERTY_TYPE_BUILDER_TOOLS, LIBERTY_INFIX_CALL}
	make_infix

feature {ANY}
	name: FIXED_STRING

	is_equal (other: like Current): BOOLEAN is
		do
			Result := (other = Current)
				or else (type = other.type and then name = other.name)
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

	hash_code: INTEGER

feature {LIBERTY_FEATURE_NAME}
	type: INTEGER_8

feature {}
	make_from_ast (ast: LIBERTY_AST_FEATURE_NAME_OR_ALIAS; class_ast: LIBERTY_AST_ONE_CLASS; file: FIXED_STRING) is
		require
			ast /= Void
			class_ast /= Void
		do
			if ast.is_regular then
				make_regular(ast.entity_name.image.image.intern, errors.semantics_position(ast.entity_name.image.index, class_ast, file))
				position := errors.semantics_position(ast.entity_name.image.index, class_ast, file)
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
		do
			name := a_name
			type := type_regular
			hash_code := name.hash_code
			position := a_position
		end

	make_prefix (a_name: like name; a_position: like position) is
		do
			name := a_name
			type := type_prefix
			hash_code := name.hash_code #* 17
			if hash_code < 0 then
				hash_code := ~hash_code
			end
			position := a_position
		end

	make_infix (a_name: like name; a_position: like position) is
		do
			name := a_name
			type := type_infix
			hash_code := name.hash_code #*31
			if hash_code < 0 then
				hash_code := ~hash_code
			end
			position := a_position
		end

	type_regular: INTEGER_8 is 1
	type_prefix: INTEGER_8 is 2
	type_infix: INTEGER_8 is 3

	errors: LIBERTY_ERRORS

invariant
	type /= 0

end
