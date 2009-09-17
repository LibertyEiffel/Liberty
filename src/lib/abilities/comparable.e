deferred class COMPARABLE
	--
	-- All classes handling COMPARABLE objects with a total order relation
	-- should inherit from this class.
	--

insert
	ANY
		redefine is_equal
		end

feature {ANY}
	is_equal (other: like Current): BOOLEAN is
		do
			Result := not (Current < other) and then not (other < Current)
		ensure then
			trichotomy: Result = (not (Current < other) and not (other < Current))
		end

	infix "<" (other: like Current): BOOLEAN is
			-- Is `Current' strictly less than `other'?
			--
			-- See also `>', `<=', `>=', `min', `max'.
		require
			other_exists: other /= Void
		deferred
		ensure
			asymmetric: Result implies not (other < Current)
		end

	infix "<=" (other: like Current): BOOLEAN is
			-- Is `Current' less than or equal `other'?
			--
			-- See also `>=', `<', `>', `min', `max'.
		require
			other_exists: other /= Void
		do
			Result := not (other < Current)
		ensure
			definition: Result = (Current < other or is_equal(other))
		end

	infix ">" (other: like Current): BOOLEAN is
			-- Is `Current' strictly greater than `other'?
			--
			-- See also `<', `>=', `<=', `min', `max'.
		require
			other_exists: other /= Void
		do
			Result := other < Current
		ensure
			definition: Result = (other < Current)
		end

	infix ">=" (other: like Current): BOOLEAN is
			-- Is `Current' greater than or equal than `other'?
			--
			-- See also `<=', `>', `<', `min', `max'.
		require
			other_exists: other /= Void
		do
			Result := not (Current < other)
		ensure
			definition: Result = (other <= Current)
		end

	in_range (lower, upper: like Current): BOOLEAN is
			-- Return True if `Current' is in range [`lower'..`upper']
			--
			-- See also `min', `max', `compare'.
		do
			Result := Current >= lower and then Current <= upper
		ensure
			Result = (Current >= lower and Current <= upper)
		end

	compare, three_way_comparison (other: like Current): INTEGER is
			-- If current object equal to `other', 0
			-- if smaller,  -1; if greater, 1.
			--
			-- See also `min', `max', `in_range'.
		require
			other_exists: other /= Void
		do
			if Current < other then
				Result := -1
			elseif other < Current then
				Result := 1
			end
		ensure
			equal_zero: Result = 0 = is_equal(other)
			smaller_negative: Result = -1 = (Current < other)
			greater_positive: Result = 1 = (Current > other)
		end

	min (other: like Current): like Current is
			-- Minimum of `Current' and `other'.
			--
			-- See also `max', `in_range'.
		require
			other /= Void
		do
			if Current <= other then
				Result := Current
			else
				Result := other
			end
		ensure
			Result <= Current and then Result <= other
			compare(Result) = 0 or else other.compare(Result) = 0
		end

	max (other: like Current): like Current is
			-- Maximum of `Current' and `other'.
			--
			-- See also `min', `in_range'.
		require
			other /= Void
		do
			if Current >= other then
				Result := Current
			else
				Result := other
			end
		ensure
			Result >= Current and then Result >= other
			compare(Result) = 0 or else other.compare(Result) = 0
		end

end -- class COMPARABLE
