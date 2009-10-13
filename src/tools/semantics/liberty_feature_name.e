class LIBERTY_FEATURE_NAME

inherit
	LIBERTY_POSITIONABLE

insert
	HASHABLE
	LIBERTY_AST_HANDLER
		redefine
			is_equal
		end

create {LIBERTY_TYPE_BUILDER}
	make_from_ast

feature {ANY}
	name: FIXED_STRING

	is_equal (other: like Current): BOOLEAN is
		local
			lfn: LIBERTY_FEATURE_NAME
		do
			Result := name.is_equal(other.name)
				and then type = other.type
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
	make_from_ast (ast: LIBERTY_AST_FEATURE_NAME_OR_ALIAS; class_ast: LIBERYT_AST_CLASS) is
		require
			ast /= Void
			class_ast /= Void
		do
			if ast.is_regular then
				make_regular(ast.entity_name.image.image)
				create {LIBERTY_SEMANTICS_POSITION} position.make(ast.entity_name.image.index, class_ast)
			elseif ast.is_prefix then
				make_prefix(ast.free_operator_name.image.image)
				create {LIBERTY_SEMANTICS_POSITION} position.make(ast.free_operator_name.image.index, class_ast)
			else
				check ast.is_infix end
				make_infix(ast.free_operator_name.image.image)
				create {LIBERTY_SEMANTICS_POSITION} position.make(ast.free_operator_name.image.index, class_ast)
			end
		end

	type_regular: INTEGER_8 is 1
	type_prefix: INTEGER_8 is 2
	type_infix: INTEGER_8 is 3

	errors: LIBERTY_ERRORS

invariant
	type /= 0

end
