class LIBERTY_AST_TYPE_DEFINITION

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {}
	is_class_type: BOOLEAN is
		do
			Result := nodes.last.name.is_equal(once "Effective_Type_Parameters")
		end

	is_separate: BOOLEAN is
		do
			Result := nodes.first.name.is_equal(once "KW separate")
		end

	type_name: LIBERTY_AST_CLASS_NAME is
		require
			is_class_type
		do
			if is_separate then
				Result ::= nodes.item(1)
			else
				Result ::= nodes.item(0)
			end
		end

	type_parameters: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS
		require
			is_class_type
		do
			Result ::= nodes.last
		end

	is_anchor: BOOLEAN is
		do
			Result := nodes.first.name.is_equal(once "KW like")
		end

	is_like_result: BOOLEAN is
		do
			Result := is_anchor and then nodes.item(1).names.is_equal(once "KW Result")
		ensure
			Result implies is_anchor
		end

	is_like_current: BOOLEAN is
		do
			Result := is_anchor and then nodes.item(1).names.is_equal(once "KW Current")
		ensure
			Result implies is_anchor
		end

	is_like_entity: BOOLEAN is
		do
			Result := is_anchor and then nodes.item(1).names.is_equal(once "KW entity name")
		ensure
			Result implies is_anchor
		end

	entity_anchor: LIBERTY_AST_ENTITY_NAME is
		require
			is_like_entity
		do
			Result ::= nodes.item(1)
		end

	anchor_remainder: LIBERTY_AST_R10 is
		require
			is_anchor
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.capacity
		end

	name: STRING is "Type_Definition"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER} << 2, 3 >> }
		end

end
