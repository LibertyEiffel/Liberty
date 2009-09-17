deferred class NUMERIC
	--
	-- This class describes a ring.
	--

inherit
	HASHABLE -- *** Here ? Weird ! *** 3th feb 2006 *** Fred + Guillem + Dom ***

feature {ANY}
	infix "+" (other: like Current): like Current is
			-- Sum with `other' (commutative).
		deferred
		end

	infix "-" (other: like Current): like Current is
			-- Result of substracting `other'.
		deferred
		end

	infix "*" (other: like Current): like Current is
			-- Product by `other'.
		deferred
		end

	infix "/" (other: like Current): NUMERIC is
			-- Division by `other'.
		require
			other /= Void
			divisible(other)
		deferred
		end

	prefix "+": like Current is
			-- Unary plus of `Current'.
		deferred
		end

	prefix "-": like Current is
			-- Unary minus of `Current'.
		deferred
		end

	divisible (other: like Current): BOOLEAN is
			-- May `Current' be divided by `other' ?
		require
			other /= Void
		deferred
		end

	one: like Current is
			-- Neutral element for "*" and "/".
		deferred
		end

	zero: like Current is
			-- Neutral element for "+" and "-".
		deferred
		end

	sign: INTEGER_8 is
			-- Sign of Current (0 -1 or 1).
		deferred
		ensure
			Result.in_range(-1, 1)
		end

end -- class NUMERIC
