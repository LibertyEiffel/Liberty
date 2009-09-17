class REGULAR_EXPRESSION_ITEM_NOT_THEN_ANY
	--
	-- negate the node such that if node matches it makes
	-- a backtrack but conversly if node fails, the character
	-- is accepted (any character) and exploration continues.
	--

inherit
	REGULAR_EXPRESSION_ITEM
	REGULAR_EXPRESSION_ITEM_GLOBALS

creation {ANY}
	make

feature {ANY}
	node: BACKTRACKING_NODE
			-- the node to negate

	make, set_node (value: BACKTRACKING_NODE) is
		require
			value_not_void: value /= Void
		do
			node := value
		ensure
			definition: node = value
			node_not_void: node /= Void
		end

	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			matcher.push_cut_point
			matcher.push_or(the_any_character_item)
			matcher.push_and(the_cut_and_false_node)
			matcher.set_current_node(node)
		end

end -- class REGULAR_EXPRESSION_ITEM_NOT_THEN_ANY
