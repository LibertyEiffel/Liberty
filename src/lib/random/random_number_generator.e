deferred class RANDOM_NUMBER_GENERATOR
	--
	-- Common abstract definition of a random number generator.
	-- The SmartEiffel library provides two implementations: MINIMAL_RANDOM_NUMBER_GENERATOR, and 
	-- PRESS_RANDOM_NUMBER_GENERATOR. Most applications can safely rely on MINIMAL_RANDOM_NUMBER_GENERATOR. 
	-- If you really need high quality randomizing, consider PRESS_RANDOM_NUMBER_GENERATOR. 
	--
	
feature {ANY}
	make is
			-- Create (or reset) the random number generator with an automatic hazardous setting of the 
			-- `seed_value' based on the CPU clock.
			--
			-- See also `with_seed'.
		deferred
		end

	with_seed (seed_value: INTEGER) is
			-- Create (or reset) the random number generator with an explicit `seed_value'.
			-- By using and explicit `seed_value', one can replay more than once the very same hasardous 
			-- sequence.
			--
			-- See also `make'.
		deferred
		end

	next is
			-- Prepare the next random number in sequence.
			-- Change internal memory of `Current' in order to prepare the next random number in sequence.
			--
			-- See also `last_real', `last_integer'.
		deferred
		end

	last_real: REAL is
			-- The last computed number in range 0.0 to 1.0 excluded (see ensure).
			-- Internal memory is not changed and two calls will give the same `Result'. 
			-- Use `next' to get a new random `last_real' value.
			--
			-- See also `last_integer'.
		deferred
		ensure
			Result > 0 and Result <= 1
		end

	last_integer (n: INTEGER): INTEGER is
			-- The last computed number in range 1 to `n'(see ensure).
			-- Internal memory is not changed and two calls will give the same `Result'. 
			-- Use `next' to get a new random `last_integer' value.
			--
			-- See also `last_real'.
		require
			n >= 1
		deferred
		ensure
			1 <= Result and Result <= n
		end

feature {}
	clock_based_random_seed: INTEGER is
			-- Some positive random value to be used as a seed which may change as much as possible in a random 
			-- way.
		local
			clock: CLOCK; microsecond_time: MICROSECOND_TIME
		do
			from
				microsecond_time.update
				Result := microsecond_time.microsecond #+ clock.value
			until
				Result > 0
			loop
				microsecond_time.update
				Result := ~Result #+ microsecond_time.microsecond
			end
		ensure
			Result > 0
		end
	
end -- class RANDOM_NUMBER_GENERATOR
