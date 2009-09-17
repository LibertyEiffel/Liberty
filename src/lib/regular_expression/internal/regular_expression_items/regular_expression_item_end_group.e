class REGULAR_EXPRESSION_ITEM_END_GROUP
	--
	-- record the end position of a group
	--

inherit
	REGULAR_EXPRESSION_ITEM

creation {ANY}
	make

feature {ANY}
	number: INTEGER
			-- the number of the group

	make (num: INTEGER) is
		require
			natural_number: num >= 0
		do
			number := num
		ensure
			definition: number = num
			natural_number: number >= 0
		end

	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			matcher.set_group_last_index(number)
			matcher.continue
		end

end -- class REGULAR_EXPRESSION_ITEM_END_GROUP
