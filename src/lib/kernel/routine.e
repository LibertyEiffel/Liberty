deferred class ROUTINE[O_ -> TUPLE]
	--
	-- The agent's type hierarchy is composed of the following classes: ROUTINE, PROCEDURE, FUNCTION and PREDICATE.
	-- Where O_ represents open arguments (i.e. arguments which are delayed).
	--

insert
	ANY
		redefine
			is_equal
		end
	
feature {ANY}
	call (o: O_) is
			-- Call feature with all its operands, using `o' for the open operands.
		external "built_in"
		end

	is_equal (other: like Current): BOOLEAN is
		external "built_in"
		end

end -- class ROUTINE
