deferred class ENUM
	-- A wrapper for an enumeration

feature 
	value: INTEGER
	is_valid: BOOLEAN is deferred end

invariant is_valid

end -- class ENUM
