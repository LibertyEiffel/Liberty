class PREDICATE[O_ -> TUPLE]
	--
	-- A PREDICATE is a FUNCTION with a BOOLEAN result type. As in other agent's definitions, O_ represents
	-- open arguments (i.e. arguments which are delayed).
	--

inherit
	FUNCTION[O_, BOOLEAN]

end -- class PREDICATE
