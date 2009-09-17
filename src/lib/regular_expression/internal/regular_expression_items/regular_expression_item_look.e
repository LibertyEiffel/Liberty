class REGULAR_EXPRESSION_ITEM_LOOK
	--
	--

inherit
	REGULAR_EXPRESSION_ITEM
	REGULAR_EXPRESSION_ITEM_GLOBALS

creation {ANY}
	make

feature {ANY}
	node: BACKTRACKING_NODE
			-- the node look

	is_ahead: BOOLEAN
			-- should look ahead? (or else behind?)

	is_positive: BOOLEAN
			-- is positive look? (or else negative?)

	make (value: BACKTRACKING_NODE; ahead, positive: BOOLEAN) is
		require
			value_not_void: value /= Void
		do
			node := value
			is_ahead := ahead
			is_positive := positive
		ensure
			definition: node = value and is_ahead = ahead and is_positive = positive
			node_not_void: node /= Void
		end

	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			if is_ahead then
				matcher.begin_look_ahead
				matcher.push_cut_point
				if is_positive then
					matcher.push_or(the_end_look_ahead_backtrack_item)
					matcher.push_and(the_end_look_ahead_continue_item)
				else
					matcher.push_or(the_end_look_ahead_continue_item)
					matcher.push_and(the_end_look_ahead_backtrack_item)
				end
			else
				matcher.begin_look_behind
				matcher.push_cut_point
				if is_positive then
					matcher.push_or(the_end_look_behind_backtrack_item)
					matcher.push_and(the_end_look_behind_continue_item)
				else
					matcher.push_or(the_end_look_behind_continue_item)
					matcher.push_and(the_end_look_behind_backtrack_item)
				end
			end
			matcher.set_current_node(node)
		end

feature {} -- looks
	the_end_look_ahead_backtrack_item: REGULAR_EXPRESSION_ITEM_LOOK_END is
		once
			create Result.make(True, False)
		end

	the_end_look_ahead_continue_item: REGULAR_EXPRESSION_ITEM_LOOK_END is
		once
			create Result.make(True, True)
		end

	the_end_look_behind_backtrack_item: REGULAR_EXPRESSION_ITEM_LOOK_END is
		once
			create Result.make(False, False)
		end

	the_end_look_behind_continue_item: REGULAR_EXPRESSION_ITEM_LOOK_END is
		once
			create Result.make(False, True)
		end

end -- class REGULAR_EXPRESSION_ITEM_LOOK
