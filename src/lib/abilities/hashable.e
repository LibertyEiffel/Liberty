deferred class HASHABLE
	--
	-- Ancestor class for all hashable objects.
	--
	-- For example, the `hash_code' is needed for HASHED_DICTIONARY and for HASHED_SET.  Thus, most standard
	-- objects are HASHABLE (STRING, REAL, INTEGER_8, INTEGER_16, INTEGER_32, INTEGER_64, POINTER, NUMBER,
	-- MUTABLE_BIG_INTEGER, and so forth).
	--

insert
	ANY
		redefine is_equal
		end

feature {ANY}
	hash_code: INTEGER is
			-- The hash-code value of `Current'.
		deferred
		ensure
			good_hash_value: Result >= 0
		end

	is_equal (other: like Current): BOOLEAN is
		deferred
		ensure then
			Result implies hash_code = other.hash_code
		end

end -- class HASHABLE
