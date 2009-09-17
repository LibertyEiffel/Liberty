deferred class HASH_TABLE_SIZE
	--
	-- Some useful features to deal with prime INTEGER values in order to
	-- select an appropriate size for some hash table (used for example
	-- by the DICTIONARY class as well as by the SET class).
	--

insert
	PLATFORM
		undefine copy, is_equal end

feature {}
	prime_number_ceiling (integer: INTEGER_32): INTEGER_32 is
			-- A good prime number, large enough, and no smaller than `integer'.
		require
			is_positive: integer >= 0
		do
			if integer <= 98317 then
				if integer <= 769 then
					if integer <= 53 then
						if integer <= 11 then
							Result := 11
						elseif integer <= 23 then
							Result := 23
						else
							Result := 53
						end
					else
						if integer <= 193 then
							if integer <= 97 then
								Result := 97
							else
								Result := 193
							end
						else
							if integer <= 389 then
								Result := 389
							else
								Result := 769
							end
						end
					end
				else
					if integer <= 12289 then
						if integer <= 3079 then
							if integer <= 1543 then
								Result := 1543
							else
								Result := 3079
							end
						else
							if integer <= 6151 then
								Result := 6151
							else
								Result := 12289
							end
						end
					else
						if integer <= 24593 then
							Result := 24593
						elseif integer <= 49157 then
							Result := 49157
						else
							Result := 98317
						end
					end
				end
			else
				if integer <= 12582917 then
					if integer <= 1572869 then
						if integer <= 393241 then
							if integer <= 196613 then
								Result := 196613
							else
								Result := 393241
							end
						else
							if integer <= 786433 then
								Result := 786433
							else
								Result := 1572869
							end
						end
					else
						if integer <= 3145739 then
							Result := 3145739
						elseif integer <= 6291469 then
							Result := 6291469
						else
							Result := 12582917
						end
					end
				else
					if integer <= 201326611 then
						if integer <= 50331653 then
							if integer <= 25165843 then
								Result := 25165843
							else
								Result := 50331653
							end
						else
							if integer <= 100663319 then
								Result := 100663319
							else
								Result := 201326611
							end
						end
					else
						if integer <= 805306457 then
							if integer <= 402653189 then
								Result := 402653189
							else
								Result := 805306457
							end
						else
							if integer <= 1610612741 then
								Result := 1610612741
							else
								-- Oddly enough 2^31-1 *is* a prime (it is a "Marsenne prime")
								-- http://en.wikipedia.org/wiki/Mersenne_prime
								Result := 2147483647
							end
						end
					end
				end
			end
		ensure
			Result >= integer.max(1)
		end

feature {} -- Capacity management: ideally we try to keep the dictionary less than 2/3rd filled
	prime_capacity (a_capacity: INTEGER_32): INTEGER_32 is
		require
			a_capacity > 0
		do
			Result := a_capacity #+ (a_capacity #// 2)
			if Result > 0 then
				Result := prime_number_ceiling(Result)
			else
				Result := prime_number_ceiling(Maximum_integer)
			end
		ensure
			Result >= a_capacity
		end

	should_increase_capacity (a_capacity, a_count: INTEGER_32): BOOLEAN is
		do
			Result := a_count > ((a_capacity #// 3) #* 2) and then a_capacity < Maximum_integer
		end

end -- class HASH_TABLE_SIZE
