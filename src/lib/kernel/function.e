class FUNCTION[O_ -> TUPLE, R_]
	--
	-- Where O_ represents open arguments (i.e. arguments which are delayed) and where R_ is for the result
	-- type of the delayed call.
	--

inherit
	ROUTINE[O_]

feature {ANY}
	item (o: O_): R_ is
			-- Result of calling feature with all its operands, using `o' for the open operands.
		external "built_in"
		end

end -- class FUNCTION
