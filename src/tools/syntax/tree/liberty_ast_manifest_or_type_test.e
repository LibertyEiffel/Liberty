class LIBERTY_AST_MANIFEST_OR_TYPE_TEST

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_number: BOOLEAN is
		do
			Result := count = 1 and then nodes.item(0).is_equal(once "KW number")
		end

	number: LIBERTY_AST_NUMBER is
		require
			is_number
		do
			Result ::= nodes.item(0)
		end

	is_true: BOOLEAN is
		do
			Result := count = 1 and then nodes.item(0).is_equal(once "KW True")
		end

	is_false: BOOLEAN is
		do
			Result := count = 1 and then nodes.item(0).is_equal(once "KW False")
		end

	is_character: BOOLEAN is
		do
			Result := count = 1 and then nodes.item(0).is_equal(once "KW character")
		end

	character: LIBERTY_AST_CHARACTER is
		require
			is_character
		do
			Result ::= nodes.item(0)
		end

	is_string: BOOLEAN is
		do
			Result := (count = 1 or else count = 2) and then nodes.last.name.is_equal(once "KW string")
		end

	is_once_string: BOOLEAN is
		do
			Result := nodes.item(0).name.is_equal(once "KW once")
		ensure
			Result implies is_string
		end

	string: LIBERTY_AST_STRING is
		require
			is_string
		do
			Result ::= nodes.last
		end

	is_typed_open_argument: BOOLEAN is
		do
			Result := count = 3
			check
				Result = nodes.item(1).name.is_equal(once "Type_Definition")
			end
		end

	open_argument_type: LIBERTY_AST_TYPE_DEFINITION is
		require
			is_typed_open_argument
		do
			Result ::= nodes.item(1)
		end

	is_assignment_test: BOOLEAN is
		do
			Result := count = 5 and then nodes.item(3).name.is_equal(once "KW ?:=")
		end

	assignment_test_type: LIBERTY_AST_TYPE_DEFINITION is
		require
			is_assignment_test
		do
			Result ::= nodes.item(1)
		end

	assignment_test_expression: LIBERTY_AST_EXPRESSION is
		require
			is_assignment_test
		do
			Result ::= nodes.item(4)
		end

	is_typed_manifest: BOOLEAN is
		do
			Result := count > 3 and then not is_assignment_test and then nodes.item(1).name.is_equal(once "Type_Definition")
		end

	is_number_typed_manifest: BOOLEAN is
		do
			Result := count = 4 and then nodes.item(2).name.is_equal(once "KW number")
		ensure
			Result implies is_typed_manifest
		end

	is_string_typed_manifest: BOOLEAN is
		do
			Result := count = 4 and then nodes.item(2).name.is_equal(once "KW string")
		ensure
			Result implies is_typed_manifest
		end

	is_array_typed_manifest: BOOLEAN is
		do
			Result := count = 5 and then not nodes.item(3).name.is_equal(once "Array")
		ensure
			Result implies is_typed_manifest
		end

	typed_manifest_type: LIBERTY_AST_TYPE_DEFINITION is
		require
			is_typed_manifest
		do
			Result ::= nodes.item(1)
		end

	typed_manifest_number: LIBERTY_AST_NUMBER is
		require
			is_number_typed_manifest
		do
			Result ::= nodes.item(2)
		end

	typed_manifest_string: LIBERTY_AST_STRING is
		require
			is_string_typed_manifest
		do
			Result ::= nodes.item(2)
		end

	typed_manifest_array_parameters: EIFFEL_LIST_NODE is
		require
			is_array_typed_manifest
		do
			Result ::= nodes.item(2)
		end

	typed_manifest_array: LIBERTY_AST_ARRAY is
		require
			is_array_typed_manifest
		do
			Result ::= nodes.item(3)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.capacity
		end

	name: STRING is "Manifest_Or_Type_Test"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 2, 3, 4, 5 >> }
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_MANIFEST_OR_TYPE_TEST_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_manifest_or_type_test(Current)
		end

end
