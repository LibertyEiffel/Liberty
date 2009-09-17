deferred class GEN_RAND

obsolete "In release 2.3, the new name for this class is RANDOM_NUMBER_GENERATOR.%N%
         %Update your code. (January 10th 2006.)%N"
			
	
feature {ANY} -- Creation procedures:
	make is
			-- Create the generator with an automatic hazardous setting of
			-- the `seed_value'.
			-- Because automatic setting may be done using internal address
			-- of Current for example, it may produces platform dependent
			-- behavior or compilation-mode dependant behavior.
			-- Also consider `with_seed' to chose the most appropriate.
		deferred
		end

	with_seed (seed_value: INTEGER) is
			-- Create the generator with an explicit `seed_value'.
		deferred
		end

feature {ANY}
	next is
			-- Compute next random number in sequence.
		deferred
		end

feature {ANY} -- No modifications:
	last_double: REAL is
			-- Look at the last computed number.
			-- Range 0 to 1
		obsolete "Use `last_real' instead (nov 4th 2004)."
		do
			Result := last_real
		ensure
			Result > 0 and Result <= 1
		end

	last_real: REAL is
			-- Look at the last computed number.
			-- Range 0 to 1
		deferred
		ensure
			Result > 0 and Result <= 1
		end

	last_integer (n: INTEGER): INTEGER is
			-- Look the last computed number.
			-- Range 1 to `n'.
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
			-- Trying first the CPU clock value:
			Result := clock.value
			if Result <= 0 then
				-- So we try something else:
				microsecond_time.update
				Result := microsecond_time.microsecond
			end
		ensure
			Result > 0
		end
	
end -- class GEN_RAND
