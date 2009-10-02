class LIBERTY_FEATURE_NAME

inherit
	FIXED_STRING
		redefine
			is_equal, copy
		end

insert
	LIBERTY_AST_HANDLER

create {LIBERTY_TYPE_BUILDER}
	make_regular, make_prefix, make_infix, make_from_ast

feature {ANY}
	is_equal (other: ABSTRACT_STRING): BOOLEAN is
		local
			lfn: LIBERTY_FEATURE_NAME
		do
			Result := Precursor(other)
			if Result and then lfn ?:= other then
				lfn ::= other
				Result := lfn.type = type
			end
		end

	copy (other: like Current) is
		do
			Precursor(other)
			type := other.type
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

	index: INTEGER

feature {LIBERTY_FEATURE_NAME}
	type: INTEGER_8

feature {}
	make_regular (name: STRING) is
		do
			make_from_string(name)
			type := type_regular
		end

	make_prefix (name: STRING) is
		do
			make_from_string(name)
			type := type_prefix
			hash_code := hash_code #* 17
			if hash_code < 0 then
				hash_code := ~hash_code
			end
		end

	make_infix (name: STRING) is
		do
			make_from_string(name)
			type := type_infix
			hash_code := hash_code #* 31
			if hash_code < 0 then
				hash_code := ~hash_code
			end
		end

	make_from_ast (ast: LIBERTY_AST_FEATURE_NAME_OR_ALIAS) is
		require
			ast /= Void
		do
			if ast.is_regular then
				make_regular(ast.entity_name.image.image)
				index := ast.entity_name.image.index
			elseif ast.is_prefix then
				make_prefix(ast.free_operator_name.image.image)
				index := ast.free_operator_name.image.index
			else
				check ast.is_infix end
				make_infix(ast.free_operator_name.image.image)
				index := ast.free_operator_name.image.index
			end
		end

	type_regular: INTEGER_8 is 1
	type_prefix: INTEGER_8 is 2
	type_infix: INTEGER_8 is 3

invariant
	type /= 0

end
