deferred class ENUM
	-- A wrapper for an enumeration

feature 
	is_valid: BOOLEAN is 
			-- Is the value of the enumeration valid?
		deferred 
		end

feature {WRAPPER_HANDLER}
	value: INTEGER
			-- The current value of the enumeration.

	set_value (a_value: INTEGER) is
		do
			value:=a_value
		end
invariant is_valid

end -- class ENUM
