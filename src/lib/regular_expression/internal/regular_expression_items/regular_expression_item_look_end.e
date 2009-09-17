class REGULAR_EXPRESSION_ITEM_LOOK_END
	--
	--

inherit
	REGULAR_EXPRESSION_ITEM
	REGULAR_EXPRESSION_ITEM_GLOBALS

creation {ANY}
	make

feature {ANY}
	is_ahead: BOOLEAN
			-- should look ahead? (or else behind?)

	should_continue: BOOLEAN
			-- should continue? (or else backtrack?)

	make (ahead, continue: BOOLEAN) is
		do
			is_ahead := ahead
			should_continue := continue
		ensure
			definition: is_ahead = ahead and should_continue = continue
		end

	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			if is_ahead then
				matcher.end_look_ahead
			else
				matcher.end_look_behind
			end
			matcher.cut
			if should_continue then
				matcher.continue
			else
				matcher.backtrack
			end
		end

end -- class REGULAR_EXPRESSION_ITEM_LOOK_END
