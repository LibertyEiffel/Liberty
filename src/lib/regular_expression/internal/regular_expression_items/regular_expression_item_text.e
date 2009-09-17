class REGULAR_EXPRESSION_ITEM_TEXT
	--
	-- accept one string
	--

inherit
	REGULAR_EXPRESSION_ITEM

creation {ANY}
	make

feature {ANY}
	text: STRING
			-- the accepted string

	make (value: STRING) is
		require
			value_not_void: value /= Void
			value_not_empty: value.count > 0
		do
			text := value
		ensure
			definition: text = value
			text_not_void: text /= Void
			text_not_empty: text.count > 0
		end

	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			matcher.match_string(text)
		end

invariant
	text_not_void: text /= Void
	text_not_empty: text.count > 0

end -- class REGULAR_EXPRESSION_ITEM_TEXT
