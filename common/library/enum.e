deferred class ENUM
	-- A wrapper for an enumeration

feature 
	is_valid: BOOLEAN is 
			-- Is the value of the enumeration valid?
		do
			Result := is_valid_value(value)
		end

		
feature {WRAPPER_HANDLER}
	value: INTEGER
			-- The current value of the enumeration.

	set_value (a_value: INTEGER) is
		require is_valid_value(a_value)
		do
			value:=a_value
		end

	is_valid_value (a_value: INTEGER): BOOLEAN is
			-- Can `a_value' be used in a `set_value' feature call?
		deferred
		end
invariant is_valid

end -- class ENUM
